
typedef struct _AjitMessage {
  char arr[{ajitQueueMsgSize}];
} AjitMessage;

/*
Sends an AjitMessage.
  - Returns zero if the queue is full.
  - Returns non-zero if the msg was added.
*/
int sendAjitMessage(int queueId, AjitMessage *msg);

/*
Gets an AjitMessage.
  - Returns zero if the queue is empty.
  - Returns non-zero if the msg was put into the *msg location.
*/
int getAjitMessage(int queueId, AjitMessage *msg);