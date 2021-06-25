
// needs linking with ajit_lock_unlock.s

#include "ajit_msg_queue.h"

#define AJIT_MSG_QUEUE_BASE {ajitMsgQueueBase}
#define AJIT_MSG_QUEUE_MSG_SIZE {ajitMsgQueueMsgSize}


int sendAjitMessage(int queueId, AjitMessage *msg) {
  ajit_func_queue_lock(queueId);
  // critical section
  ajit_func_queue_unlock(queueId);
  return 0;
}


int getAjitMessage(int queueId, AjitMessage *msg) {
  ajit_func_queue_lock(queueId);
  // critical section
  ajit_func_queue_unlock(queueId);
  return 0;
}

