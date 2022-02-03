#include <cortos_queue.h>

CortosQueueHeader cortosQueueHeaders[{{len(queues)}}];

% for queue in confObj.software.queues:
#define CORTOS_QUEUE_{{queue.name}} {{queue.qid}}
#define CORTOS_QUEUE_{{queue.name}}_LEN {{queue.length}}
#define CORTOS_QUEUE_{{queue.name}}_MSG_SIZE_IN_BYTES {{queue.msgSizeInBytes}}
uint8_t cortosQueue{{queue.qid}}[{{queue.length}}][{{queue.msgSizeInBytes}}];
% end


void cortos_init_queues() {
  % for i, queue in enumerate(queues):
  // CORTOS_QUEUE_{{queue.name}}, seq = {{i}}, queue.qid = {{queue.qid}}
  queueHeaders[i].totalMsgs      = {{queue.length}};
  queueHeaders[i].readMsgIndex   = 0;
  queueHeaders[i].writeMsgIndex  = 0;
  queueHeaders[i].msgSizeInBytes = {{queue.msgSizeInBytes}};
  queueHeaders[i].queuePtr       = (uint8_t*) cortosQueue{{queue.qid}};

  % end
}
