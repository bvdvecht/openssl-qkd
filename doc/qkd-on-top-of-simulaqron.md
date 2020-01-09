# QKD on top of Simulaqron

I implemented the ETSI QKD API in Rust, as a dynamically loaded library. 
The library source can be found here: [openssl-qkd-rust](https://github.com/bvdvecht/openssl-qkd-rust). 
It depends on two other Rust libraries: [qkd-rs](https://github.com/bvdvecht/qkd-rs) and [cqc](https://github.com/bvdvecht/cqc).

The implementation uses the [Simulaqron](https://github.com/SoftwareQuTech/SimulaQron) quantum network simulator to perform a (for now) very simple and naive QKD protocol: one party creates EPR pairs and sends half of each pair to the other party, after which both parties measure their halves to obtain a shared key.
Currently the client and server use hardcoded ports to interface with Simulaqron, and must both be running on localhost.

# Testing
First make sure [Simulaqron](http://www.simulaqron.org/) and [Rust](https://www.rust-lang.org/tools/install) are installed. Then, install the QKD Rust libraries:

~~~
cd ~
mkdir qkd
cd qkd
git clone https://github.com/bvdvecht/cqc.git
git clone https://github.com/bvdvecht/qkd-rs.git
git clone https://github.com/bvdvecht/openssl-qkd-rust.git
cd openssl-qkd-rust
cargo build --release
~~~

Now, the `qkdapi` library (e.g. `libqkdapi.so` on Linux) should be available in `~/qkd/openssl-qkd-rust/target/release/`.

Now you can clone this repo and run the test, which will automatically start Simulaqron with the correct config file.
~~~
git clone https://github.com/bvdvecht/openssl-qkd.git
make
make test
~~~
