# General Information

The language specification is at http://llhd.io/spec.html#basic-blocks.

# The PLDI Artifact

The source can be found at https://dl.acm.org/do/10.1145/3395654. It includes information
on how to run it in Docker (including LLHD-Blaze, which is only found in the artifact).

# Using it on your own system

To run some of these examples, you need:
    1. The Moore compiler, `moore`, for converting SystemVerilog to llhd
    2. The LLHD simulator, `llhd-sim`

The easiest way to install the tools is from crates.io via `cargo`.

    cargo install moore llhd-sim

However, if you're interesting in running `llhd-check`, `llhd-conv`, or `llhd-opt`, which aren't in the crates repo,
or you want to build `moore` and/or `llhd-sim` yourself:

    git submodule update --init
    cd llhd
    cargo install --path .
    cd ..
    cd moore
    cargo install --path .

If you don't already have Rust installed, do the following beforehand:

    curl https://sh.rustup.rs -sSf | sh

# Running some examples

There are several test SystemVerilog files in `./moore/test/svlog`.

There are also a few examples in `./examples`.

To convert the mini ALU in SystemVerilog to LLHD:

    cd examples
    moore alu.sv -e top > alu.llhd

To run the simulator and generate a waveform file:

    cd examples
    llhd-sim alu.llhd -N 10000 -o alu.vcd