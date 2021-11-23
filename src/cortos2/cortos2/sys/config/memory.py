"""The configuration and layout of the system memory."""
import os
from typing import List, Optional as Opt, Dict, Tuple

from cortos2.common import util, consts


class MemoryRegion(util.PrettyStr):
  """It represents a single contiguous memory region."""

  def __init__(self,
      name: str = "UnnamedRegion",
      oneLineDescription: str = "Unnamed Region",
      sizeInBytes: util.SizeInBytesT = 0,
      context: int = 0,
      virtualAddr: int = 0,  # the start address
      physicalAddr: int = 0,
      cacheable: bool = True,
      permissions: int = 0x1,  # read,write for data
  ):
    self.name = name
    self.oneLineDescription = oneLineDescription
    self.sizeInBytes = sizeInBytes
    self.context = context
    self.virtualAddr = virtualAddr
    self.physicalAddr = physicalAddr
    self.pageTableLevels: List[Tuple[consts.PageTableLevel, int]] = []
    self.cacheable = cacheable
    self.permissions = permissions

    self.initPageTableLevels()


  def initPageTableLevels(self):
    """Determine the number of pages and their levels needed for this region.
    It tries to minimize space wastage and also minimize the number of
    page table entries.
    """
    self.pageTableLevels = []

    sizeInBytes = self.sizeInBytes
    for level in sorted((x for x in consts.PageTableLevel), key=lambda x: x.value):
      pageSizeInBytes = consts.PAGE_TABLE_LEVELS_TO_PAGE_SIZE[consts.PageTableLevel.LEVEL0]
      numOfPages = self.sizeInBytes // pageSizeInBytes
      self.pageTableLevels.append((consts.PageTableLevel.LEVEL0, numOfPages))
      sizeInBytes -= numOfPages * pageSizeInBytes

    # fit the size left in a 4KB page
    if sizeInBytes > 0:
      assert sizeInBytes < consts.PAGE_TABLE_LEVELS_TO_PAGE_SIZE[consts.PageTableLevel.LEVEL3], \
             f"{sizeInBytes} should be lower than 4KB."
      self.pageTableLevels.append((consts.PageTableLevel.LEVEL3, 1))


  def getFirstByteAddr(self, useVirtualAddr: bool = True) -> int:
    return self.virtualAddr if useVirtualAddr else self.physicalAddr


  def getLastByteAddr(self, useVirtualAddr: bool = True):
    return self.getNextToLastByteAddr(useVirtualAddr=useVirtualAddr) - 1


  def getSizeInBytes(self):
    return self.getLastByteAddr() - self.getFirstByteAddr()


  def totalPagesUsed(self) -> int:
    """Returns the number of pages used."""
    totalPages = 0
    for level, count in self.pageTableLevels:
      totalPages += count
    return totalPages


  def pagedSizeInBytes(self) -> int:
    """Returns the size occupied by all the pages."""
    pagedSizeInBytes = 0
    for level, count in self.pageTableLevels:
      pageSize = consts.PAGE_TABLE_LEVELS_TO_PAGE_SIZE[level]
      pagedSizeInBytes += pageSize * count
    return pagedSizeInBytes


  def getNextToLastByteAddr(self,
      useVirtualAddr: bool = True,  # set False to use physical address
  ) -> int:
    """Returns the address of the first byte just after the allocated space."""
    baseAddr = self.virtualAddr if useVirtualAddr else self.physicalAddr
    nextToLastByteAddr = baseAddr + self.pagedSizeInBytes()
    return nextToLastByteAddr


  @staticmethod
  def getVmapFileEntryLine(
      context: int = 0,
      virtualAddr: int = 0,
      physicalAddr: int = 0,
      pageTableLevel: int = 0,
      cacheable: bool = True,
      permissions: int = 0x1,  # read,write for data
  ):
    return f"{hex(context)} {hex(virtualAddr)} {hex(physicalAddr)}" \
           f" {hex(pageTableLevel)} {hex(cacheable)} {hex(permissions)}" \
           f"{os.linesep}"


  def getVmapFileEntryLines(self) -> List[str]:
    """Returns the entry lines to be put in a vmap file."""
    entryLines: List[str] = []
    entryLines.append(f"!{self.name}: {self.oneLineDescription}{os.linesep}")

    virtualAddr = self.virtualAddr
    physicalAddr = self.physicalAddr
    for level, count in self.pageTableLevels:
      page_size = consts.PAGE_TABLE_LEVELS_TO_PAGE_SIZE[level]
      for i in range(count):
        entryLines.append(
          self.getVmapFileEntryLine(
            context=self.context,
            virtualAddr=virtualAddr + page_size * i,
            physicalAddr=physicalAddr + page_size * i,
            pageTableLevel=level.value,
            cacheable=self.cacheable,
            permissions=self.permissions,
          )
        )
      virtualAddr += page_size * count
      physicalAddr += page_size * count
    return entryLines


class MemoryLayout:
  def __init__(self,
      confObj: SystemConfig,
  ) -> None:
    """The initializations here are used in `init_allocate.s` file.

    Note: `init_allocate.s` is generated from `init_allocate.s.tpl` file.

    NOTE: All sizes must be a multiple of 8.
    """
    self.regionSeq: List[MemoryRegion] = []
    self.sizeInBytes = 0
    vAddr = 0x0
    pAddr = confObj.memStartAddr

    region = MemoryRegion(
      name="TextSection",
      oneLineDescription="All .text sections of the code",
      sizeInBytes=confObj.textSecSizeInBytes,
      virtualAddr=vAddr,
      physicalAddr=pAddr,
      permissions=consts.PagePermissions.SU_RX.value,
    )
    self.regionSeq.append(region)
    self.text = region

    region = MemoryRegion(
      name="DataSection",
      oneLineDescription="All .data/.bss sections of the code.",
      sizeInBytes=confObj.dataSecSizeInBytes,
      virtualAddr=region.getNextToLastByteAddr(useVirtualAddr=True),
      physicalAddr=region.getNextToLastByteAddr(useVirtualAddr=False),
      permissions=consts.PagePermissions.SU_RW.value,
    )
    self.regionSeq.append(region)
    self.data = region

    region = MemoryRegion(
      name="ReservedSpace",
      oneLineDescription="Some reserved space.",
      sizeInBytes=consts.RESERVED_REGION_SIZE,
      virtualAddr=region.getNextToLastByteAddr(useVirtualAddr=True),
      physicalAddr=region.getNextToLastByteAddr(useVirtualAddr=False),
      permissions=consts.PagePermissions.SU_RW.value,
    )
    self.regionSeq.append(region)
    self.reserved = region

    region = MemoryRegion(
      name="ScratchPadRegion",
      oneLineDescription="A small shared data area that any thread can access.",
      sizeInBytes=consts.SCRATCHPAD_MEMORY_REGION_SIZE_IN_BYTES,
      virtualAddr=region.getNextToLastByteAddr(useVirtualAddr=True),
      physicalAddr=region.getNextToLastByteAddr(useVirtualAddr=False),
      permissions=consts.PagePermissions.SU_RW.value,
    )
    self.regionSeq.append(region)
    self.scratchPad = region

    region = MemoryRegion(
      name="CacheableLocks",
      oneLineDescription="An exclusively area to store cacheable locks.",
      sizeInBytes=consts.CACHED_LOCKS_REGION_SIZE_IN_BYTES,
      virtualAddr=region.getNextToLastByteAddr(useVirtualAddr=True),
      physicalAddr=region.getNextToLastByteAddr(useVirtualAddr=False),
      permissions=consts.PagePermissions.SU_RW.value,
    )
    self.regionSeq.append(region)
    self.cacheableLocks = region

    region = MemoryRegion(
      name="NonCacheableLocks",
      oneLineDescription="An exclusively area to store non-cacheable locks.",
      sizeInBytes=consts.NON_CACHED_LOCKS_REGION_SIZE_IN_BYTES,
      virtualAddr=region.getNextToLastByteAddr(useVirtualAddr=True),
      physicalAddr=region.getNextToLastByteAddr(useVirtualAddr=False),
      cacheable=False,
      permissions=consts.PagePermissions.SU_RW.value,
    )
    self.regionSeq.append(region)
    self.nonCacheableLocks = region

    # ALLOCATE_MEMORY
    addr = self.cortosLockVarsStartAddr = \
      self.nonCacheableLocks.getFirstByteAddr(useVirtualAddr=True)
    addr = self.cortosResLockVarsStartAddr = \
      addr + confObj.totalLockVars
    addr = self.cortosQueueLockVarsStartAddr = \
      addr + confObj.totalResLockVars
    assert addr < self.nonCacheableLocks.getNextToLastByteAddr(useVirtualAddr=True)

    # startAddr = self.cortosSharedIntVars.getNextToLastByteAddr()
    # regionSize = confObj.totalResLockVars * 4
    # self.cortosResLockVars = MemoryRegion(startAddr, regionSize)
    # self.sizeInBytes += self.cortosResLockVars.sizeInBytes

    # startAddr = self.cortosResLockVars.getNextToLastByteAddr()
    # regionSize = confObj.totalLockVars * 4
    # self.cortosLockVars = MemoryRegion(startAddr, regionSize)
    # self.sizeInBytes += self.cortosLockVars.sizeInBytes

    # startAddr = self.cortosLockVars.getNextToLastByteAddr()
    # regionSize = confObj.totalQueues * 4
    # self.cortosQueueLockVars = MemoryRegion(startAddr, regionSize)
    # self.sizeInBytes += self.cortosQueueLockVars.sizeInBytes

    region = MemoryRegion(
      name="MessageQueues",
      oneLineDescription="All queues reside here.",
      sizeInBytes=consts.DEFAULT_QUEUE_REGION_SIZE_IN_BYTES,
      virtualAddr=region.getNextToLastByteAddr(useVirtualAddr=True),
      physicalAddr=region.getNextToLastByteAddr(useVirtualAddr=False),
      permissions=consts.PagePermissions.SU_RW.value,
    )
    self.regionSeq.append(region)
    self.queues = region
    self.queueHeadersStartAddr = self.queues.getFirstByteAddr(useVirtualAddr=True)
    self.queuesStartAddr = self.queueHeadersStartAddr + confObj.totalQueueHeadersSize
    assert self.queuesStartAddr + confObj.totalQueues * consts.DEFAULT_QUEUE_SIZE_IN_BYTES < \
           self.queues.getNextToLastByteAddr(useVirtualAddr=True), f"Memory Layout Overflow!"

    # startAddr = self.cortosQueueHeaders.getNextToLastByteAddr()
    # regionSize = confObj.queueSizeInBytes * confObj.totalQueues
    # self.cortosQueues = MemoryRegion(startAddr, regionSize)
    # self.sizeInBytes += self.cortosQueues.sizeInBytes

    # # a separate bget area
    # startAddr = self.cortosQueues.getNextToLastByteAddr()
    # regionSize = confObj.bgetMemSizeInBytes
    # self.cortosBgetMemory = MemoryRegion(startAddr, regionSize)
    # self.sizeInBytes += self.cortosBgetMemory.sizeInBytes

    region = MemoryRegion(
      name="MemoryAllocArea",
      oneLineDescription="Dynamic memory is allocated from here.",
      sizeInBytes=confObj.bgetMemSizeInBytes,
      virtualAddr=region.getNextToLastByteAddr(useVirtualAddr=True),
      physicalAddr=region.getNextToLastByteAddr(useVirtualAddr=False),
      permissions=consts.PagePermissions.SU_RW.value,
    )
    self.regionSeq.append(region)
    self.malloc = region

    # create space for program stacks
    region = MemoryRegion(
      name="StackGuard",
      oneLineDescription="A guard page to check against stack underflow/overflow.",
      sizeInBytes=2 ** 12,  # 4KB
      virtualAddr=region.getNextToLastByteAddr(useVirtualAddr=True),
      physicalAddr=region.getNextToLastByteAddr(useVirtualAddr=False),
      permissions=consts.PagePermissions.SU_X.value,
    )
    self.regionSeq.append(region)

    self.stacks: List[MemoryRegion] = []
    for i, prog in enumerate(confObj.programs):
      region = MemoryRegion(
        name=f"ProgramStack_{i}",
        oneLineDescription="Program Stack Area.",
        sizeInBytes=prog.stackSizeInBytes,
        virtualAddr=region.getNextToLastByteAddr(useVirtualAddr=True),
        physicalAddr=region.getNextToLastByteAddr(useVirtualAddr=False),
        permissions=consts.PagePermissions.SU_RW.value,
      )
      self.regionSeq.append(region)
      self.stacks[i] = region

      region = MemoryRegion(
        name=f"StackGuard_{i}",
        oneLineDescription="A guard page to check against stack underflow/overflow.",
        sizeInBytes=2 ** 12,  # 4KB
        virtualAddr=region.getNextToLastByteAddr(useVirtualAddr=True),
        physicalAddr=region.getNextToLastByteAddr(useVirtualAddr=False),
        permissions=consts.PagePermissions.SU_X.value,
      )
      self.regionSeq.append(region)

    # check if the memory is over-allocated
    self.checkInvariant(
      region.getNextToLastByteAddr(useVirtualAddr=True),
      region.getNextToLastByteAddr(useVirtualAddr=False)
    )

    region = MemoryRegion(
      name="MemoryMappedIO",
      oneLineDescription="Reserved space for memory mapped IO.",
      sizeInBytes=2 ** 16,  # 64KB
      virtualAddr=0xFFFF0000,
      physicalAddr=0xFFFF0000,
      cacheable=False,
      permissions=consts.PagePermissions.SU_RW.value,
    )
    self.regionSeq.append(region)


class Memory:
  def __init__(self,
      sizeInBytes: int = consts.DEFAULT_MEM_SIZE_IN_KB * 1024,
      startAddr: int = consts.DEFAULT_MEM_START_ADDR,
  ) -> None:
    self.sizeInBytes = sizeInBytes
    self.startAddr = startAddr

    # To be populated later w.r.t. the SystemConfig data.
    self.memoryLayout: Opt[MemoryLayout] = None


def initConfig(
    userProvidedConfig: Dict,
    program,
    queueSeq,
    locks,
    bget,
    build,
) -> Memory:
  """Takes a user given configuration and extracts the relevant bits.
  :param userProvidedConfig:
  :param program:
  :param queueSeq:
  :param locks:
  :param bget:
  :param build:

  :return memory:
  """

  memSizeInKB = (userProvidedConfig[consts.YML_MEM_SIZE_IN_KB]
                 if consts.YML_MEM_SIZE_IN_KB in userProvidedConfig
                 else consts.DEFAULT_MEM_SIZE_IN_KB)
  memSizeInBytes = memSizeInKB * 1024

  memStartAddr = (userProvidedConfig[consts.YML_MEM_START_ADDR]
                 if consts.YML_MEM_START_ADDR in userProvidedConfig
                 else consts.DEFAULT_MEM_START_ADDR)

  memory = Memory(
    sizeInBytes=memSizeInBytes,
    startAddr=memStartAddr
  )

  return memory

