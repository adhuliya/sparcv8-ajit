
#include <cortos_locks.h>

uint8_t* lockStartAddr   = {{ confObj.software. }};
uint8_t* lockStartAddrNc = {{ confObj.software. }}; // non-cacheable
char allocatedLocks[CORTOS_MAX_LOCKS];
char allocatedLocksNc[CORTOS_MAX_LOCKS]; // non-cacheable
uint8_t* cortos_reservedLockAddr;

void cortos_initLocks() {
  allocatedLocksNc[0] = 1;
  cortos_reservedLockAddr = lockStartAddrNc;
}

uint8_t* cortos_reserveLock(uint32_t nc) {
  int i = 0;
  char* resArr = nc ? allocatedLocksNc : allocatedLocks;
  unit8_t* lockAddr = nc ? lockStartAddrNc : lockStartAddr;

  cortos_lock_acquire_buzy(cortos_reservedLockAddr);

  for (; i < CORTOS_MAX_LOCKS; ++i) {
    if(resArr[i] == 0) {
      resArr[i] = 1;
      break;
    }
  }

  cortos_lock_release(cortos_reservedLockAddr);
  return lockAddr + i;
}

void cortos_freeLock(uint8_t *lock) {
  if (lock >= lockStartAddr && lock < (lockStartAddr + CORTOS_MAX_LOCKS)) {
    cortos_lock_acquire_buzy(cortos_reservedLockAddr);
    allocatedLocks[lock - lockStartAddr] = 0;
    cortos_lock_release(cortos_reservedLockAddr);
  } else {
    cortos_lock_acquire_buzy(cortos_reservedLockAddr);
    allocatedLocksNc[lock - lockStartAddrNc] = 0;
    cortos_lock_release(cortos_reservedLockAddr);
  }
}

