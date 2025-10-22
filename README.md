# ENGR 330 - Exam 2 - Nathanael A. Yilma

This is my project for Exam 2 and here I made three different adders RCA, CLA, and Prefix in SystemVerilog to compare them.

## What adders I made

* **RCA:** The basic ripple carry one. Its pretty simple but kinda slow. Uses the `fulladder.sv`.
* **CLA:** The Carry lookahead adder. Made out of 4 bit blocks (`cla_4bit.sv`) that look ahead but its still ripples between blocks
* **Prefix:** The fastest one which uses the parallel tree thing. Uses `pg_combine.sv`.

## Folders

* `adder_rtl/`: Has all the adder `.sv` files
* `tb/`: Got the tb (`tb_adders.sv`) in here.
* `synth/`: Has the `measure.sh` script (this just shows how I ran the synthesis).
* `results/`: Put the `results.md` file in here with the LUT/delay numbers.
* `README.md`: Ya here right now
* `.gitignore`: Tells git to ignore the Vivado files

## How to run the simulation

1.  Open the project in vivado (its in the `adder_test` folder).
2.  Make sure `tb_adders.sv` is the top sim file.
3.  Then click the run simulation button (Behavioral Simulation).
4.  Look at the TCL console and should test 8, 16, 32, 64 bits and say "testing done" at the end.

## How to get the synthesis numbers

1.  Basically just followed the steps in `synth/measure.sh`.
2.  For each adder and size: Set it as top, then set N in settings, then run synthesis, then check the reports for LUTs and delays.
3.  All the numbers I got are in `results/results.md`.