#!/usr/bin/env python3
# Execution of this module prints useful information.

# This python module defines the Ajit specific Sparc V8 processor details.
# These include,
# 1. Instruction latencies.
# 2. Instruction-Pair latencies.
# 3. Instruction Formats
# 4. Readonly and Modified registers.


#START : Convenient Constants

hitRatio        = 0.9
missRatio       = 1 - hitRatio
cacheLatency    = 2
ramLatency      = 10
memLatency      = cacheLatency * hitRatio + (ramLatency + cacheLatency) * missRatio


latencyA        = 2
ldLatency       = round(memLatency)
stLatency       = round(memLatency)

#END   : Convenient Constants

# START : Instructions with Details
instructions = {
  "LDSB"        : # Load Signed Byte
  {
      "mnemonic"    : "ldsb",
      "latency"     : ldLatency,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "LDSBA"       : # Load Signed Byte from Alt Space
  {
      "mnemonic"    : "ldsba",
      "latency"     : ldLatency,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "LDSH"        : # Load Signed Halfword
  {
      "mnemonic"    : "ldsh",
      "latency"     : ldLatency,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "LDSHA"       : # Load Signed Halfword from Alt Space
  {
      "mnemonic"    : "ldsha",
      "latency"     : ldLatency,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "LDUB"        : # Load Unsigned Byte
  {
      "mnemonic"    : "ldub",
      "latency"     : ldLatency,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "LDUBA"       : # Load Unsigned Byte from Alt Space
  {
      "mnemonic"    : "lduba",
      "latency"     : ldLatency,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "LDUH"        : # Load Unsigned Halfword
  {
      "mnemonic"    : "lduh",
      "latency"     : ldLatency,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "LDUHA"       : # Load Unsigned Halfword from Alt Space
  {
      "mnemonic"    : "lduha",
      "latency"     : ldLatency,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "LD"          : # Load Word
  {
      "mnemonic"    : "ld",
      "latency"     : ldLatency,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "LDA"         : # Load Word from Alt Space
  {
      "mnemonic"    : "lda",
      "latency"     : ldLatency,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "LDD"         : # Load Doubleword
  {
      "mnemonic"    : "ldd",
      "latency"     : ldLatency,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "LDDA"        : # Load Doubleword from Alt Space
  {
      "mnemonic"    : "ldda",
      "latency"     : ldLatency,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },


  "LDF"         : # Load Floating-point
  {
      "mnemonic"    : "ldf",
      "latency"     : ldLatency,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "LDDF"        : # Load Double Floating-point
  {
      "mnemonic"    : "lddf",
      "latency"     : ldLatency,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "LDFSR"       : # Load Floating-point State Register
  {
      "mnemonic"    : "ldfsr",
      "latency"     : ldLatency,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },


  "LDC"         : # Load Coprocessor
  {
      "mnemonic"    : "ldc",
      "latency"     : ldLatency,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "LDDC"        : # Load Double Coprocessor
  {
      "mnemonic"    : "lddc",
      "latency"     : ldLatency,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "LDCSR"       : # Load Coprocessor State Register
  {
      "mnemonic"    : "ldcsr",
      "latency"     : ldLatency,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },


  "STB"         : # Store Byte
  {
      "mnemonic"    : "stb",
      "latency"     : stLatency,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "STBA"        : # Store Byte into Alt Space
  {
      "mnemonic"    : "stba",
      "latency"     : stLatency,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "STH"         : # Store Halfword
  {
      "mnemonic"    : "sth",
      "latency"     : stLatency,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "STHA"        : # Store Halfword into Alt Space
  {
      "mnemonic"    : "stha",
      "latency"     : stLatency,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "ST"          : # Store Word
  {
      "mnemonic"    : "st",
      "latency"     : stLatency,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "STA"         : # Store Word into Alt Space
  {
      "mnemonic"    : "sta",
      "latency"     : stLatency,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "STD"         : # Store Doubleword
  {
      "mnemonic"    : "std",
      "latency"     : stLatency,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "STDA"        : # Store Doubleword into Alt Space
  {
      "mnemonic"    : "stda",
      "latency"     : stLatency,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },


  "STF"         : # Store Floating-point
  {
      "mnemonic"    : "stf",
      "latency"     : stLatency,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "STDF"        : # Store Double Floating-point
  {
      "mnemonic"    : "stdf",
      "latency"     : stLatency,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "STFSR"       : # Store Floating-point State Register
  {
      "mnemonic"    : "stfsr",
      "latency"     : stLatency,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "STDFQ"       : # Store Double Floating-point deferred-trap Queue
  {
      "mnemonic"    : "stdfq",
      "latency"     : stLatency,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },


  "STC"         : # Store Coprocessor
  {
      "mnemonic"    : "stc",
      "latency"     : stLatency,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "STDC"        : # Store Double Coprocessor
  {
      "mnemonic"    : "stdc",
      "latency"     : stLatency,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "STCSR"       : # Store Coprocessor State Register
  {
      "mnemonic"    : "stcsr",
      "latency"     : stLatency,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "STDCQ"       : # Store Double Coprocessor Queue
  {
      "mnemonic"    : "stdcq",
      "latency"     : stLatency,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },


  "LDSTUB"      : # Atomic Load-Store Unsigned Byte
  {
      "mnemonic"    : "ldstub",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "LDSTUBA"     : # Atomic Load-Store Unsigned Byte in Alt Space
  {
      "mnemonic"    : "ldstuba",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "SWAP"        : # Swap r Register with Memory
  {
      "mnemonic"    : "swap",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "SWAPA"       : # Swap r Register with Memory in Alt Space
  {
      "mnemonic"    : "swapa",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },


  "SETHI"       : # Set High 22 bits of r Register
  {
      "mnemonic"    : "sethi",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "NOP"         : # No Operation
  {
      "mnemonic"    : "nop",
      "latency"     : 1,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },


  "AND"         : # And
  {
      "mnemonic"    : "and",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "ANDCC"       : # And and modify icc
  {
      "mnemonic"    : "andcc",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "ANDN"        : # And Not
  {
      "mnemonic"    : "andn",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "ANDNCC"      : # And Not and modify icc
  {
      "mnemonic"    : "andncc",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "OR"          : # Inclusive-Or
  {
      "mnemonic"    : "or",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "ORCC"        : # Inclusive-Or and modify icc
  {
      "mnemonic"    : "orcc",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "ORN"         : # Inclusive-Or Not
  {
      "mnemonic"    : "orn",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "ORNCC"       : # Inclusive-Or Not and modify icc
  {
      "mnemonic"    : "orncc",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "XOR"         : # Exclusive-Or
  {
      "mnemonic"    : "xor",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "XORCC"       : # Exclusive-Or and modify icc
  {
      "mnemonic"    : "xorcc",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "XNOR"        : # Exclusive-Nor
  {
      "mnemonic"    : "xnor",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "XNORCC"      : # Exclusive-Nor and modify icc
  {
      "mnemonic"    : "xnorcc",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },


  "SLL"         : # Shift Left Logical
  {
      "mnemonic"    : "sll",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "SRL"         : # Shift Right Logical
  {
      "mnemonic"    : "srl",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "SRA"         : # Shift Right Arithmetic
  {
      "mnemonic"    : "sra",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },


  "ADD"         : # Add
  {
      "mnemonic"    : "add",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "ADDCC"       : # Add and modify icc
  {
      "mnemonic"    : "addcc",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "ADDX"        : # Add with Carry
  {
      "mnemonic"    : "addx",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "ADDXCC"      : # Add with Carry and modify icc
  {
      "mnemonic"    : "addxcc",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "TADDCC"      : # Tagged Add and modify icc
  {
      "mnemonic"    : "taddcc",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "TADDCCTV"    : # Tagged Add and modify icc and Trap on overflow
  {
      "mnemonic"    : "taddcctv",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },


  "SUB"         : # Subtract
  {
      "mnemonic"    : "sub",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "SUBCC"       : # Subtract and modify icc
  {
      "mnemonic"    : "subcc",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "SUBX"        : # Subtract with Carry
  {
      "mnemonic"    : "subx",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "SUBXCC"      : # Subtract with Carry and modify icc
  {
      "mnemonic"    : "subxcc",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "TSUBCC"      : # Tagged Subtract and modify icc
  {
      "mnemonic"    : "tsubcc",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "TSUBCCTV"    : # Tagged Subtract and modify icc and Trap on overflow
  {
      "mnemonic"    : "tsubcctv",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },


  "MULSCC"      : # Multiply Step and modify icc
  {
      "mnemonic"    : "mulscc",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },


  "UMUL"        : # Unsigned Integer Multiply
  {
      "mnemonic"    : "umul",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "UMULCC"      : # Unsigned Integer Multiply and modify icc
  {
      "mnemonic"    : "umulcc",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "SMUL"        : # Signed Integer Multiply
  {
      "mnemonic"    : "smul",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "SMULCC"      : # Signed Integer Multiply and modify icc
  {
      "mnemonic"    : "smulcc",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },


  "UDIV"        : # Unsigned Integer Divide
  {
      "mnemonic"    : "udiv",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "UDIVCC"      : # Unsigned Integer Divide and modify icc
  {
      "mnemonic"    : "udivcc",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "SDIV"        : # Signed Integer Divide
  {
      "mnemonic"    : "sdiv",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "SDIVCC"      : # Signed Integer Divide and modify icc
  {
      "mnemonic"    : "sdivcc",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },


  "SAVE"        : # Save caller's window
  {
      "mnemonic"    : "save",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "RESTORE"     : # Restore caller's window
  {
      "mnemonic"    : "restore",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },


  # BICC        : Branch on integer condition codes
  "BA"          : # Branch Always
  {
      "mnemonic"    : "ba",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "BN"          : # Branch Never
  {
      "mnemonic"    : "bn",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "BNE"         : # Branch on Not Equal
  {
      "mnemonic"    : "bne",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "BE"          : # Branch on Equal
  {
      "mnemonic"    : "be",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "BG"          : # Branch on Greater
  {
      "mnemonic"    : "bg",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "BLE"         : # Branch on Less or Equal
  {
      "mnemonic"    : "ble",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "BGE"         : # Branch on Greater or Equal
  {
      "mnemonic"    : "bge",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "BL"          : # Branch on Less
  {
      "mnemonic"    : "bl",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "BGU"         : # Branch on Greater Unsigned
  {
      "mnemonic"    : "bgu",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "BLEU"        : # Branch on Less of Equal Unsigned
  {
      "mnemonic"    : "bleu",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "BCC"         : # Branch on Carry Clear (Greater than or Equal, Unsigned)
  {
      "mnemonic"    : "bcc",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "BCS"         : # Branch on Carry Set (Less than, Unsigned)
  {
      "mnemonic"    : "bcs",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "BPOS"        : # Branch on Positive
  {
      "mnemonic"    : "bpos",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "BNEG"        : # Branch on Negative
  {
      "mnemonic"    : "bneg",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "BVC"         : # Branch on Overflow Clear
  {
      "mnemonic"    : "bvc",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "BVS"         : # Branch on Overflow Set
  {
      "mnemonic"    : "bvs",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },


  # FBFCC       : Branch on floating-point condition codes
  "FBA"         : # Branch Always
  {
      "mnemonic"    : "fba",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "FBN"         : # Branch Never
  {
      "mnemonic"    : "fbn",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "FBU"         : # Branch on Unordered
  {
      "mnemonic"    : "fbu",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "FBG"         : # Branch on Greater
  {
      "mnemonic"    : "fbg",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "FBUG"        : # Branch on Unordered or Greater
  {
      "mnemonic"    : "fbug",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "FBL"         : # Branch on Less
  {
      "mnemonic"    : "fbl",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "FBUL"        : # Branch on Unordered or Less
  {
      "mnemonic"    : "fbul",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "FBLG"        : # Branch on Less or Greater
  {
      "mnemonic"    : "fblg",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "FBNE"        : # Branch on Not Equal
  {
      "mnemonic"    : "fbne",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "FBE"         : # Branch on Equal
  {
      "mnemonic"    : "fbe",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "FBUE"        : # Branch on Unordered or Equal
  {
      "mnemonic"    : "fbue",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "FBGE"        : # Branch on Greater of Equal
  {
      "mnemonic"    : "fbge",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "FBUGE"       : # Branch on Unordered or Greater or Equal
  {
      "mnemonic"    : "fbuge",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "FBLE"        : # Branch on Less or Equal
  {
      "mnemonic"    : "fble",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "FBULE"       : # Branch on Unordered or Less or Equal
  {
      "mnemonic"    : "fbule",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "FBO"         : # Branch on Ordered
  {
      "mnemonic"    : "fbo",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },



  # CBCCC       : Branch on coprocessor condition codes
  "CBA"         : # Always
  {
      "mnemonic"    : "cba",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "CBN"         : # Never
  {
      "mnemonic"    : "cbn",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "CB3"         : # 3
  {
      "mnemonic"    : "cb3",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "CB2"         : # 2
  {
      "mnemonic"    : "cb2",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "CB23"        : # 2 or 3
  {
      "mnemonic"    : "cb23",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "CB1"         : # 1
  {
      "mnemonic"    : "cb1",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "CB13"        : # 1 or 3
  {
      "mnemonic"    : "cb13",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "CB12"        : # 1 or 2
  {
      "mnemonic"    : "cb12",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "CB123"       : # 1 or 2 or 3
  {
      "mnemonic"    : "cb123",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "CB0"         : # 0
  {
      "mnemonic"    : "cb0",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "CB03"        : # 0 or 3
  {
      "mnemonic"    : "cb03",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "CB02"        : # 0 or 2
  {
      "mnemonic"    : "cb02",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "CB023"       : # 0 or 2 or 3
  {
      "mnemonic"    : "cb023",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "CB01"        : # 0 or 1
  {
      "mnemonic"    : "cb01",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "CB013"       : # 0 or 1 or 3
  {
      "mnemonic"    : "cb013",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "CB012"       : # 0 or 1 or 2
  {
      "mnemonic"    : "cb012",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },


  "CALL"        : # Call and Link
  {
      "mnemonic"    : "call",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "JMPL"        : # Jump and Link
  {
      "mnemonic"    : "jmpl",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "RETT"        : # Return from Trap
  {
      "mnemonic"    : "rett",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },


  # TICC        : Trap on integr contition codes
  "TA"          : # Trap Always
  {
      "mnemonic"    : "ta",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "TN"          : # Trap Never
  {
      "mnemonic"    : "tn",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "TNE"         : # Trap on Not Equal
  {
      "mnemonic"    : "tne",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "TE"          : # Trap on Equal
  {
      "mnemonic"    : "te",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "TG"          : # Trap on Greater
  {
      "mnemonic"    : "tg",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "TLE"         : # Trap on Less or Equal
  {
      "mnemonic"    : "tle",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "TGE"         : # Trap on Greater or Equal
  {
      "mnemonic"    : "tge",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "TL"          : # Trap on Less
  {
      "mnemonic"    : "tl",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "TGU"         : # Trap on Greater Unsigned
  {
      "mnemonic"    : "tgu",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "TLEU"        : # Trap on Less or Equal Unsigned
  {
      "mnemonic"    : "tleu",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "TCC"         : # Trap on Carry Clear (Greater than or Equal, Unsigned)
  {
      "mnemonic"    : "tcc",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "TCS"         : # Trap on Carry Set (Less Than, Unsigned)
  {
      "mnemonic"    : "tcs",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "TPOS"        : # Trap on Positive
  {
      "mnemonic"    : "tpos",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "TNEG"        : # Trap on Negative
  {
      "mnemonic"    : "tneg",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "TVC"         : # Trap on Overflow Clear
  {
      "mnemonic"    : "tvc",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "TVS"         : # Trap on Overflow Set
  {
      "mnemonic"    : "tvs",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },


  "RDASR"       : # Read Ancillary State Register
  {
      "mnemonic"    : "rdasr",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "RDY"         : # Read Y Register
  {
      "mnemonic"    : "rdy",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "RDPSR"       : # Read Processor State Register
  {
      "mnemonic"    : "rdpsr",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "RDWIM"       : # Read Window Invalid Mask Register
  {
      "mnemonic"    : "rdwim",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "RDTBR"       : # Read Trap Base Register
  {
      "mnemonic"    : "rdtbr",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },


  "WDASR"       : # Write Ancillary State Register
  {
      "mnemonic"    : "wdasr",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "WDY"         : # Write Y Register
  {
      "mnemonic"    : "wdy",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "WDPSR"       : # Write Processor State Register
  {
      "mnemonic"    : "wdpsr",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "WDWIM"       : # Write Window Invalid Mask Register
  {
      "mnemonic"    : "wdwim",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "WDTBR"       : # Write Trap Base Register
  {
      "mnemonic"    : "wdtbr",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },


  "STBAR"       : # Store Barrier
  {
      "mnemonic"    : "stbar",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },


  "UNIMP"       : # Unimplemented
  {
      "mnemonic"    : "unimp",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },


  "FLUSH"       : # Flush Instruction Memory
  {
      "mnemonic"    : "flush",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },


  # FPop : Floating-point Operate (FPop1, FPop2)
  "FITOS"       : # Convert Integer to Single
  {
      "mnemonic"    : "fitos",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "FITOD"       : # Convert Integer to Double
  {
      "mnemonic"    : "fitod",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "FITOQ"       : # Convert Integer to Quad
  {
      "mnemonic"    : "fitoq",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },


  "FSTOI"       : # Convert Single to Integer
  {
      "mnemonic"    : "fstoi",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "FDTOI"       : # Convert Double to Integer
  {
      "mnemonic"    : "fdtoi",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "FQTOI"       : # Convert Quad to Integer
  {
      "mnemonic"    : "fqtoi",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },


  "FSTOD"       : # Convert Single to Double
  {
      "mnemonic"    : "fstod",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "FSTOQ"       : # Convert Single to Quad
  {
      "mnemonic"    : "fstoq",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "FDTOS"       : # Convert Double to Single
  {
      "mnemonic"    : "fdtos",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "FDTOQ"       : # Convert Double to Quad
  {
      "mnemonic"    : "fdtoq",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "FQTOS"       : # Convert Quad to Single
  {
      "mnemonic"    : "fqtos",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "FQTOD"       : # Convert Quad to Double
  {
      "mnemonic"    : "fqtod",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },


  "FMOVS"       : # Move
  {
      "mnemonic"    : "fmovs",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "FNEGS"       : # Negate
  {
      "mnemonic"    : "fnegs",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "FABSS"       : # Absolute Value
  {
      "mnemonic"    : "fabss",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },


  "FSQRTS"      : # Square Root Single
  {
      "mnemonic"    : "fsqrts",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "FSQRTD"      : # Square Root Double
  {
      "mnemonic"    : "fsqrtd",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "FSQRTQ"      : # Square Root Quad
  {
      "mnemonic"    : "fsqrtq",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },


  "FADDS"       : # Add Single
  {
      "mnemonic"    : "fadds",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "FADDD"       : # Add Double
  {
      "mnemonic"    : "faddd",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "FADDQ"       : # Add Quad
  {
      "mnemonic"    : "faddq",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "FSUBS"       : # Subtract Single
  {
      "mnemonic"    : "fsubs",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "FSUBD"       : # Subtract Double
  {
      "mnemonic"    : "fsubd",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "FSUBQ"       : # Subtract Quad
  {
      "mnemonic"    : "fsubq",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },


  "FMULS"       : # Multiply Single
  {
      "mnemonic"    : "fmuls",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "FMULD"       : # Multiply Double
  {
      "mnemonic"    : "fmuld",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "FMULQ"       : # Multiply Quad
  {
      "mnemonic"    : "fmulq",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "FSMULD"      : # Multiply Single to Double
  {
      "mnemonic"    : "fsmuld",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "FDMULQ"      : # Multiply Double to Quad
  {
      "mnemonic"    : "fdmulq",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "FDIVS"       : # Divide Single
  {
      "mnemonic"    : "fdivs",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "FDIVD"       : # Divide Double
  {
      "mnemonic"    : "fdivd",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "FDIVQ"       : # Divide Quad
  {
      "mnemonic"    : "fdivq",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },


  "FCMPS"       : # Compare Single
  {
      "mnemonic"    : "fcmps",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "FCMPD"       : # Compare Double
  {
      "mnemonic"    : "fcmpd",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "FCMPQ"       : # Compare Quad
  {
      "mnemonic"    : "fcmpq",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "FCMPES"      : # Compare Single and Exception if Unordered
  {
      "mnemonic"    : "fcmpes",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "FCMPED"      : # Compare Double and Exception if Unordered
  {
      "mnemonic"    : "fcmped",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "FCMPEQ"      : # Compare Quad and Exception if Unordered
  {
      "mnemonic"    : "fcmpeq",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },


  # CPop        : Coprocessor Operate Instructions
  "CPOP1"       : # Coprocessor Operate
  {
      "mnemonic"    : "cpop1",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

  "CPOP2"       : # Coprocessor Operate
  {
      "mnemonic"    : "cpop2",
      "latency"     : latencyA,
      "format"      : [r"format1", r"format2"],
      "readonly"    : ["inFormat1", "inFormat2"],
      "modified"    : ["inFormat1", "inFormat2"],
  },

}
# END   : Instructions with Details


# START : Instruction-Pair or pipeline latency

# Pair Latencies are calculated using the following two formulae,
# Read-after-write stall (I+1 <- I) = latency.
# Read-after-write stall (I+2 <- I) = max (0, latency - 1).

# To override the above two formulae specify latency in this dictionary.
# The value `None` in the latency forces the use of formula.
pairLatency = {
  # ADD ---> MUL = MUL is reading ADD's result
  ("ADD", "MUL")        : (None, 3),
}
# END  : Instruction-Pair or pipeline latency

def printInfo():
  print("Total Instructions     :", len(instructions))
  print("Cache Hit Ratio        :", hitRatio)
  print("Cache Latency          :", cacheLatency)
  print("Ram Latency            :", ramLatency)
  print("Avg. Mem Latency       :", memLatency)

if __name__ == "__main__":
    printInfo()


