
  ! A reference example:
  ! set 0x50520100, %l2
  ! subcc %l1, %l2, %g0
  ! bnz SP3
  ! nop

  ! (0,0)=0x50520000, (0,1)=0x50520001, (1,0)=0x50520100, (1,1)=0x50520101, ...
  set {hexString}, %l2
  subcc %l1, %l2, %g0
  bnz {nextLabel}
  nop
