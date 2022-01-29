/** Allocate memory and communicate via queue.
*/
#include <math.h>
#include <cortos.h>

#define SIZE 20

CortosMessage msg1;
CortosMessage msg2;

void main() {} // important, but keep empty.

void cortos_entry_func_001() {
  // allocate memory and write data
  CORTOS_DEBUG("Acquiring Memory!");
  uint32_t *arr = (uint32_t*)cortos_bget(sizeof(uint32_t) * SIZE);
  arr[0]      = 0xF0;
  arr[SIZE-1] = 0x0F;

  CORTOS_TRACE("This will not get logged.");

  // send message
  msg1.a_code = 1;
  msg1.a_ptr = arr;

  CORTOS_DEBUG("Sending Message!");
  cortos_writeMessage(0, &msg1);

  cortos_exit(0); //safely exit
}

void cortos_entry_func_010() {
  /* do something */
  return;
}

void cortos_entry_func_101() {
  // wait for a message
  while(!cortos_readMessage(0, &msg2));

  CORTOS_DEBUG("Received Message!");

  // process the message
  uint32_t *arr = (uint32_t*)msg2.a_ptr;
  uint32_t i0, i1;
  i0 = arr[0];
  i1 = arr[SIZE-1];

  CORTOS_DEBUG("Releasing Memory!");
  // release the memory
  cortos_brel(msg2.a_ptr);

  cortos_exit(i0+i1); //safely exit
}

void cortos_entry_func_110() {
  /* do something */
  return;
}
