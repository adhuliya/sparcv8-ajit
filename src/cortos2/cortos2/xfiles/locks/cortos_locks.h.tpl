
#ifndef CORTOS_LOCKS_H
#define CORTOS_LOCKS_H

////////////////////////////////////////////////////////////////////////////////
// BLOCK START: cortos_locking_declarations
////////////////////////////////////////////////////////////////////////////////

// Usage Note:
// lock = cortos_reserveLockVar(1); // non-cacheable lock
// cortos_lock_acquire_buzy(lock);
//   CRITICAL_SECTION_CODE...
// cortos_lock_release(lock);
// cortos_freeLockVar(lock);
// ----or-------or--------
// lock = cortos_reserveLockVar(1); // non-cacheable lock
// status = cortos_lock_acquire(<lock pointer>);
// if (status == 1) {
//   CRITICAL_SECTION_CODE...
//   cortos_lock_release(<lock pointer>);
// }

// NOTE: Use the same index to synchronize two or more threads.

#define CORTOS_MAX_LOCK_VARS {{ confObj.software.locks.userLocks }}

// For Cacheable/Non-Cacheable Locks
// Reserve an unused lock variable id from cortos.
//   It returns the lock variable id of the lock reserved.
//   If no lock is available it returns -1.
// Once a lock is reserved it is assumed to be held by the caller,
// until it is freed.
uint8_t* cortos_reserveLockVar(uint32_t nc);

// For Cacheable/Non-Cacheable Locks
// Free a lock variable for reuse by cortos.
void cortos_freeLockVar(uint8_t* lock);

// For Cacheable or Non-Cacheable Locks
int cortos_lock_acquire_buzy(uint8_t *lock);
int cortos_lock_acquire(uint8_t *lock);
void cortos_lock_release(uint8_t *lock);

////////////////////////////////////////////////////////////////////////////////
// BLOCK END  : cortos_locking_declarations
////////////////////////////////////////////////////////////////////////////////

#endif CORTOS_LOCKS_H
