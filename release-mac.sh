#!/bin/bash

cd ../speedketchup
cargo b --release --target x86_64-apple-darwin --target aarch64-apple-darwin
cd -
lipo -create -output bin/speedketchup-macos ../speedketchup/target/x86_64-apple-darwin/release/speedketchup ../speedketchup/target/aarch64-apple-darwin/release/speedketchup

