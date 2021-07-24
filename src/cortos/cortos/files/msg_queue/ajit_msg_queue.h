
typedef union _AjitMessage32Bytes {
  char arr[32];
  struct {
    int code;
    char arr[28];
  };
  struct {
    int code;
    double d1;
    double d2;
  };
  struct {
    int code;
    union _AjitMessage32Bytes *ptr;
  };
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
