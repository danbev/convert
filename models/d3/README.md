---
license: apache-2.0
pipeline_tag: image-text-to-text
tags:
- gguf
- quantized
- decision-model
base_model:
- vllm-sr/d3
---

# d3

Run with https://llama.app

```bash
llama serve -hf __owner__/d3-GGUF
```

This is a decision model, to be used via `/v1/systemone` API. See https://github.com/ggml-org/llama.cpp/pull/30383

### Source models
- https://huggingface.co/vllm-sr/d3

> [!IMPORTANT]
> This model is automatically converted using https://github.com/ggml-org/convert
