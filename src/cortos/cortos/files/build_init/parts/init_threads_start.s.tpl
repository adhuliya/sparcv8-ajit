
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

{{prog.thread.genLabelForCortosLoop()}}:

% for calleeName in prog.callSeq:
  call {{calleeName}}
  nop
% end

  ba {{prog.thread.genLabelForCortosLoop()}}
  nop

% end

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! BLOCK END  : threads_user_logic
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
