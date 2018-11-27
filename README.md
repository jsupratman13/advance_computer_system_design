# FPGA course 2018
Written in VHDL

## ghdl installation on Ubuntu 16.04
```
sudo apt install libgnat-4.9
sudo apt install gtkwave
wget https://github.com/ghdl/ghdl/releases/download/v0.33/ghdl_0.33-1jessie1_amd64.deb
sudo dpkg --install ghdl_0.33-1jessie1_amd64.deb
```

## compile
* Enter directory of one of the exercise
```
make
```
* To make your own Makefile, replace the following with your own source files:
  * List your main source files in the `NETLIST`
  * Write your test bench file name in the `TESTBENCH`
  * Write your test bench entity name in the `NAME`

## simulate
```
gtkwave <filename>.vcd
```
