Running C and A models and on FPGA using the ahir and ajit_release (folders) kept in /usr/local of machines 10.107.90.62-64

	* Setup the environment
		
		cd /usr/local/ajit_release
		source ajit_bashrc 
		cd /usr/local/ahir
		source ahir_bashrc 

	* Running C model

		* Go to the directory where examples are kept
			cd /home/anshuman/ajit_examples/dhrystone/compiled
		* Generate memory map files
			./compile_for_ajit.sh |& tee compileLog.txt 	
		* Run the C model
		  ajit_C_system_model -m dhry.mmap -w dhry.wtrace -d -r dhry.results -l dhry.log

	* Running vhdl model
		ajit_chip_simplified_vhdl_sim_testbench -m dhry.mmap -M -F -v
