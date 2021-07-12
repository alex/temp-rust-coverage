#!/bin/sh

set -ex

rm -rf ./target/debug/deps/t-*
env RUSTFLAGS="-Zinstrument-coverage" cargo +nightly test
llvm-profdata merge -sparse default.profraw -o default.profdata
llvm-cov show ./target/debug/deps/t-21abf5afe7bac333 -instr-profile=default.profdata --ignore-filename-regex='/.cargo/registry' --ignore-filename-regex='/.rustup/toolchains/'

