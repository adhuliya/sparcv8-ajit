
// needs linking with ajit_q_lock_unlock.s

#include "ajit_cortos.h"


int writeAjitMessage(int queueId, AjitMessage *msg) {
  int status = 0; // 1 = msg written
  AjitQueueHeader *header = 0;
  AjitMessage *dest = 0;

  header = GET_Q_HEADER_ADDR(queueId);
  dest = GET_Q_ADDR(queueId);

  ajit_q_lock_acquire_buzy(queueId);

  // critical section
  int totalMsgs = header->totalMsgs;
  int writeIndex = header->writeIndex;

  if (totalMsgs == AJIT_Q_LEN) {
    status = 0; // queue is full
  } else {
    dest = GET_MSG_ADDR(dest, writeIndex);
    *dest = *msg; // WRITE WRITE WRITE, THE MESSAGE HERE

    totalMsgs += 1;
    writeIndex = INCREMENT_INDEX(writeIndex);

    header->totalMsgs = totalMsgs;
    header->writeIndex = writeIndex;
    status = 1;
  }

  ajit_q_lock_release(queueId);
  return status;
}


int readAjitMessage(int queueId, AjitMessage *msg) {
  int status = 0; // 1 = msg written
  AjitQueueHeader *header = 0;
  AjitMessage *dest = 0;

  header = GET_Q_HEADER_ADDR(queueId);
  dest = GET_Q_ADDR(queueId);

  ajit_q_lock_acquire_buzy(queueId);

  // critical section
  int totalMsgs = header->totalMsgs;
  int readIndex = header->readIndex;

  if (totalMsgs == 0) {
    status = 0; // queue is empty
  } else {
    dest = GET_MSG_ADDR(dest, readIndex);
    *msg = *dest; // READ READ READ, THE MESSAGE HERE

    totalMsgs -= 1;
    readIndex = INCREMENT_INDEX(readIndex);

    header->totalMsgs = totalMsgs;
    header->readIndex = readIndex;
    status = 1;
  }

  ajit_q_lock_release(queueId);
  return status;
}


