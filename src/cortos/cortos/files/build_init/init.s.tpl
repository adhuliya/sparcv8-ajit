! Top level cortos loop file for each thread.
! This init file links with each program (i.e. each Ajit thread)

% setdefault("funcNames", ["ajit_entry_00"])
% setdefault("addFooterLoop", True)
% setdefault("addFooterTrap", False)
% setdefault("isThread00", False)

% ################### HEADER

.section .text.ajitstart.cortosloop

.global AJIT_CORTOS_THREAD_LOOP

% ################### BODY

! start label of the cortos routine
! this starts at an an address decided by AjitCoRtos
AJIT_CORTOS_THREAD_LOOP:

% if funcNames:
% for funcName in funcNames:
  ! call next function to execute
  call {{funcName}}
  nop

% end
% else:
  ba AJIT_CORTOS_THREAD_LOOP               ! loop here
  nop
% end


% ################### FOOTER

% if addFooterLoop:
  ! loop to the start
  ba AJIT_CORTOS_THREAD_LOOP
  nop
% end

% if addFooterTrap:
  ! trap to stop
  ! wr 0xd, %asr15
  ta 0
% end

