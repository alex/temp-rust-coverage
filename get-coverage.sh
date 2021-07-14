#!/bin/sh

set -ex

env RUSTFLAGS="-Zinstrument-coverage" cargo +nightly test
llvm-profdata merge -sparse default.profraw -o default.profdata
llvm-cov show $(env RUSTFLAGS="-Zinstrument-coverage" cargo +nightly test --tests --no-run --message-format=json | jq -r "select(.profile.test == true) | .filenames[]") -instr-profile=default.profdata --ignore-filename-regex='/.cargo/registry' --ignore-filename-regex='/.rustup/toolchains/'

