"""Message passing queues in the system."""
from typing import List, Dict

from cortos2.common import consts


class Queue:
  """A single queue and its details."""

  def __init__(self,
      qid: int, # A unique id of the queue
      length: int = consts.DEFAULT_QUEUE_LEN,
      msgSizeInBytes: int = consts.DEFAULT_QUEUE_MSG_SIZE_IN_BYTES,
  ) -> None:
    self.qid = qid
    self.length = length
    self.msgSizeInBytes = msgSizeInBytes



class QueueSeq:
  """List of all the queues in the system."""

  def __init__(self,
      queueSeq: List[Queue],
  ):
    self.queueSeq: List[Queue] = queueSeq


def initConfig(userProvidedConfig: Dict) -> QueueSeq:
  # TODO: add configuration options for queues.
  qSeq: List[Queue] = []
  for i in range(consts.DEFAULT_TOTAL_QUEUES):
    queue = Queue(
      qid=i,
      length=consts.DEFAULT_QUEUE_LEN,
      msgSizeInBytes=consts.DEFAULT_QUEUE_MSG_SIZE_IN_BYTES
    )
    qSeq.append(queue)

  queueSeq = QueueSeq(queueSeq=qSeq)
  return queueSeq
