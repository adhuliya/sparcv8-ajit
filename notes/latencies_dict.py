# This python module defines a dictionary that maps instruction to its latency.

latency         = 2
# HitRatio: 90%, CacheHit: 2, Memory: 10, round(2.8) = 3
ldLatency     = 3
storeLatency    = 3

instructionLatency = {
  "LDSB"        : ldLatency, # Load Signed Byte
  "LDSBA"       : ldLatency, # Load Signed Byte from Alt Space
  "LDSH"        : ldLatency, # Load Signed Halfword
  "LDSHA"       : ldLatency, # Load Signed Halfword from Alt Space
  "LDUB"        : ldLatency, # Load Unsigned Byte
  "LDUBA"       : ldLatency, # Load Unsigned Byte from Alt Space
  "LDUH"        : ldLatency, # Load Unsigned Halfword
  "LDUHA"       : ldLatency, # Load Unsigned Halfword from Alt Space
  "LD"          : ldLatency, # Load Word
  "LDA"         : ldLatency, # Load Word from Alt Space
  "LDD"         : ldLatency, # Load Doubleword
  "LDDA"        : ldLatency, # Load Doubleword from Alt Space

  "LDF"         : ldLatency, # Load Floating-point
  "LDDF"        : ldLatency, # Load Double Floating-point
  "LDFSR"       : ldLatency, # Load Floating-point State Register

  "LDC"         : ldLatency, # Load Coprocessor
  "LDDC"        : ldLatency, # Load Double Coprocessor
  "LDCSR"       : ldLatency, # Load Coprocessor State Register

  "STB"         : stLatency, # Store Byte
  "STBA"        : stLatency, # Store Byte into Alt Space
  "STH"         : stLatency, # Store Halfword
  "STHA"        : stLatency, # Store Halfword into Alt Space
  "ST"          : stLatency, # Store Word
  "STA"         : stLatency, # Store Word into Alt Space
  "STD"         : stLatency, # Store Doubleword
  "STDA"        : stLatency, # Store Doubleword into Alt Space

  "STF"         : stLatency, # Store Floating-point
  "STDF"        : stLatency, # Store Double Floating-point
  "STFSR"       : stLatency, # Store Floating-point State Register
  "STDFQ"       : stLatency, # Store Double Floating-point deferred-trap Queue

  "LDSTUB"      : latency, # Atomic Load-Store Unsigned Byte
  "LDSTUBA"     : latency, # Atomic Load-Store Unsigned Byte in Alt Space
  "SWAP"        : latency, # Swap r Register with Memory
  "SWAPA"       : latency, # Swap r Register with Memory in Alt Space

  "SETHI"       : latency, # Set High 22 bits of r Register
  "NOP"         : 1, # No Operation

  "AND"         : latency, # And
  "ANDCC"       : latency, # And and modify icc
  "ANDN"        : latency, # And Not
  "ANDNCC"      : latency, # And Not and modify icc
  "OR"          : latency, # Inclusive-Or
  "ORCC"        : latency, # Inclusive-Or and modify icc
  "ORN"         : latency, # Inclusive-Or Not



}

