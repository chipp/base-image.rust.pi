FROM rust:1.43.0-slim-stretch

RUN rustup target add armv7-unknown-linux-gnueabihf && \
  echo "[build]\ntarget = \"armv7-unknown-linux-gnueabihf\"" > $CARGO_HOME/config

RUN apt-get update && apt-get install -y \
  gcc-arm-linux-gnueabihf && \
  rm -rf /var/lib/apt/lists/*

RUN echo "[target.armv7-unknown-linux-gnueabihf]\nlinker = \"arm-linux-gnueabihf-gcc\"" >> $CARGO_HOME/config

ENV PATH=/usr/local/bin:$CARGO_HOME/bin:$PATH
