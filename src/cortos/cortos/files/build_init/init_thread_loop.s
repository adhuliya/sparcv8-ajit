
! put a thread into a loop
{{ajitThreadLoopLabel}}:
  nop
  nop
  ba {{ajitThreadLoopLabel}}
  nop

