/** Allocate memory and share between two threads. */

#include<math.h>
#include "cortos.h"

#define SIZE 80

int b;
int *i0 = SHARED_INT_ADDR_0;
int *i1 = SHARED_INT_ADDR_1;
int totalMsgs = 4;
int *arr = 0;

CortosMessage msg1;
CortosMessage msg2;


void main() {} // important, but keep empty.

void cortos_entry_func_001() {
  int *a = (int*)cortos_bget(sizeof(int) * 20);
  if (a == 0) {
    CORTOS_ERROR("Memory not allocated!");
    a = 1;  // to make the other thread terminate
  }
  a[0] = 10;
  a[19] = 11;
  arr = a;
  CORTOS_TRACE("Thread 0,0 finished!");
  cortos_exit(0); // safely exit
}

void cortos_entry_func_010() {
  return;
}

void cortos_entry_func_101() {
  while(arr==0);
  *i0 = arr[0];
  *i1 = arr[19];
  cortos_brel(arr);
  CORTOS_TRACE("Thread 0,1 finished!");
  cortos_exit(0); // safely exit
}

void cortos_entry_func_110() {
  return;
}


