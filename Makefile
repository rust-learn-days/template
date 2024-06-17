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
	pre-commit install
	sed -i '' 's#rust-learn-days/template#rust-learn-days/{{project-name}}#g' cliff.toml

build:
	cargo build --release --target x86_64-unknown-linux-musl
