FROM ubuntu:26.04

COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

RUN apt update \
	&& apt install -y \
	sudo gcc neovim starship tmux git curl

RUN useradd -m -s /bin/bash marcopist \
	&& usermod -aG sudo marcopist \
	&& echo "marcopist ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER marcopist
WORKDIR /home/marcopist

RUN curl https://sh.rustup.rs -sSf | sh -s -- -y

ENV PATH="/home/marcopist/.cargo/bin:${PATH}"
