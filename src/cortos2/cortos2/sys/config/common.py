"""Some common definitions to circumvent circular dependencies."""
import os
from typing import List, Tuple

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
      regionType: str = consts.SOFT,
  ):
    self.name = name
    self.oneLineDescription = oneLineDescription
    self.sizeInBytes = sizeInBytes
    self.pageTableLevels: List[Tuple[consts.PageTableLevel, int]] = []
    self.initPageTableLevels()
    self.context = context
    self.virtualAddr = virtualAddr
    self.physicalAddr = physicalAddr
    self.cacheable = cacheable
    self.permissions = permissions
    self.regionType = regionType


  @staticmethod
  def generateObject(
      userProvidedConfig: Dict,
      prevKeySeq: Opt[List] = None,
  ) -> 'MemoryRegion':
    """Takes a user given configuration and extracts the data into an object."""

    config: Opt[Dict] = util.getConfigurationParameter(
      userProvidedConfig,
      [keyName],
    )


  def initPageTableLevels(self):
    """Determine the number of pages and their levels needed for this region.
    It tries to minimize space wastage and also minimize the number of
    page table entries.
    """
    self.pageTableLevels = []

    sizeInBytes = self.sizeInBytes
    for level in sorted((x for x in consts.PageTableLevel), key=lambda x: x.value):
      pageSizeInBytes = consts.PAGE_TABLE_LEVELS_TO_PAGE_SIZE[level]
      numOfPages = self.sizeInBytes // pageSizeInBytes
      self.pageTableLevels.append((level, numOfPages))
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
      pageLevelSizeInBytes = consts.PAGE_TABLE_LEVELS_TO_PAGE_SIZE[level]
      pagedSizeInBytes += pageLevelSizeInBytes * count
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


