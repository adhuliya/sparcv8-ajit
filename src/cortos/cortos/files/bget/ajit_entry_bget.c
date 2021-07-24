// Main function to manage bget library.
// It provides a msg queue based communication to the bget library.

#include "bget.h"

int initialized = 0;

void ajit_entry_bget() {
  if (initialized == 0) {
    // this if condition enters only once.
    bpool(AJIT_BGET_MALLOC_BASE, {ajitMallocAreaSize});
    initialized = 1;
  }
}