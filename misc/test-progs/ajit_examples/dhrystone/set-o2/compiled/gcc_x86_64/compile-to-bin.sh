# generate final executable xfiles
# make sure that assembly xfiles are pre-generated
gcc -g -c -DHZ=50 -DDHRYOPT  utils.s
gcc -g -c -DHZ=50   dhry_1.s
gcc -g -c  -DHZ=50  dhry_2.s
gcc -g -o dhrystone dhry_1.o dhry_2.o utils.o
