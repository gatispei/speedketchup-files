#!/bin/bash

cd ../speedketchup
cargo b --release --target x86_64-unknown-linux-musl --target x86_64-pc-windows-gnu --target arm-unknown-linux-musleabi
cd -

cp ../speedketchup/target/x86_64-pc-windows-gnu/release/speedketchup.exe bin
cp ../speedketchup/target/x86_64-unknown-linux-musl/release/speedketchup bin
cp ../speedketchup/target/arm-unknown-linux-musleabi/release/speedketchup bin/speedketchup-arm
