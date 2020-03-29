FROM ubuntu:18.04

RUN apt update \
 && apt install -y --no-install-recommends \
    conntrack \
 && apt -y clean \
 && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["conntrack"]