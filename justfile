init:
	git init
	git add .
	git commit -m "init"
	git branch -M main
	git remote add origin git@github.com:rust-learn-days/{{project-name}}.git
	pip install pre-commit
	cargo install --locked cargo-deny
	cargo install typos-cli
	cargo install git-cliff
	cargo install cargo-nextest --locked
	cargo install cross --git https://github.com/cross-rs/cross
	pre-commit install
	sed -i '' 's#rust-learn-days/template#rust-learn-days/{{project-name}}#g' cliff.toml


build:
    cargo build --target  ${target:-x86_64-unknown-linux-musl}

build-release:
    cargo build --release --target  ${target:-x86_64-unknown-linux-musl}

build-all:
    cargo build --target x86_64-unknown-linux-musl
    cargo build --target aarch64-unknown-linux-gnu
    cargo build --target x86_64-apple-darwin
    cargo build --target aarch64-apple-darwin
    cargo build --target x86_64-pc-windows-msvc


install:
    rustup target add x86_64-unknown-linux-musl
    rustup target add x86_64-apple-darwin
    rustup target add x86_64-pc-windows-msvc
    rustup target add aarch64-unknown-linux-gnu
    rustup target add aarch64-apple-darwin
