FROM python:3.11.2-bullseye

RUN apt-get update \
    && apt-get install -y cmake build-essential pkg-config libgoogle-perftools-dev

COPY . /app

WORKDIR /app

RUN cd chat \
    && curl -OL "https://the-eye.eu/public/AI/models/nomic-ai/gpt4all/gpt4all-lora-quantized.bin"

RUN python -m pip install -r requirements.txt \
    && cd transformers \
    && pip install -e . \
    && cd ../peft \
    && pip install -e .
