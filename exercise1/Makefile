#KADAI
NETLIST    = decoder.vhd high3.vhd kadai.vhd
TESTBENCH  = testbench.vhd
NAME       = TBGATE

#Library Flags
SYNOSPSYS = --ieee=synopsys
#MENTOR    = --ieee=mentor
EXPLICIT  = -fexplicit

all: clean lint analyze elab run

lint: $(wildcard *.vhd)
	ghdl -s $(SYNOSPSYS) $(EXPLICIT) $(NETLIST) $(TESTBENCH)
analyze: $(wildcard *.vhd)
	ghdl -a $(SYNOSPSYS) $(EXPLICIT) $(NETLIST) $(TESTBENCH)
elab: $(wildcard *.vhd)
	ghdl -e $(SYNOSPSYS) $(EXPLICIT) $(NAME)
run: $(wildcard *.vhd)
	  ghdl -r $(SYNOSPSYS) $(EXPLICIT) $(NAME) --vcd=$(NAME).vcd
clean:
	rm -f *.cf *.vcd *.o
