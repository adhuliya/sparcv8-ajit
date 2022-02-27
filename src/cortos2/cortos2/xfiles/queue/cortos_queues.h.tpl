#ifndef CORTOS_QUEUES_H
#define CORTOS_QUEUES_H

#include <stdint.h>

////////////////////////////////////////////////////////////////////////////////
// BLOCK START: cortos_message_queues_declarations
////////////////////////////////////////////////////////////////////////////////

/* Reserve a cortos queue.
  - returns the pointer to the header of the queue.
  The queue starts just after the header.
*/
CortosQueueHeader*
cortos_reserveQueue(uint32_t msgSizeInBytes, uint32_t length, uint8_t nc);

/* Free a reserved queue. */
void cortos_freeQueue(CortosQueueHeader *hdr);

/* Write one or more messages.
  - Returns the number of messages written from *msgs.
*/
uint32_t cortos_writeMessages(CortosQueueHeader *hdr, uint8_t *msgs, uint32_t count);

/* Read one or more messages.
  - Returns the number of messages read into *msgs.
*/
uint32_t cortos_readMessages(CortosQueueHeader *hdr, uint8_t *msgs, uint32_t count);


////////////////////////////////////////////////////////////////////////////////
// BLOCK END  : cortos_message_queues_declarations
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// BLOCK START: cortos_message_queues_declarations_internal
////////////////////////////////////////////////////////////////////////////////

// 24 byte queue header (for internal use)
typedef struct _CortosQueueHeader {
  uint32_t totalMsgs; // current total messages
  uint32_t readIndex;
  uint32_t writeIndex;
  uint32_t length;
  uint32_t msgSizeInBytes;
  uint8_t *lock;
} CortosQueueHeader;

////////////////////////////////////////////////////////////////////////////////
// BLOCK END  : cortos_message_queues_declarations
////////////////////////////////////////////////////////////////////////////////

#endif // CORTOS_QUEUES_H

