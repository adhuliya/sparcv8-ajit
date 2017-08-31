# Notes:
# asm program file = main.s
# results file     = main.results
#
# USAGE:
# make				equivalent to `make test`
# make test			clean temporaries, compile, and then run
# make compile		compiles the assembly file into elf
# make run			runs the elf file generated (compile first)

MAIN = main

.DEFAULT: test
.PHONY: run compile test clean msg

test: | compile msg run

clean: cleancompile cleanrun

run: cleanrun
	./run $(MAIN)
	cat $(MAIN).log

cleanrun:
	$(RM) *.log *.wtrace

compile: cleancompile
	./compile $(MAIN)

cleancompile:
	$(RM) -R *.elf *.hex *.mmap *.obj *.vars sparc-assembly sparc-obj

msg:
	echo "\nAD**************** compile done *********************"


