#!/bin/bash

iverilog adder.v -o add
iverilog decoder.v -o decode
iverilog multiplexer.v -o multi

(echo 'Adder results'; ./add; echo; echo 'Decoder results'; ./decode; echo; echo 'Multiplexor results'; ./multi) > results.txt

rm add decode multi
