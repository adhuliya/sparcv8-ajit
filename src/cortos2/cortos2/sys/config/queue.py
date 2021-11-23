"""Message passing queues in the system."""
from typing import List

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



class AllQueues:
  """List of all the queues in the system."""

  def __init__(self):
    self.allQueues: List[Queue] = []