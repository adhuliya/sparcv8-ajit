
#ifndef CORTOS_LOCKS_H
#define CORTOS_LOCKS_H

////////////////////////////////////////////////////////////////////////////////
// BLOCK START: cortos_locking_declarations
////////////////////////////////////////////////////////////////////////////////

// Usage Note:
// cortos_lock_acquire_buzy(<index: an-integer-index>);
//   CRITICAL_SECTION_CODE...
// cortos_lock_release(<index: an-integer-index>);
// ----or-------or--------
// status = cortos_lock_acquire(<index: an-integer-index>);
// if (status == 1) {
//   CRITICAL_SECTION_CODE...
//   cortos_lock_release(<index: an-integer-index>);
// }

// NOTE: Use the same index to synchronize two or more threads.

int cortos_lock_acquire_buzy(int index);
int cortos_lock_acquire(int index);
void cortos_lock_release(int index);

// Cacheable locks
int cortos_lock_acquire_buzy_cacheable(int index);
int cortos_lock_acquire_cacheable(int index);
void cortos_lock_release_cacheable(int index);

// Reserve an unused lock variable id from cortos.
//   It returns the lock variable id of the lock reserved.
//   If no lock is available it returns -1.
// Once a lock is reserved it is held by the caller,
// until it is freed.
int cortos_reserveLockVar();

// Free a lock variable for reuse by cortos.
void cortos_freeLockVar(int lockId);

// Similar to the above two API's but for cacheable locks.
int cortos_reserveLockVar_cacheable();
void cortos_freeLockVar_cacheable(int lockId);

////////////////////////////////////////////////////////////////////////////////
// BLOCK END  : cortos_locking_declarations
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// BLOCK START: cortos_locking_declarations_internal
////////////////////////////////////////////////////////////////////////////////

int __cortos_lock_acquire_buzy(int index);
int __cortos_lock_acquire(int index);
void __cortos_lock_release(int index);

#define __RES_LOCK_INDEX_BGET 0
#define __RES_LOCK_INDEX_PRINTF 1
#define __RES_LOCK_GET_Q_ID 2
#define __RES_LOCK_GET_LOCK_ID 3

////////////////////////////////////////////////////////////////////////////////
// BLOCK END  : cortos_locking_declarations_internal
////////////////////////////////////////////////////////////////////////////////



#endif CORTOS_LOCKS_H
