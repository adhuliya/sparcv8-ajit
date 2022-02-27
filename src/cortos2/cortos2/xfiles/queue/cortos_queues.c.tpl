
#include <cortos_locks.h>
#include <cortos_queues.h>


uint32_t cortos_writeMessages(CortosQueueHeader *hdr, uint8_t *msgs, uint32_t count) {
  uint8_t *dest = 0, *src = 0; // nullptr
  uint32_t process = count;
  uint32_t i;

  cortos_lock_acquire_buzy(hdr->lock);

  uint32_t totalMsgs      = hdr->totalMsgs;
  uint32_t writeIndex     = hdr->writeIndex;
  uint32_t length         = hdr->length;
  uint32_t msgSizeInBytes = hdr->msgSizeInBytes;
  uint8_t* queuePtr       = hdr->queuePtr;

  while ((process > 0) && (totalMsgs < hdr->length)) {
    src  = msgs + (msgSizeInBytes * (count - process));
    dest = queuePtr + (msgSizeInBytes * writeIndex);
    for (i = 0; i < msgSizeInBytes; ++i) {
      *(dest+i) = *(src+i);                     // WRITE THE MESSAGE HERE
    }
    writeIndex = (writeIndex+1) % length;
    ++totalMsgs; --process;
  }

  hdr->totalMsgs  = totalMsgs;
  hdr->writeIndex = writeIndex;

  cortos_lock_release(hdr->lock);
  return (count - process);
}


uint32_t cortos_readMessages(CortosQueueHeader *hdr, uint8_t *msgs, uint32_t count) {
  uint8_t *dest = 0, *src = 0; // nullptr
  uint32_t process = count;
  uint32_t i;

  cortos_lock_acquire_buzy(hdr->lock);              // ACQUIRE LOCK

  uint32_t totalMsgs      = hdr->totalMsgs;
  uint32_t readIndex      = hdr->readIndex;
  uint32_t length         = hdr->length;
  uint32_t msgSizeInBytes = hdr->msgSizeInBytes;
  uint8_t* queuePtr       = hdr->queuePtr;

  while ((process > 0) && (totalMsgs > 0)) {
    dest = msgs + (msgSizeInBytes * (count - process));
    src  = queuePtr + (msgSizeInBytes * readIndex);
    for (i = 0; i < msgSizeInBytes; ++i) {
      *(dest+i) = *(src+i);                     // READ THE MESSAGE HERE
    }
    readIndex = (readIndex+1) % length;
    --totalMsgs; --process;
  }

  hdr->totalMsgs  = totalMsgs;
  hdr->readIndex  = readIndex;

  cortos_lock_release(hdr->lock);              // RELEASE LOCK
  return (count - process);
}

