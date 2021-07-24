
// needs linking with ajit_q_lock_unlock.s

#include "ajit_msg_queue.h"

#define AJIT_MSG_QUEUE_BASE {ajitMsgQueueBase}
#define AJIT_MSG_QUEUE_LEN {ajitMsgQueueLength}
#define AJIT_MSG_QUEUE_LEN_MINUS1 (AJIT_MSG_QUEUE_LEN-1)
#define AJIT_MSG_QUEUE_MSG_SIZE {ajitMsgQueueMsgSize}

#define GET_MSG_ADDR(_BASE, _INDEX) \
(_BASE + ((_INDEX) * AJIT_MSG_QUEUE_MSG_SIZE))

#define INCREMENT_INDEX(_INDEX) \
(((((_INDEX)+1) % AJIT_MSG_QUEUE_LEN)) ? \
((((_INDEX)+1) % AJIT_MSG_QUEUE_LEN)) : START_INDEX)

/*
This computes the base address of the queue with id `queueId`.
*/
#define GET_QUEUE_BASE_ADDR(_QUEUEID) \
(AJIT_MSG_QUEUE_BASE + \
((AJIT_MSG_QUEUE_MSG_SIZE * AJIT_MSG_QUEUE_LEN) * (_QUEUEID)));

// The index 0 is reserved to store queue related paramenters.
#define START_INDEX 1


int writeAjitMessage(int queueId, AjitMessage *msg) {
  int status = 0; // 1 = msg written

  ajit_func_queue_lock(queueId);

  // critical section
  AjitMessage *basePtr = GET_QUEUE_BASE_ADDR(queueId);
  AjitQueueHeader *headerPtr = (AjitQueueHeader*) basePtr;
  AjitMessage *destMsgPtr = 0; // nullptr
  int *intPtr = basePtr;
  int totalMsgs = headerPtr->totalMsgs;
  int writeIndex = headerPtr->writeIndex;

  if (totalMsgs == AJIT_MSG_QUEUE_LEN_MINUS1) {
    status = 0; // queue is full
  } else {
    destMsgPtr GET_MSG_ADDR(basePtr, writeIndex);
    *destMsgPtr = *msg; // WRITE WRITE WRITE, THE MESSAGE HERE

    totalMsgs += 1;
    writeIndex = INCREMENT_INDEX(writeIndex);

    headerPtr->totalMsgs = totalMsgs;
    headerPtr->writeIndex = writeIndex;
    status = 1;
  }

  ajit_func_queue_unlock(queueId);
  return status;
}


int readAjitMessage(int queueId, AjitMessage *msg) {
  int status = 0; // 1 = msg written

  ajit_func_queue_lock(queueId);

  // critical section
  AjitMessage *basePtr = GET_QUEUE_BASE_ADDR(queueId);
  AjitQueueHeader *headerPtr = (AjitQueueHeader*) basePtr;
  AjitMessage *destMsgPtr = 0; // nullptr
  int *intPtr = basePtr;
  int totalMsgs = headerPtr->totalMsgs;
  int readIndex = headerPtr->readIndex;

  if (totalMsgs == 0) {
    status = 0; // queue is empty
  } else {
    destMsgPtr GET_MSG_ADDR(basePtr, writeIndex);
    *msg = *destMsgPtr; // READ READ READ, THE MESSAGE HERE

    totalMsgs -= 1;
    readIndex = INCREMENT_INDEX(readIndex);

    headerPtr->totalMsgs = totalMsgs;
    headerPtr->readIndex = readIndex;
    status = 1;
  }

  ajit_func_queue_unlock(queueId);
  return status;
}

