#!/usr/bin/env python3
# USER EDITABLE file containing important static information about
# Sparc(Ajit) architecture and its assembly language.

# Execution of this module prints useful information.

# This python module defines the Ajit specific Sparc V8 processor details.
# These include,
# 1. Instruction latencies.
# 2. Instruction-Pair latencies.
# 3. Instruction Formats
# 4. Readonly and Modified registers.


# START : Convenient Constants

hitRatio        = 0.9
missRatio       = 1 - hitRatio
cacheLatency    = 2
ramLatency      = 10
memLatency      = cacheLatency * hitRatio + (ramLatency + cacheLatency) * missRatio


latencyA        = 2
ldLatency       = round(memLatency)
stLatency       = round(memLatency)

# END   : Convenient Constants

# START : System Registers

registers = {
  "r0", "r1", "r2", "r3", "r4", "r5", "r6", "r7", "r8", "r9",
  "r10", "r11", "r12", "r13", "r14", "r15", "r16", "r17", "r18",
  "r19", "r20", "r21", "r22", "r23", "r24", "r25", "r26", "r27",
  "r28", "r29", "r30", "r31",
  "f0", "f1", "f2", "f3", "f4", "f5", "f6", "f7", "f8", "f9",
  "f10","f11", "f12", "f13", "f14", "f15", "f16", "f17", "f18",
  "f19", "f20", "f21", "f22", "f23", "f24", "f25", "f26", "f27",
  "f28", "f29", "f30", "f31",
  "c0", "c1", "c2", "c3", "c4", "c5", "c6", "c7", "c8", "c9",
  "c10", "c11", "c12", "c13", "c14", "c15", "c16", "c17", "c18",
  "c19", "c20", "c21", "c22", "c23", "c24", "c25", "c26", "c27",
  "c28", "c29", "c30",
  "asr0", "asr1", "asr2", "asr3", "asr4", "asr5", "asr6", "asr7", "asr8", "asr9",
  "asr10", "asr11", "asr12", "asr13", "asr14", "asr15", "asr16", "asr17", "asr18",
  "asr19", "asr20", "asr21", "asr22", "asr23", "asr24", "asr25", "asr26", "asr27",
  "asr28", "asr29", "asr30", "asr31",
  "psr", "wim", "tbr", "y", "fsr", "csr", "fq", "cq", "icc",
}

# Register Synonyms for the `registers` given above.
regSynonyms = {
  "g0"      : "r0",
  "g1"      : "r1",
  "g2"      : "r2",
  "g3"      : "r3",
  "g4"      : "r4",
  "g5"      : "r5",
  "g6"      : "r6",
  "g7"      : "r7",
  "o0"      : "r8",
  "o1"      : "r9",
  "o2"      : "r10",
  "o3"      : "r11",
  "o4"      : "r12",
  "o5"      : "r13",
  "o6"      : "r14",
  "o7"      : "r15",
  "l0"      : "r16",
  "l1"      : "r17",
  "l2"      : "r18",
  "l3"      : "r19",
  "l4"      : "r20",
  "l5"      : "r21",
  "l6"      : "r22",
  "l7"      : "r23",
  "i0"      : "r24",
  "i1"      : "r25",
  "i2"      : "r26",
  "i3"      : "r27",
  "i4"      : "r28",
  "i5"      : "r29",
  "i6"      : "r30",
  "i7"      : "r31",
  "sp"      : "r14",
  "fp"      : "r30",
}

# END   : System Registers


# START : Instructions with Details

# Pefix '@' when using any key below in the instruction format specification.
# Each '@<ALPHABET><NUM>' in the pattern is replaced with '(?P<ALPHABETNUM>.*?)'
# And the matched text is processes using the regular expression the alphabet
# is mapped to.
regexMap = {
  # R: Register expression
  # Extract the Registers (only one)
  "AR"   : r"%\w+",
  # I: Immediate value expression
  # Extract Immediate Value
  "EI"   : r"[-+]?[ \t]*\d+|[-+]?[ \t]*0[xX][0-9a-fA-F]+",
  # A: Address expression
  # Extract All Registers
  # If a single or no register is found, add %r0 as a register being read
  "AA"   : r"%\w+",
  # Set of registers speciall for mov synthetic instruction
  "EM"   : r"%y|%asr\d+|%psr|%wim|%tbr(?i)"
}

# All sequence of spaces in the instruction is replaced with [ \t]*
# '^' and '$' is prefixed and suffixed to each format respectively 
instrData = {
  "ldsb"        : # Load Signed Byte
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"ldsb \[@AA1\] , @AR1",
          {
            "name"      : "ldsb",
            "latency"   : latencyA,
            "reg-read"  : {"AA1"}, #set
            "reg-mod"   : {"AR1"}, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "ldsba"       : # Load Signed Byte from Alt Space
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"ldsba \[@AA1\] [^,]* , @AR1",
          {
            "name"      : "ldsba",
            "latency"   : latencyA,
            "reg-read"  : {"AA1"}, #set
            "reg-mod"   : {"AR1"}, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "ldsh"        : # Load Signed Halfword
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"ldsh \[@AA1\] , @AR1",
          {
            "name"      : "ldsh",
            "latency"   : latencyA,
            "reg-read"  : {"AA1"}, #set
            "reg-mod"   : {"AR1"}, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "ldsha"       : # Load Signed Halfword from Alt Space
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"ldsha \[@AA1\] [^,]* , @AR1",
          {
            "name"      : "ldsha",
            "latency"   : latencyA,
            "reg-read"  : {"AA1"}, #set
            "reg-mod"   : {"AR1"}, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "ldub"        : # Load Unsigned Byte
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"ldub \[@AA1\] , @AR1",
          {
            "name"      : "ldub",
            "latency"   : latencyA,
            "reg-read"  : {"AA1"}, #set
            "reg-mod"   : {"AR1"}, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "lduba"       : # Load Unsigned Byte from Alt Space
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"lduba \[@AA1\] [^,]* , @AR1",
          {
            "name"      : "lduba",
            "latency"   : latencyA,
            "reg-read"  : {"AA1"}, #set
            "reg-mod"   : {"AR1"}, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "lduh"        : # Load Unsigned Halfword
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"lduh \[@AA1\] , @AR1",
          {
            "name"      : "lduh",
            "latency"   : latencyA,
            "reg-read"  : {"AA1"}, #set
            "reg-mod"   : {"AR1"}, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "lduha"       : # Load Unsigned Halfword from Alt Space
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"lduha \[@AA1\] [^,]* , @AR1",
          {
            "name"      : "lduha",
            "latency"   : latencyA,
            "reg-read"  : {"AA1"}, #set
            "reg-mod"   : {"AR1"}, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "ld"          : # Load Word
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"ld \[@AA1\] , @AR1",
          {
            "name"      : "ld",
            "latency"   : latencyA,
            "reg-read"  : {"AA1"}, #set
            "reg-mod"   : {"AR1"}, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "lda"         : # Load Word from Alt Space
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"lda \[@AA1\] [^,]* , @AR1",
          {
            "name"      : "lda",
            "latency"   : latencyA,
            "reg-read"  : {"AA1"}, #set
            "reg-mod"   : {"AR1"}, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "ldd"         : # Load Doubleword
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"ldd \[@AA1\] , @AR1",
          {
            "name"      : "ldd",
            "latency"   : latencyA,
            "reg-read"  : {"AA1"}, #set
            "reg-mod"   : {"AR1"}, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "ldda"        : # Load Doubleword from Alt Space
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"ldda \[@AA1\] [^,]* , @AR1",
          {
            "name"      : "ldda",
            "latency"   : latencyA,
            "reg-read"  : {"AA1"}, #set
            "reg-mod"   : {"AR1"}, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },


  "ldf"         : # Load Floating-point
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "ldf",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "lddf"        : # Load Double Floating-point
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "lddf",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "ldfsr"       : # Load Floating-point State Register
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "ldfsr",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },


  "ldc"         : # Load Coprocessor
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "ldc",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "lddc"        : # Load Double Coprocessor
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "lddc",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "ldcsr"       : # Load Coprocessor State Register
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "ldcsr",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },


  "stb"         : # Store Byte
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "stb",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "stba"        : # Store Byte into Alt Space
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "stba",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "sth"         : # Store Halfword
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "sth",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "stha"        : # Store Halfword into Alt Space
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "stha",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "st"          : # Store Word
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"st @AR1 , \[@AA1\]",
          {
            "name"      : "st",
            "latency"   : latencyA,
            "reg-read"  : {"AR1","AA1"}, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "sta"         : # Store Word into Alt Space
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "sta",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "std"         : # Store Doubleword
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "std",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "stda"        : # Store Doubleword into Alt Space
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "stda",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },


  "stf"         : # Store Floating-point
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "stf",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "stdf"        : # Store Double Floating-point
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "stdf",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "stfsr"       : # Store Floating-point State Register
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "stfsr",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "stdfq"       : # Store Double Floating-point deferred-trap Queue
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "stdfq",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },


  "stc"         : # Store Coprocessor
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "stc",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "stdc"        : # Store Double Coprocessor
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "stdc",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "stcsr"       : # Store Coprocessor State Register
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "stcsr",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "stdcq"       : # Store Double Coprocessor Queue
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "stdcq",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },


  "ldstub"      : # Atomic Load-Store Unsigned Byte
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "ldstub",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "ldstuba"     : # Atomic Load-Store Unsigned Byte in Alt Space
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "ldstuba",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "swap"        : # Swap r Register with Memory
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "swap",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "swapa"       : # Swap r Register with Memory in Alt Space
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "swapa",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },


  "sethi"       : # Set High 22 bits of r Register
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"sethi [^,]* , @AR1",
          {
            "name"      : "sethi",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : {"AR1"}, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "nop"         : # No Operation
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"nop",
          {
            "name"      : "nop",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },


  "and"         : # And
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "and",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "andcc"       : # And and modify icc
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "andcc",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "andn"        : # And Not
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "andn",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "andncc"      : # And Not and modify icc
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "andncc",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "or"          : # Inclusive-Or
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"or @AR1 , @AR2 , @AR3",
          {
            "name"      : "or",
            "latency"   : latencyA,
            "reg-read"  : {"AR1","AR2"}, #set
            "reg-mod"   : {"AR3"}, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "orcc"        : # Inclusive-Or and modify icc
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "orcc",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "orn"         : # Inclusive-Or Not
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "orn",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "orncc"       : # Inclusive-Or Not and modify icc
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "orncc",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "xor"         : # Exclusive-Or
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "xor",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "xorcc"       : # Exclusive-Or and modify icc
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "xorcc",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "xnor"        : # Exclusive-Nor
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "xnor",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "xnorcc"      : # Exclusive-Nor and modify icc
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "xnorcc",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },


  "sll"         : # Shift Left Logical
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "sll",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "srl"         : # Shift Right Logical
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "srl",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "sra"         : # Shift Right Arithmetic
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "sra",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },


  "add"         : # Add
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"add @AR1 , @AR2 , @AR3",
          {
            "name"      : "add",
            "latency"   : latencyA,
            "reg-read"  : {"AR1","AR2"}, #set
            "reg-mod"   : {"AR3"}, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "addcc"       : # Add and modify icc
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "addcc",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "addx"        : # Add with Carry
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "addx",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "addxcc"      : # Add with Carry and modify icc
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "addxcc",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "taddcc"      : # Tagged Add and modify icc
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "taddcc",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "taddcctv"    : # Tagged Add and modify icc and Trap on overflow
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "taddcctv",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },


  "sub"         : # Subtract
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "sub",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "subcc"       : # Subtract and modify icc
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "subcc",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "subx"        : # Subtract with Carry
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "subx",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "subxcc"      : # Subtract with Carry and modify icc
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "subxcc",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "tsubcc"      : # Tagged Subtract and modify icc
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "tsubcc",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "tsubcctv"    : # Tagged Subtract and modify icc and Trap on overflow
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "tsubcctv",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },


  "mulscc"      : # Multiply Step and modify icc
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "mulscc",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },


  "umul"        : # Unsigned Integer Multiply
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "umul",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "umulcc"      : # Unsigned Integer Multiply and modify icc
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "umulcc",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "smul"        : # Signed Integer Multiply
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "smul",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "smulcc"      : # Signed Integer Multiply and modify icc
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "smulcc",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },


  "udiv"        : # Unsigned Integer Divide
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "udiv",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "udivcc"      : # Unsigned Integer Divide and modify icc
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "udivcc",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "sdiv"        : # Signed Integer Divide
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "sdiv",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "sdivcc"      : # Signed Integer Divide and modify icc
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "sdivcc",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },


  "save"        : # Save caller's window
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "save",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "restore"     : # Restore caller's window
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "restore",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },


  # BICC        : Branch on integer condition codes
  "ba"          : # Branch Always
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "ba",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "bn"          : # Branch Never
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "bn",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "bne"         : # Branch on Not Equal
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"bne @AL1",
          {
            "name"      : "bne",
            "latency"   : latencyA,
            "reg-read"  : {"icc"}, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
        (
          r"bne,a @AL1",
          {
            "name"      : "bne",
            "latency"   : latencyA,
            "reg-read"  : {"icc"}, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "be"          : # Branch on Equal
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "be",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "bg"          : # Branch on Greater
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "bg",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "ble"         : # Branch on Less or Equal
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "ble",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "bge"         : # Branch on Greater or Equal
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "bge",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "bl"          : # Branch on Less
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "bl",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "bgu"         : # Branch on Greater Unsigned
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "bgu",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "bleu"        : # Branch on Less of Equal Unsigned
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "bleu",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "bcc"         : # Branch on Carry Clear (Greater than or Equal, Unsigned)
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "bcc",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "bcs"         : # Branch on Carry Set (Less than, Unsigned)
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "bcs",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "bpos"        : # Branch on Positive
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "bpos",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "bneg"        : # Branch on Negative
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "bneg",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "bvc"         : # Branch on Overflow Clear
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "bvc",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "bvs"         : # Branch on Overflow Set
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "bvs",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },


  # FBFCC       : Branch on floating-point condition codes
  "fba"         : # Branch Always
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "fba",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "fbn"         : # Branch Never
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "fbn",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "fbu"         : # Branch on Unordered
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "fbu",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "fbg"         : # Branch on Greater
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "fbg",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "fbug"        : # Branch on Unordered or Greater
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "fbug",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "fbl"         : # Branch on Less
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "fbl",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "fbul"        : # Branch on Unordered or Less
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "fbul",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "fblg"        : # Branch on Less or Greater
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "fblg",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "fbne"        : # Branch on Not Equal
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "fbne",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "fbe"         : # Branch on Equal
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "fbe",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "fbue"        : # Branch on Unordered or Equal
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "fbue",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "fbge"        : # Branch on Greater of Equal
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "fbge",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "fbuge"       : # Branch on Unordered or Greater or Equal
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "fbuge",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "fble"        : # Branch on Less or Equal
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "fble",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "fbule"       : # Branch on Unordered or Less or Equal
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "fbule",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "fbo"         : # Branch on Ordered
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "fbo",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },



  # CBCCC       : Branch on coprocessor condition codes
  "cba"         : # Always
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "cba",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "cbn"         : # Never
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "cbn",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "cb3"         : # 3
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "cb3",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "cb2"         : # 2
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "cb2",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "cb23"        : # 2 or 3
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "cb23",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "cb1"         : # 1
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "cb1",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "cb13"        : # 1 or 3
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "cb13",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "cb12"        : # 1 or 2
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "cb12",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "cb123"       : # 1 or 2 or 3
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "cb123",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "cb0"         : # 0
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "cb0",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "cb03"        : # 0 or 3
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "cb03",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "cb02"        : # 0 or 2
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "cb02",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "cb023"       : # 0 or 2 or 3
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "cb023",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "cb01"        : # 0 or 1
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "cb01",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "cb013"       : # 0 or 1 or 3
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "cb013",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "cb012"       : # 0 or 1 or 2
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "cb012",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },


  "call"        : # Call and Link
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "call",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "jmpl"        : # Jump and Link
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "jmpl",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "rett"        : # Return from Trap
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "rett",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },


  # TICC        : Trap on integer contition codes
  "ta"          : # Trap Always
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"ta \d+",
          {
            "name"      : "ta",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "tn"          : # Trap Never
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "tn",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "tne"         : # Trap on Not Equal
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "tne",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "te"          : # Trap on Equal
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "te",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "tg"          : # Trap on Greater
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "tg",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "tle"         : # Trap on Less or Equal
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "tle",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "tge"         : # Trap on Greater or Equal
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "tge",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "tl"          : # Trap on Less
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "tl",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "tgu"         : # Trap on Greater Unsigned
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "tgu",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "tleu"        : # Trap on Less or Equal Unsigned
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "tleu",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "tcc"         : # Trap on Carry Clear (Greater than or Equal, Unsigned)
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "tcc",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "tcs"         : # Trap on Carry Set (Less Than, Unsigned)
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "tcs",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "tpos"        : # Trap on Positive
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "tpos",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "tneg"        : # Trap on Negative
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "tneg",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "tvc"         : # Trap on Overflow Clear
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "tvc",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "tvs"         : # Trap on Overflow Set
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "tvs",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },


  "rdasr"       : # Read Ancillary State Register
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "rdasr",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "rdy"         : # Read Y Register
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "rdy",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "rdpsr"       : # Read Processor State Register
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "rdpsr",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "rdwim"       : # Read Window Invalid Mask Register
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "rdwim",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "rdtbr"       : # Read Trap Base Register
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "rdtbr",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },


  "wdasr"       : # Write Ancillary State Register
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "wdasr",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "wdy"         : # Write Y Register
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "wdy",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "wdpsr"       : # Write Processor State Register
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "wdpsr",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "wdwim"       : # Write Window Invalid Mask Register
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "wdwim",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "wdtbr"       : # Write Trap Base Register
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "wdtbr",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },


  "stbar"       : # Store Barrier
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "stbar",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },


  "unimp"       : # Unimplemented
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "unimp",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },


  "flush"       : # Flush Instruction Memory
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "flush",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },


  # FPop : Floating-point Operate (FPop1, FPop2)
  "fitos"       : # Convert Integer to Single
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "fitos",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "fitod"       : # Convert Integer to Double
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "fitod",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "fitoq"       : # Convert Integer to Quad
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "fitoq",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },


  "fstoi"       : # Convert Single to Integer
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "fstoi",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "fdtoi"       : # Convert Double to Integer
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "fdtoi",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "fqtoi"       : # Convert Quad to Integer
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "fqtoi",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },


  "fstod"       : # Convert Single to Double
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "fstod",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "fstoq"       : # Convert Single to Quad
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "fstoq",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "fdtos"       : # Convert Double to Single
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "fdtos",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "fdtoq"       : # Convert Double to Quad
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "fdtoq",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "fqtos"       : # Convert Quad to Single
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "fqtos",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "fqtod"       : # Convert Quad to Double
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "fqtod",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },


  "fmovs"       : # Move
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "fmovs",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "fnegs"       : # Negate
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "fnegs",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "fabss"       : # Absolute Value
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "fabss",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },


  "fsqrts"      : # Square Root Single
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "fsqrts",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "fsqrtd"      : # Square Root Double
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "fsqrtd",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "fsqrtq"      : # Square Root Quad
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "fsqrtq",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },


  "fadds"       : # Add Single
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "fadds",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "faddd"       : # Add Double
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "faddd",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "faddq"       : # Add Quad
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "faddq",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "fsubs"       : # Subtract Single
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "fsubs",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "fsubd"       : # Subtract Double
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "fsubd",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "fsubq"       : # Subtract Quad
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "fsubq",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },


  "fmuls"       : # Multiply Single
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "fmuls",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "fmuld"       : # Multiply Double
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "fmuld",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "fmulq"       : # Multiply Quad
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "fmulq",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "fsmuld"      : # Multiply Single to Double
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "fsmuld",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "fdmulq"      : # Multiply Double to Quad
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "fdmulq",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "fdivs"       : # Divide Single
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "fdivs",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "fdivd"       : # Divide Double
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "fdivd",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "fdivq"       : # Divide Quad
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "fdivq",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },


  "fcmps"       : # Compare Single
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "fcmps",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "fcmpd"       : # Compare Double
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "fcmpd",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "fcmpq"       : # Compare Quad
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "fcmpq",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "fcmpes"      : # Compare Single and Exception if Unordered
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "fcmpes",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "fcmped"      : # Compare Double and Exception if Unordered
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "fcmped",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "fcmpeq"      : # Compare Quad and Exception if Unordered
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "fcmpeq",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },


  # CPop        : Coprocessor Operate Instructions
  "cpop1"       : # Coprocessor Operate
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "cpop1",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "cpop2"       : # Coprocessor Operate
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "cpop2",
            "latency"   : latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  # synthetic instructions
  "mov"       : # Coprocessor Operate
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"mov @AR1 , @EM1",     # wr
          {
            "name"      : "mov",
            "latency"   : latencyA,
            "reg-read"  : {"AR1","r0"}, #set
            "reg-mod"   : {"EM1"}, #set
            "res-used"  : None, #set
          }
        ),
        (
          r"mov @EM1 , @AR1",     # rd
          {
            "name"      : "mov",
            "latency"   : latencyA,
            "reg-read"  : {"EM1"}, #set
            "reg-mod"   : {"AR1"}, #set
            "res-used"  : None, #set
          }
        ),
        (
          r"mov @AR1 , @AR2",     # or %g0, reg_or_imm, reg
          {
            "name"      : "mov",
            "latency"   : latencyA,
            "reg-read"  : {"AR1","r0"}, #set
            "reg-mod"   : {"AR2"}, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "inc"         : # increment
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"inc @AR1",
          {
            "name"      : "inc",
            "latency"   : latencyA,
            "reg-read"  : {"AR1"}, #set
            "reg-mod"   : {"AR1"}, #set
            "res-used"  : None, #set
          }
        ),
        (
          r"inc @I1 , @AR1",
          {
            "name"      : "inc",
            "latency"   : latencyA,
            "reg-read"  : {"AR1"}, #set
            "reg-mod"   : {"AR1"}, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "inccc"         : # increment
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"inccc @AR1",
          {
            "name"      : "inccc",
            "latency"   : latencyA,
            "reg-read"  : {"AR1"}, #set
            "reg-mod"   : {"AR1","icc"}, #set
            "res-used"  : None, #set
          }
        ),
        (
          r"inccc @I1 , @AR1",
          {
            "name"      : "inccc",
            "latency"   : latencyA,
            "reg-read"  : {"AR1"}, #set
            "reg-mod"   : {"AR1","icc"}, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "dec"         : # decrement
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"dec @AR1",
          {
            "name"      : "dec",
            "latency"   : latencyA,
            "reg-read"  : {"AR1"}, #set
            "reg-mod"   : {"AR1"}, #set
            "res-used"  : None, #set
          }
        ),
        (
          r"dec @I1 , @AR1",
          {
            "name"      : "dec",
            "latency"   : latencyA,
            "reg-read"  : {"AR1"}, #set
            "reg-mod"   : {"AR1"}, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "deccc"         : # decrement
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"deccc @AR1",
          {
            "name"      : "deccc",
            "latency"   : latencyA,
            "reg-read"  : {"AR1"}, #set
            "reg-mod"   : {"AR1","icc"}, #set
            "res-used"  : None, #set
          }
        ),
        (
          r"deccc @I1 , @AR1",
          {
            "name"      : "deccc",
            "latency"   : latencyA,
            "reg-read"  : {"AR1"}, #set
            "reg-mod"   : {"AR1","icc"}, #set
            "res-used"  : None, #set
          }
        ),
      ],
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


