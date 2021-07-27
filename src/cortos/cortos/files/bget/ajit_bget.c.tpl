// Main function to manage bget library.
// It provides a msg queue based communication to the bget library.

% baseAddr = confObj.reservedMem.ajitBgetMemory.startAddr
% memSize = confObj.reservedMem.ajitBgetMemory.sizeInBytes

#include "bget.h"
#include "ajit_cortos.h"

int __mem_allocated = 0;

void __ajit_bpool() {
  if (__mem_allocated == 0) {
    // this if condition enters only once.
    ajit_res_lock_acquire_buzy({{bgetLockIndex}});

    bpool({{baseAddr}}, {{memSize}});

    ajit_res_lock_release({{bgetLockIndex}});

    __mem_allocated = 1;
  }
}


// get/allocate a memory of `size` bytes
void *ajit_bget(ajit_bufsize size) {
  void *base = 0;
  ajit_res_lock_acquire_buzy({{bgetLockIndex}});

  base = bget(size);

  ajit_res_lock_release({{bgetLockIndex}});

  return base;
}


// release/free an allocated memory chunk
void ajit_brel(void *buf) {
  ajit_res_lock_acquire_buzy({{bgetLockIndex}});

  brel(buf);

  ajit_res_lock_release({{bgetLockIndex}});
}

