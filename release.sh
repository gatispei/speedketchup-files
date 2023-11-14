#!/bin/bash

cd ../speedketchup
cargo b --release --target x86_64-unknown-linux-musl --target x86_64-pc-windows-gnu --target arm-unknown-linux-musleabi --target aarch64-unknown-linux-musl
cd -

cp ../speedketchup/target/x86_64-unknown-linux-musl/release/speedketchup bin/speedketchup-x64
cp ../speedketchup/target/aarch64-unknown-linux-musl/release/speedketchup bin/speedketchup-aarch64
cp ../speedketchup/target/arm-unknown-linux-musleabi/release/speedketchup bin/speedketchup-arm
cp ../speedketchup/target/x86_64-pc-windows-gnu/release/speedketchup.exe bin/speedketchup-x64.exe

upx -o bin/speedketchup-x64-upx bin/speedketchup-x64
upx -o bin/speedketchup-aarch64-upx bin/speedketchup-aarch64
upx -o bin/speedketchup-arm-upx bin/speedketchup-arm
upx -o bin/speedketchup-x64-upx.exe bin/speedketchup-x64.exe
