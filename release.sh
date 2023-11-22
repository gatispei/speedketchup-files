#!/bin/bash

cd ../speedketchup
RUST_COMPILER_RT_ROOT=/home/hei/opensource/llvm-project/compiler-rt RUSTFLAGS="-Zlocation-detail=none" cargo +nightly build -Z build-std=std,panic_abort -Z build-std-features=panic_immediate_abort --release \
	 --target x86_64-unknown-linux-musl \
	 --target x86_64-pc-windows-gnu \
	 --target arm-unknown-linux-musleabi \
	 --target aarch64-unknown-linux-musl \
	 --target i686-unknown-linux-musl
cargo build --release \
	 --target mips-unknown-linux-musl \
	 --target mipsel-unknown-linux-musl


#cargo +nightly bloat -Z build-std=std,panic_abort -Z build-std-features=panic_immediate_abort --release -n 100 \
#	 --target x86_64-unknown-linux-musl \

cd -

cp ../speedketchup/target/x86_64-unknown-linux-musl/release/speedketchup bin/speedketchup-x64
cp ../speedketchup/target/i686-unknown-linux-musl/release/speedketchup bin/speedketchup-i686
cp ../speedketchup/target/aarch64-unknown-linux-musl/release/speedketchup bin/speedketchup-aarch64
cp ../speedketchup/target/arm-unknown-linux-musleabi/release/speedketchup bin/speedketchup-arm
cp ../speedketchup/target/x86_64-pc-windows-gnu/release/speedketchup.exe bin/speedketchup-x64.exe
cp ../speedketchup/target/mips-unknown-linux-musl/release/speedketchup bin/speedketchup-mips
cp ../speedketchup/target/mipsel-unknown-linux-musl/release/speedketchup bin/speedketchup-mipsel

rm bin/speedketchup*upx*
~/opensource/upx/build/release/upx --ultra-brute -o bin/speedketchup-x64-upx bin/speedketchup-x64
~/opensource/upx/build/release/upx --ultra-brute -o bin/speedketchup-i686-upx bin/speedketchup-i686
~/opensource/upx/build/release/upx --ultra-brute -o bin/speedketchup-aarch64-upx bin/speedketchup-aarch64
~/opensource/upx/build/release/upx --ultra-brute -o bin/speedketchup-arm-upx bin/speedketchup-arm
~/opensource/upx/build/release/upx --ultra-brute -o bin/speedketchup-x64-upx.exe bin/speedketchup-x64.exe
~/opensource/upx/build/release/upx --ultra-brute -o bin/speedketchup-mips-upx bin/speedketchup-mips
~/opensource/upx/build/release/upx --ultra-brute -o bin/speedketchup-mipsel-upx bin/speedketchup-mipsel
