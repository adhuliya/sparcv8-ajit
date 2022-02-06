/** A reader-writer test program.

A writer sends four values to the reader.
The reader collects the values and sums them up.
*/

#include <math.h>
#include <cortos.h>

#define TOTAL_MESSAGES 4

void main() {} // important, but kept empty.

void cortos_entry_func_001() {
  uint32_t i, sum = 0;

  for (i = 0; i < TOTAL_MESSAGES; ++i) {
    CORTOS_TRACE("Sending Message %d.", i);
    cortos_writeMessages(CORTOS_QUEUE_BOB, (uint8_t*)&i, 1);
    sum += i;
  }

  cortos_exit(sum);
}

void cortos_entry_func_010() {
  /* do something */
  return;
}

void cortos_entry_func_101() {
  uint32_t sum = 0;
  uint32_t i = 0, value, status;

  while(i < TOTAL_MESSAGES) {
    status = cortos_readMessages(CORTOS_QUEUE_BOB, (uint8_t*)&value, 1);
    if (status) {
      CORTOS_TRACE("Received Message %d: value %d.", i, value);
      sum += value;
      ++i;
    }
  }

  cortos_exit(sum);
}

void cortos_entry_func_110() {
  /* do something */
  return;
}
