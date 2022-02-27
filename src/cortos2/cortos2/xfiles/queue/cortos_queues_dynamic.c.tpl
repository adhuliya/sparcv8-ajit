
#include <cortos_locks.h>
#include <cortos_queues.h>
#include <cortos_bget.h>

CortosQueueHeader*
cortos_reserveQueue(uint32_t msgSizeInBytes, uint32_t length, uint8_t nc) {
  uint8_t* queue = NULL;
  uint32_t size = sizeof(CortosQueueHeader) + (msgSizeInBytes * length);
  if (nc) {
    queue = (uint8_t*)cortos_bget_ncram(size);
  } else {
    queue = (uint8_t*)cortos_bget(size);
  }
  if (queue == NULL) return queue;

  // initialize the queue header
  CortosQueueHeader *hdr;
  hdr = (CortosQueueHeader*)queue;
  hdr->totalMsgs = 0;
  hdr->readIndex = 0;
  hdr->writeIndex = 0;
  hdr->msgSizeInBytes = msgSizeInBytes;
  hdr->length = length;
  hdr->lock = cortos_reserveLock(1);

  return hdr;
}

void cortos_freeQueue(CortosQueueHeader *hdr) {
  cortos_freeLock(hdr->lock);
  if (cortos_IsNcramAddr((void*)hdr)) {
    cortos_brel_ncram((void*)hdr);
  } else {
    cortos_brel((void*)hdr);
  }
}

