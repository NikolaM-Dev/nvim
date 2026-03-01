# List avalible recipes
default:
    just --list

# Debug plugins
minimal:
    nvim --clean -u ./tests/minimal.lua
