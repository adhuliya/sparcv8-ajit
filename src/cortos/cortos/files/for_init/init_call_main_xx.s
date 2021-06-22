  ! Call the main function of a process,
  ! except (0,0) as (0,0)'s main can be directly called
  ! The address of the entry function of processes is computed by AjitCoRtos.
  call {mainFunctionAddr}
  nop
