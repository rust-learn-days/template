init:
	pip install pre-commit
	cargo install --locked cargo-deny
	cargo install typos-cli
	cargo install git-cliff
	cargo install cargo-nextest --locked
	pre-commit install

install:
	rustup override set nightly
	rustup toolchain list
	rustup target add x86_64-unknown-linux-musl

build:
	cargo build --release --target x86_64-unknown-linux-musl
