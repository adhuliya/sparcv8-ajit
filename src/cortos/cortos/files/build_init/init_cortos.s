! Top level cortos loop file for each thread.

% ################### HEADER

% if notThread00:
.section .text.ajitstart
% end

.global {{cortosStartLabel}}

% ################### BODY

! start label of the cortos routine
! this starts at an an address decided by AjitCoRtos
{{cortosStartLabel}}:

% if funcNames:
% for funcName in funcNames:
  ! call next function to execute
  call {{funcName}}
  nop
% end
% else
  ba {{cortosStartLabel}}               ! loop here
  nop
% end


% ################### FOOTER

% if addFooterLoop:
  ! loop to the start
  ba {{cortosStartLabel}}
  nop
% end

% if addFooterTrap:
  ! trap to stop
  ! wr 0xd, %asr15
  ta 0
% end

