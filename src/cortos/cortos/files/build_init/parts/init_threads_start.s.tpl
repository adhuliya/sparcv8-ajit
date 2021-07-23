
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! BLOCK START: threads_user_logic
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

% for prog in confObj.programs:

{{prog.thread.genLabel(forSetup=False)}}:

  ! (0,0)=0x50520000, (0,1)=0x50520001, (1,1)=0x50520101, ...
  set {{prog.thread.genIdHex()}}, %l2
  subcc %l1, %l2, %g0
  bnz {{confObj.genNextThreadLabel(prog.thread, forSetup=False)}}
  nop

% if prog.isThread00():
  call AJIT_CORTOS_THREAD_LOOP
  nop
% else:
  call {{prog.thread.genLabel(forStart=True)}}
  nop
{{prog.thread.genLabel(forStart=True)}}:
% end

  wr 0xa, %asr16

  ba HALT
  nop

% end

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! BLOCK END  : threads_user_logic
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
