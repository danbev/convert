#!/bin/bash
set -euox pipefail

OUTPUT_DIR="$1"
LLAMA_CPP="$2"

DISPLAY_NAME="Nemotron-Nano-3-30B-A3B"
QUANTIZE="$LLAMA_CPP/build/bin/llama-quantize"

# --- Conversions ---

python3 "$LLAMA_CPP/convert_hf_to_gguf.py" "$PATH_PRIMARY" \
    --outtype bf16 --outfile "$OUTPUT_DIR/${DISPLAY_NAME}.gguf" --model-name "$DISPLAY_NAME"

# --- Quantizations ---

"$QUANTIZE" "$OUTPUT_DIR/${DISPLAY_NAME}.gguf" "$OUTPUT_DIR/${DISPLAY_NAME}-Q8_0.gguf" Q8_0 1>&2
"$QUANTIZE" "$OUTPUT_DIR/${DISPLAY_NAME}.gguf" "$OUTPUT_DIR/${DISPLAY_NAME}-Q4_K_M.gguf" Q4_K_M 1>&2

# --- Produced files ---

# Preserve the established repository name for the BF16 output.
echo "${DISPLAY_NAME}.gguf"        >> "$OUTPUT_DIR/.produced_files"
echo "${DISPLAY_NAME}-Q8_0.gguf"   >> "$OUTPUT_DIR/.produced_files"
echo "${DISPLAY_NAME}-Q4_K_M.gguf" >> "$OUTPUT_DIR/.produced_files"
