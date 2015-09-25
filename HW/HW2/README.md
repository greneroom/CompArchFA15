To run these verilog files, run the `hw2.sh` script.

```
./hw2.sh
```

This creates a file `results.txt` with the test bench results. To view them:

```
cat results.txt
```

This also creates three wave files. If we want to see the `adder` wave-form, for example:

```
gtk-wave adder.vcd
```

Click the TestModule, and drag the wires onto the waveform. More info is available [here]{http://iverilog.wikia.com/wiki/GTKWAVE}

More information is available in the PDF in `tex/hw2.pdf`.
