Reference: https://gpalma.pt/blog/flutter-web-web-assembly/

- Install
    `cargo install --version 0.10.3 wasm-pack`
    `cargo install cargo-generate`

- `export CARGO_NET_GIT_FETCH_WITH_CLI=true`


# Create the new wasm rust-js project
- Create the new project
    `wasm-pack new addition`
    OR
    `cargo generate --git https://github.com/rustwasm/wasm-pack-template.git --name addition`
- Build
    `wasm-pack build -t web`

# Create Rust project
- `cargo new rust-crypto-module`