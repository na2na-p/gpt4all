FROM python:3.11.2-bullseye

WORKDIR /

RUN apt-get update \
    && apt-get install -y cmake build-essential pkg-config libgoogle-perftools-dev

RUN git clone --recurse-submodules https://github.com/na2na-p/gpt4all.git app \
    && cd app \
    && git submodule update --init --recursive \
    && cd chat \
    && curl -OL "https://the-eye.eu/public/AI/models/nomic-ai/gpt4all/gpt4all-lora-quantized.bin"

WORKDIR /app

RUN python -m pip install -r requirements.txt \
    && cd transformers \
    && pip install -e . \
    && cd ../peft \
    && pip install -e .
