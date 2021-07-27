% qHdrs = confObj.reservedMem.ajitQueueHeaders
% qQ = confObj.reservedMem.ajitQueues

#ifndef AJIT_CORTOS_H
#define AJIT_CORTOS_H

////////////////////////////////////////////////////////////////////////////////
// BLOCK START: ajit_locking_declarations
////////////////////////////////////////////////////////////////////////////////

int ajit_lock_acquire_buzy(int index);
int ajit_lock_acquire(int index);
void ajit_lock_release(int index);

// Only for AjitCoRTOS internal use (reserved: hence `_res_` in name.)
int ajit_res_lock_acquire_buzy(int index);
int ajit_res_lock_acquire(int index);
void ajit_res_lock_release(int index);

////////////////////////////////////////////////////////////////////////////////
// BLOCK END  : ajit_locking_declarations
////////////////////////////////////////////////////////////////////////////////



////////////////////////////////////////////////////////////////////////////////
// BLOCK START: ajit_message_queues_declarations
////////////////////////////////////////////////////////////////////////////////

typedef union _AjitMessage32Bytes {
  char arr[32];
  int intArr[8];

  struct {
    int code_a;
    char arr_a[28];
  };

  struct {
    int code_b;
    double d1;
    double d2;
  };

  struct {
    int code_c;
    union _AjitMessage32Bytes *ptr;
  };

  struct {
    int code_d;
    int val[7];
  };

  struct { // for Ajit's Queue Header
    int syncLock;
    int totalMsgs;
    int readIndex;
    int writeIndex;
  };

} AjitMessage;


typedef struct _AjitQueueHeader {
  int totalMsgs; // current total messages
  int readIndex;
  int writeIndex;
  int __;
} AjitQueueHeader;

/*
Sends an AjitMessage.
  - Returns zero if the queue is full.
  - Returns non-zero if the msg was added.
*/
int writeAjitMessage(int queueId, AjitMessage *msg);

/*
Gets an AjitMessage.
  - Returns zero if the queue is empty.
  - Returns non-zero if the msg was put into the *msg location.
*/
int readAjitMessage(int queueId, AjitMessage *msg);


int ajit_q_lock_acquire_buzy(int index);
int ajit_q_lock_acquire(int index);
void ajit_q_lock_release(int index);


#define Q_START_INDEX 0
#define AJIT_Q_BASE {{qQ.startAddr}}
#define AJIT_Q_LEN {{ajitQueueLength}}
#define AJIT_Q_MSG_SIZE {{ajitQueueMsgSize}}

#define AJIT_Q_HEADER_BASE {{qHdrs.startAddr}}
#define AJIT_Q_HEADER_SIZE {{ajitQueueHeaderSize}}

#define GET_MSG_ADDR(_BASE, _INDEX) \
((_BASE) + ((_INDEX) * (AJIT_Q_MSG_SIZE)))

#define INCREMENT_INDEX(_INDEX) \
(((((_INDEX)+1) % AJIT_Q_LEN)) ? \
((((_INDEX)+1) % AJIT_Q_LEN)) : Q_START_INDEX)

/*
This computes the base address of the queue with id `queueId`.
*/
#define GET_Q_ADDR(_Q_ID) \
((AJIT_Q_BASE) + \
((AJIT_Q_MSG_SIZE) * (AJIT_Q_LEN) * (_Q_ID)));

/*
This computes the base address of the queue header with id `queueId`.
*/
#define GET_Q_HEADER_ADDR(_Q_ID) \
((AJIT_Q_HEADER_BASE) + \
((AJIT_Q_HEADER_SIZE) * (_Q_ID)));

////////////////////////////////////////////////////////////////////////////////
// BLOCK END  : ajit_message_queues_declarations
////////////////////////////////////////////////////////////////////////////////



////////////////////////////////////////////////////////////////////////////////
// BLOCK START: ajit_bget_declarations
////////////////////////////////////////////////////////////////////////////////

typedef long ajit_bufsize;

// This function is called only once by AjitCoRTOS.
void __ajit_bpool(void);

// get/allocate a memory of `size` bytes
void *ajit_bget(ajit_bufsize size);

// release/free an allocated memory
void ajit_brel(void *buf);

////////////////////////////////////////////////////////////////////////////////
// BLOCK END  : ajit_bget_declarations
////////////////////////////////////////////////////////////////////////////////



////////////////////////////////////////////////////////////////////////////////
// BLOCK START: ajit_shared_integers_addresses
////////////////////////////////////////////////////////////////////////////////
% count = 0
% intVarsMemRegion = confObj.reservedMem.ajitSharedIntVars
% for i in range(intVarsMemRegion.sizeInBytes):
% if i % 4 == 0:
% addr = intVarsMemRegion.startAddr + i
#define SHARED_INT_ADDR_{{count}} {{addr}}
% count += 1
% end
% end
////////////////////////////////////////////////////////////////////////////////
// BLOCK END  : ajit_shared_integers_addresses
////////////////////////////////////////////////////////////////////////////////

#endif