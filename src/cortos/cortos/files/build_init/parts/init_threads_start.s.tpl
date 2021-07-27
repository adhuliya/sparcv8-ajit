
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! BLOCK START: threads_user_logic
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

AJIT_START_THREADS:

% for prog in confObj.programs:

{{prog.thread.genLabel(forSetup=False)}}:

  ! (0,0)=0x50520000, (0,1)=0x50520001, (1,1)=0x50520101, ...
  set {{prog.thread.genIdHex()}}, %l2
  subcc %l1, %l2, %g0
  bnz {{confObj.genNextThreadLabel(prog.thread, forSetup=False)}}
  nop

% if prog.isThread00() and confObj.addBget:
  ! acquire memory for bget just once
  call __ajit_bpool
  nop
% end

{{prog.thread.genLabelForCortosLoop()}}:

% for calleeName in prog.callSeq:
  call {{calleeName}}
  nop
% end

% if prog.cortosLoop:
  ba {{prog.thread.genLabelForCortosLoop()}}
  nop
% else:
  ba AJIT_HALT_OKAY
  nop
% end

% end

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! BLOCK END  : threads_user_logic
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
