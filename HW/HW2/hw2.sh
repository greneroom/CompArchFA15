#!/bin/bash

iverilog adder.v -o add
iverilog decoder.v -o decode
iverilog multiplexer.v -o multi

(./add; ./decode; ./multi) > results.txt

rm add decode multi
