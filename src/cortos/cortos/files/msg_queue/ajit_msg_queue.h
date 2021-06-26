
typedef struct _AjitMessage {
  char arr[{ajitQueueMsgSize}];
} AjitMessage;

typedef struct _AjitQueueHeader {
  int syncLock;
  int totalMsgs;
  int readIndex;
  int writeIndex;
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
