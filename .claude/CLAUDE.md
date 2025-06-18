# Operating-system dependent tools

## gsed instead of sed on macOS

When running on macOS used gsed instead of sed. Claude assumes that its running
GNU sed and executes commands like `sed -i`, but that command line option is
not known by the macOS native `sed`. Instead use `gsed` if it is installed or
suggest to the user to install it using homebrew.

# Language specific preferences

- Rust: @./rust_instructions.md
