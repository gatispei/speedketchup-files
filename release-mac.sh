#!/bin/bash

cd ../speedketchup
cargo b --release --target x86_64-apple-darwin --target aarch64-apple-darwin
cd -
cp ../speedketchup/target/aarch64-apple-darwin/release/speedketchup bin/speedketchup-macos-aarch64
cp ../speedketchup/target/x86_64-apple-darwin/release/speedketchup bin/speedketchup-macos-x64
lipo -create -output bin/speedketchup-macos bin/speedketchup-macos-aarch64 bin/speedketchup-macos-x64

