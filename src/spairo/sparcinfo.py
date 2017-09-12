#!/usr/bin/env python3

# USER EDITABLE file containing important static information about
# Sparc(Ajit) architecture and its assembly language.
# NOTE: Never import this module. The module sparc.py should be used instead.
# This module is processes by module sparc.py to convert the user
# specified details to the system usable format.

# All the variables are available using same name in the sparc.py module.
# However the variable data may be processed into a different datatype.

# Execution of this module prints useful information.

# This python module defines the Ajit specific Sparc V8 processor details.
# Only the properties useful for this project are present here.
# These include,
# 1. Instructions, their Formats, Latencies, resources used etc.
# 2. Instruction-Pair latencies (For special cases)
# 3. Registers in the system (registers)
# 4. Sections in Assembly program.


# START : Convenient Constants

# NOTE  : Define all constants inside the Value class only.

class Value():
    """
    Defines user defined convenient constants that reduce the need to type,
    and makes the information systematic.
    """
    hitRatio        = 0.9
    missRatio       = 1 - hitRatio
    cacheLatency    = 2
    ramLatency      = 10
    memLatency      = cacheLatency * hitRatio + (ramLatency + cacheLatency) * missRatio


    latencyA        = 2
    ldLatency       = round(memLatency)
    stLatency       = round(memLatency)

# END   : Convenient Constants


# START : System Resources
resources = {
  "iu",     # integer unit
  "fpu",    # floating point unit
}

# END   : System Resources


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
  "c28", "c29", "c30", "c31",
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

# All sequence of spaces in the instruction is replaced with [ \t]*
# '^' and '$' is prefixed and suffixed to each format respectively 
instrData = {
  "ldsb"        : # Load Signed Byte
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"ldsb \[ @AA1 \] , @AR1",
          {
            "name"      : "ldsb",
            "latency"   : Value.latencyA,
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
          r"ldsba \[ @AA1 \] [^,]* , @AR1",
          {
            "name"      : "ldsba",
            "latency"   : Value.latencyA,
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
          r"ldsh \[ @AA1 \] , @AR1",
          {
            "name"      : "ldsh",
            "latency"   : Value.latencyA,
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
          r"ldsha \[ @AA1 \] [^,]* , @AR1",
          {
            "name"      : "ldsha",
            "latency"   : Value.latencyA,
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
          r"ldub \[ @AA1 \] , @AR1",
          {
            "name"      : "ldub",
            "latency"   : Value.latencyA,
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
          r"lduba \[ @AA1 \] [^,]* , @AR1",
          {
            "name"      : "lduba",
            "latency"   : Value.latencyA,
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
          r"lduh \[ @AA1 \] , @AR1",
          {
            "name"      : "lduh",
            "latency"   : Value.latencyA,
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
          r"lduha \[ @AA1 \] [^,]* , @AR1",
          {
            "name"      : "lduha",
            "latency"   : Value.latencyA,
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
          r"ld \[ @AA1 \] , @AR1",
          {
            "name"      : "ld",
            "latency"   : Value.latencyA,
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
          r"lda \[ @AA1 \] [^,]* , @AR1",
          {
            "name"      : "lda",
            "latency"   : Value.latencyA,
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
          r"ldd \[ @AA1 \] , @AD1",
          {
            "name"      : "ldd",
            "latency"   : Value.latencyA,
            "reg-read"  : {"AA1"}, #set
            "reg-mod"   : {"AD1"}, #set
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
          r"ldda \[ @AA1 \] [^,]* , @AD1",
          {
            "name"      : "ldda",
            "latency"   : Value.latencyA,
            "reg-read"  : {"AA1"}, #set
            "reg-mod"   : {"AD1"}, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },


#   "ldf"         : # Load Floating-point
#   {
#       "formats"     :
#       [
#         # List of Tuple Pairs (format, format-info)
#         (
#           r"ld \[ @AA1 \] , @AD1",
#           {
#             "name"      : "ldf",
#             "latency"   : Value.latencyA,
#             "reg-read"  : {"AA1"}, #set
#             "reg-mod"   : {"AD1"}, #set
#             "res-used"  : None, #set
#           }
#         ),
#       ],
#   },
# 
#   "lddf"        : # Load Double Floating-point
#   {
#       "formats"     :
#       [
#         # List of Tuple Pairs (format, format-info)
#         (
#           r"format1",
#           {
#             "name"      : "lddf",
#             "latency"   : Value.latencyA,
#             "reg-read"  : None, #set
#             "reg-mod"   : None, #set
#             "res-used"  : None, #set
#           }
#         ),
#       ],
#   },
# 
#   "ldfsr"       : # Load Floating-point State Register
#   {
#       "formats"     :
#       [
#         # List of Tuple Pairs (format, format-info)
#         (
#           r"format1",
#           {
#             "name"      : "ldfsr",
#             "latency"   : Value.latencyA,
#             "reg-read"  : None, #set
#             "reg-mod"   : None, #set
#             "res-used"  : None, #set
#           }
#         ),
#       ],
#   },
# 
# 
#   "ldc"         : # Load Coprocessor
#   {
#       "formats"     :
#       [
#         # List of Tuple Pairs (format, format-info)
#         (
#           r"format1",
#           {
#             "name"      : "ldc",
#             "latency"   : Value.latencyA,
#             "reg-read"  : None, #set
#             "reg-mod"   : None, #set
#             "res-used"  : None, #set
#           }
#         ),
#       ],
#   },
# 
#   "lddc"        : # Load Double Coprocessor
#   {
#       "formats"     :
#       [
#         # List of Tuple Pairs (format, format-info)
#         (
#           r"format1",
#           {
#             "name"      : "lddc",
#             "latency"   : Value.latencyA,
#             "reg-read"  : None, #set
#             "reg-mod"   : None, #set
#             "res-used"  : None, #set
#           }
#         ),
#       ],
#   },
# 
#   "ldcsr"       : # Load Coprocessor State Register
#   {
#       "formats"     :
#       [
#         # List of Tuple Pairs (format, format-info)
#         (
#           r"format1",
#           {
#             "name"      : "ldcsr",
#             "latency"   : Value.latencyA,
#             "reg-read"  : None, #set
#             "reg-mod"   : None, #set
#             "res-used"  : None, #set
#           }
#         ),
#       ],
#   },


  "stb"         : # Store Byte
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"stb @AR1 , \[ @AA1 \]",
          {
            "name"      : "stb",
            "latency"   : Value.latencyA,
            "reg-read"  : {"AR1", "AA1"}, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "stub"         : # Store Byte, synonym of stb
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"stub @AR1 , \[ @AA1 \]",
          {
            "name"      : "stub",
            "latency"   : Value.latencyA,
            "reg-read"  : {"AR1", "AA1"}, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "stsb"         : # Store Byte, synonym of stb
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"stsb @AR1 , \[ @AA1 \]",
          {
            "name"      : "stsb",
            "latency"   : Value.latencyA,
            "reg-read"  : {"AR1", "AA1"}, #set
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
          r"stba @AR1 , \[ @AA1 \] [^,]*",
          {
            "name"      : "stba",
            "latency"   : Value.latencyA,
            "reg-read"  : {"AR1", "AA1"}, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "stuba"        : # Store Byte into Alt Space, synonym of stba
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"stuba @AR1 , \[ @AA1 \] [^,]*",
          {
            "name"      : "stuba",
            "latency"   : Value.latencyA,
            "reg-read"  : {"AR1", "AA1"}, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "stsba"        : # Store Byte into Alt Space, synonym of stba
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"stsba @AR1 , \[ @AA1 \] [^,]*",
          {
            "name"      : "stsba",
            "latency"   : Value.latencyA,
            "reg-read"  : {"AR1", "AA1"}, #set
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
          r"sth @AR1 , \[ @AA1 \]",
          {
            "name"      : "sth",
            "latency"   : Value.latencyA,
            "reg-read"  : {"AR1", "AA1"}, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "stuh"         : # Store Halfword, synonym of sth
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"stuh @AR1 , \[ @AA1 \]",
          {
            "name"      : "stuh",
            "latency"   : Value.latencyA,
            "reg-read"  : {"AR1", "AA1"}, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "stsh"         : # Store Halfword, synonym of sth
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"stsh @AR1 , \[ @AA1 \]",
          {
            "name"      : "stsh",
            "latency"   : Value.latencyA,
            "reg-read"  : {"AR1", "AA1"}, #set
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
          r"stha @AR1 , \[ @AA1 \] [^,]*",
          {
            "name"      : "stha",
            "latency"   : Value.latencyA,
            "reg-read"  : {"AR1", "AA1"}, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "stuha"        : # Store Halfword into Alt Space, synonym of stha
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"stuha @AR1 , \[ @AA1 \] [^,]*",
          {
            "name"      : "stuha",
            "latency"   : Value.latencyA,
            "reg-read"  : {"AR1", "AA1"}, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "stsha"        : # Store Halfword into Alt Space, synonym of stha
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"stsha @AR1 , \[ @AA1 \] [^,]*",
          {
            "name"      : "stsha",
            "latency"   : Value.latencyA,
            "reg-read"  : {"AR1", "AA1"}, #set
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
          r"st %[cC][sS][rR] , \[ @AA1 \]", # store %fsr register after 
          {
            "name"      : "st:csr",
            "latency"   : Value.latencyA,
            "reg-read"  : {"csr", "AA1"}, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),

        (
          r"st %[fF][sS][rR] , \[ @AA1 \]", # store %fsr register after 
          {
            "name"      : "st:fsr",
            "latency"   : Value.latencyA,
            "reg-read"  : {"fsr", "AA1"}, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),

        (
          r"st @AR1 , \[ @AA1 \]",
          {
            "name"      : "st",
            "latency"   : Value.latencyA,
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
          r"sta @AR1 , \[ @AA1 \] [^,]*",
          {
            "name"      : "sta",
            "latency"   : Value.latencyA,
            "reg-read"  : {"AR1", "AA1"}, #set
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
          r"std %[cC][qQ] , \[ @AA1 \]",    # store first double in floating point queue
          {
            "name"      : "std:cq",
            "latency"   : Value.latencyA,
            "reg-read"  : {"cq", "AA1"}, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),

        (
          r"std %[fF][qQ] , \[ @AA1 \]",    # store first double in floating point queue
          {
              "name"      : "std:fq",
            "latency"   : Value.latencyA,
            "reg-read"  : {"fq", "AA1"}, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),

        (
          r"std @AD1 , \[ @AA1 \]",
          {
            "name"      : "std",
            "latency"   : Value.latencyA,
            "reg-read"  : {"AD1", "AA1"}, #set
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
          r"stb @AD1 , \[ @AA1 \] [^,]*",
          {
            "name"      : "stda",
            "latency"   : Value.latencyA,
            "reg-read"  : {"AD1", "AA1"}, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },


#   "stf"         : # Store Floating-point
#   {
#       "formats"     :
#       [
#         # List of Tuple Pairs (format, format-info)
#         (
#           r"format1",
#           {
#             "name"      : "stf",
#             "latency"   : Value.latencyA,
#             "reg-read"  : None, #set
#             "reg-mod"   : None, #set
#             "res-used"  : None, #set
#           }
#         ),
#       ],
#   },
# 
#   "stdf"        : # Store Double Floating-point
#   {
#       "formats"     :
#       [
#         # List of Tuple Pairs (format, format-info)
#         (
#           r"format1",
#           {
#             "name"      : "stdf",
#             "latency"   : Value.latencyA,
#             "reg-read"  : None, #set
#             "reg-mod"   : None, #set
#             "res-used"  : None, #set
#           }
#         ),
#       ],
#   },
# 
#   "stfsr"       : # Store Floating-point State Register
#   {
#       "formats"     :
#       [
#         # List of Tuple Pairs (format, format-info)
#         (
#           r"format1",
#           {
#             "name"      : "stfsr",
#             "latency"   : Value.latencyA,
#             "reg-read"  : None, #set
#             "reg-mod"   : None, #set
#             "res-used"  : None, #set
#           }
#         ),
#       ],
#   },
# 
#   "stdfq"       : # Store Double Floating-point deferred-trap Queue
#   {
#       "formats"     :
#       [
#         # List of Tuple Pairs (format, format-info)
#         (
#           r"format1",
#           {
#             "name"      : "stdfq",
#             "latency"   : Value.latencyA,
#             "reg-read"  : None, #set
#             "reg-mod"   : None, #set
#             "res-used"  : None, #set
#           }
#         ),
#       ],
#   },
# 
# 
#   "stc"         : # Store Coprocessor
#   {
#       "formats"     :
#       [
#         # List of Tuple Pairs (format, format-info)
#         (
#           r"format1",
#           {
#             "name"      : "stc",
#             "latency"   : Value.latencyA,
#             "reg-read"  : None, #set
#             "reg-mod"   : None, #set
#             "res-used"  : None, #set
#           }
#         ),
#       ],
#   },
# 
#   "stdc"        : # Store Double Coprocessor
#   {
#       "formats"     :
#       [
#         # List of Tuple Pairs (format, format-info)
#         (
#           r"format1",
#           {
#             "name"      : "stdc",
#             "latency"   : Value.latencyA,
#             "reg-read"  : None, #set
#             "reg-mod"   : None, #set
#             "res-used"  : None, #set
#           }
#         ),
#       ],
#   },
# 
#   "stcsr"       : # Store Coprocessor State Register
#   {
#       "formats"     :
#       [
#         # List of Tuple Pairs (format, format-info)
#         (
#           r"format1",
#           {
#             "name"      : "stcsr",
#             "latency"   : Value.latencyA,
#             "reg-read"  : None, #set
#             "reg-mod"   : None, #set
#             "res-used"  : None, #set
#           }
#         ),
#       ],
#   },
# 
#   "stdcq"       : # Store Double Coprocessor Queue
#   {
#       "formats"     :
#       [
#         # List of Tuple Pairs (format, format-info)
#         (
#           r"format1",
#           {
#             "name"      : "stdcq",
#             "latency"   : Value.latencyA,
#             "reg-read"  : None, #set
#             "reg-mod"   : None, #set
#             "res-used"  : None, #set
#           }
#         ),
#       ],
#   },


  "ldstub"      : # Atomic Load-Store Unsigned Byte
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"ldstub \[ @AA1 \] , %AR1",
          {
            "name"      : "ldstub",
            "latency"   : Value.latencyA,
            "reg-read"  : {"AA1"}, #set
            "reg-mod"   : {"AR1"}, #set
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
          r"ldstuba \[ @AA1 \] [^,]* , %AR1",
          {
            "name"      : "ldstuba",
            "latency"   : Value.latencyA,
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
          r"swap \[ @AA1 \] , %AR1",
          {
            "name"      : "swap",
            "latency"   : Value.latencyA,
            "reg-read"  : {"AA1"}, #set
            "reg-mod"   : {"AR1"}, #set
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
          r"swapa \[ @AA1 \] [^,]* , %AR1",
          {
            "name"      : "swapa",
            "latency"   : Value.latencyA,
            "reg-read"  : {"AA1"}, #set
            "reg-mod"   : {"AR1"}, #set
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
            "latency"   : Value.latencyA,
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
            "latency"   : Value.latencyA,
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
          r"and @AR1 , @AR2 , @AR3",
          {
            "name"      : "and",
            "latency"   : Value.latencyA,
            "reg-read"  : {"AR1", "AR2"}, #set
            "reg-mod"   : {"AR3"}, #set
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
          r"andcc @AR1 , @AR2 , @AR3",
          {
            "name"      : "andcc",
            "latency"   : Value.latencyA,
            "reg-read"  : {"AR1", "AR2"}, #set
            "reg-mod"   : {"AR3"}, #set
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
          r"andn @AR1 , @AR2 , @AR3",
          {
            "name"      : "andn",
            "latency"   : Value.latencyA,
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
          r"andncc @AR1 , @AR2 , @AR3",
          {
            "name"      : "andncc",
            "latency"   : Value.latencyA,
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
            "latency"   : Value.latencyA,
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
          r"orcc @AR1 , @AR2 , @AR3",
          {
            "name"      : "orcc",
            "latency"   : Value.latencyA,
            "reg-read"  : {"AR1","AR2"}, #set
            "reg-mod"   : {"AR3"}, #set
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
          r"orn @AR1 , @AR2 , @AR3",
          {
            "name"      : "orn",
            "latency"   : Value.latencyA,
            "reg-read"  : {"AR1","AR2"}, #set
            "reg-mod"   : {"AR3"}, #set
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
          r"orncc @AR1 , @AR2 , @AR3",
          {
            "name"      : "orncc",
            "latency"   : Value.latencyA,
            "reg-read"  : {"AR1","AR2"}, #set
            "reg-mod"   : {"AR3"}, #set
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
          r"xor @AR1 , @AR2 , @AR3",
          {
            "name"      : "xor",
            "latency"   : Value.latencyA,
            "reg-read"  : {"AR1","AR2"}, #set
            "reg-mod"   : {"AR3"}, #set
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
          r"xorcc @AR1 , @AR2 , @AR3",
          {
            "name"      : "xorcc",
            "latency"   : Value.latencyA,
            "reg-read"  : {"AR1","AR2"}, #set
            "reg-mod"   : {"AR3"}, #set
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
          r"xnor @AR1 , @AR2 , @AR3",
          {
            "name"      : "xnor",
            "latency"   : Value.latencyA,
            "reg-read"  : {"AR1","AR2"}, #set
            "reg-mod"   : {"AR3"}, #set
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
          r"xnorcc @AR1 , @AR2 , @AR3",
          {
            "name"      : "xnorcc",
            "latency"   : Value.latencyA,
            "reg-read"  : {"AR1","AR2"}, #set
            "reg-mod"   : {"AR3"}, #set
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
          r"sll @AR1 , @AR2 , @AR3",
          {
            "name"      : "sll",
            "latency"   : Value.latencyA,
            "reg-read"  : {"AR1","AR2"}, #set
            "reg-mod"   : {"AR3"}, #set
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
          r"srl @AR1 , @AR2 , @AR3",
          {
            "name"      : "srl",
            "latency"   : Value.latencyA,
            "reg-read"  : {"AR1","AR2"}, #set
            "reg-mod"   : {"AR3"}, #set
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
          r"sra @AR1 , @AR2 , @AR3",
          {
            "name"      : "sra",
            "latency"   : Value.latencyA,
            "reg-read"  : {"AR1","AR2"}, #set
            "reg-mod"   : {"AR3"}, #set
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
            "latency"   : Value.latencyA,
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
          r"addcc @AR1 , @AR2 , @AR3",
          {
            "name"      : "addcc",
            "latency"   : Value.latencyA,
            "reg-read"  : {"AR1","AR2"}, #set
            "reg-mod"   : {"AR3"}, #set
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
          r"addx @AR1 , @AR2 , @AR3",
          {
            "name"      : "addx",
            "latency"   : Value.latencyA,
            "reg-read"  : {"AR1","AR2"}, #set
            "reg-mod"   : {"AR3"}, #set
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
          r"addxcc @AR1 , @AR2 , @AR3",
          {
            "name"      : "addxcc",
            "latency"   : Value.latencyA,
            "reg-read"  : {"AR1","AR2"}, #set
            "reg-mod"   : {"AR3"}, #set
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
          r"taddcc @AR1 , @AR2 , @AR3",
          {
            "name"      : "taddcc",
            "latency"   : Value.latencyA,
            "reg-read"  : {"AR1","AR2"}, #set
            "reg-mod"   : {"AR3"}, #set
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
          r"taddcctv @AR1 , @AR2 , @AR3",
          {
            "name"      : "taddcctv",
            "latency"   : Value.latencyA,
            "reg-read"  : {"AR1","AR2"}, #set
            "reg-mod"   : {"AR3"}, #set
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
          r"sub @AR1 , @AR2 , @AR3",
          {
            "name"      : "sub",
            "latency"   : Value.latencyA,
            "reg-read"  : {"AR1","AR2"}, #set
            "reg-mod"   : {"AR3"}, #set
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
          r"subcc @AR1 , @AR2 , @AR3",
          {
            "name"      : "subcc",
            "latency"   : Value.latencyA,
            "reg-read"  : {"AR1","AR2"}, #set
            "reg-mod"   : {"AR3"}, #set
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
          r"subx @AR1 , @AR2 , @AR3",
          {
            "name"      : "subx",
            "latency"   : Value.latencyA,
            "reg-read"  : {"AR1","AR2"}, #set
            "reg-mod"   : {"AR3"}, #set
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
          r"subxcc @AR1 , @AR2 , @AR3",
          {
            "name"      : "subxcc",
            "latency"   : Value.latencyA,
            "reg-read"  : {"AR1","AR2"}, #set
            "reg-mod"   : {"AR3"}, #set
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
          r"tsubcc @AR1 , @AR2 , @AR3",
          {
            "name"      : "tsubcc",
            "latency"   : Value.latencyA,
            "reg-read"  : {"AR1","AR2"}, #set
            "reg-mod"   : {"AR3"}, #set
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
          r"tsubcctv @AR1 , @AR2 , @AR3",
          {
            "name"      : "tsubcctv",
            "latency"   : Value.latencyA,
            "reg-read"  : {"AR1","AR2"}, #set
            "reg-mod"   : {"AR3"}, #set
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
          r"mulscc @AR1 , @AR2 , @AR3",
          {
            "name"      : "mulscc",
            "latency"   : Value.latencyA,
            "reg-read"  : {"AR1","AR2"}, #set
            "reg-mod"   : {"y","AR1","AR3"}, #set
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
          r"umul @AR1 , @AR2 , @AR3",
          {
            "name"      : "umul",
            "latency"   : Value.latencyA,
            "reg-read"  : {"AR1","AR2"}, #set
            "reg-mod"   : {"y","AR3"}, #set
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
          r"umulcc @AR1 , @AR2 , @AR3",
          {
            "name"      : "umulcc",
            "latency"   : Value.latencyA,
            "reg-read"  : {"AR1","AR2"}, #set
            "reg-mod"   : {"y","AR3"}, #set
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
          r"smul @AR1 , @AR2 , @AR3",
          {
            "name"      : "smul",
            "latency"   : Value.latencyA,
            "reg-read"  : {"AR1","AR2"}, #set
            "reg-mod"   : {"y","AR3"}, #set
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
          r"smulcc @AR1 , @AR2 , @AR3",
          {
            "name"      : "smulcc",
            "latency"   : Value.latencyA,
            "reg-read"  : {"AR1","AR2"}, #set
            "reg-mod"   : {"y","AR3"}, #set
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
          r"udiv @AR1 , @AR2 , @AR3",
          {
            "name"      : "udiv",
            "latency"   : Value.latencyA,
            "reg-read"  : {"AR1","AR2"}, #set
            "reg-mod"   : {"y","AR3"}, #set
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
          r"udivcc @AR1 , @AR2 , @AR3",
          {
            "name"      : "udivcc",
            "latency"   : Value.latencyA,
            "reg-read"  : {"AR1","AR2"}, #set
            "reg-mod"   : {"y","AR3"}, #set
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
          r"sdiv @AR1 , @AR2 , @AR3",
          {
            "name"      : "sdiv",
            "latency"   : Value.latencyA,
            "reg-read"  : {"AR1","AR2"}, #set
            "reg-mod"   : {"y","AR3"}, #set
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
          r"sdivcc @AR1 , @AR2 , @AR3",
          {
            "name"      : "sdivcc",
            "latency"   : Value.latencyA,
            "reg-read"  : {"AR1","AR2"}, #set
            "reg-mod"   : {"y","AR3"}, #set
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
          r"save",
          {
            "name"      : "save",
            "latency"   : Value.latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),

        (
          r"save @AR1 , @AR2 , @AR3",
          {
            "name"      : "save",
            "latency"   : Value.latencyA,
            "reg-read"  : {"AR1","AR2"}, #set
            "reg-mod"   : {"AR3"}, #set
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
          r"restore",
          {
            "name"      : "restore",
            "latency"   : Value.latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),

        (
          r"restore @AR1 , @AR2 , @AR3",
          {
            "name"      : "restore",
            "latency"   : Value.latencyA,
            "reg-read"  : {"AR1","AR2"}, #set
            "reg-mod"   : {"AR3"}, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },


  # BICC        : Branch on integer condition codes (the icc register)
  "ba"          : # Branch Always
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"ba @EL1",
          {
            "name"      : "ba",
            "latency"   : Value.latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),

        (
          r"ba,a @EL1",
          {
            "name"      : "ba:a",
            "latency"   : Value.latencyA,
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
          r"bn @EL1",
          {
            "name"      : "bn",
            "latency"   : Value.latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),

        (
          r"bn,a @EL1",
          {
            "name"      : "bn:a",
            "latency"   : Value.latencyA,
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
          r"bne @EL1",
          {
            "name"      : "bne",
            "latency"   : Value.latencyA,
            "reg-read"  : {"icc"}, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),

        (
          r"bne,a @EL1",
          {
            "name"      : "bne:a",
            "latency"   : Value.latencyA,
            "reg-read"  : {"icc"}, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  }

  "bnz"         : # Branch on Not Equal, synonym of bne
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"bnz @EL1",
          {
            "name"      : "bne",
            "latency"   : Value.latencyA,
            "reg-read"  : {"icc"}, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),

        (
          r"bnz,a @EL1",
          {
            "name"      : "bne:a",
            "latency"   : Value.latencyA,
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
          r"be @EL1",
          {
            "name"      : "be",
            "latency"   : Value.latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),

        (
          r"be,a @EL1",
          {
            "name"      : "be:a",
            "latency"   : Value.latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "bz"          : # Branch on Equal, synonym of be
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"bz @EL1",
          {
            "name"      : "be",
            "latency"   : Value.latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),

        (
          r"bz,a @EL1",
          {
            "name"      : "be:a",
            "latency"   : Value.latencyA,
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
          r"bg @EL1",
          {
            "name"      : "bg",
            "latency"   : Value.latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),

        (
          r"bg,a @EL1",
          {
            "name"      : "bg:a",
            "latency"   : Value.latencyA,
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
          r"ble @EL1",
          {
            "name"      : "ble",
            "latency"   : Value.latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),

        (
          r"ble,a @EL1",
          {
            "name"      : "ble:a",
            "latency"   : Value.latencyA,
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
          r"bge @EL1",
          {
            "name"      : "bge",
            "latency"   : Value.latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),

        (
          r"bge,a @EL1",
          {
            "name"      : "bge:a",
            "latency"   : Value.latencyA,
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
          r"bl @EL1",
          {
            "name"      : "bl",
            "latency"   : Value.latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),

        (
          r"bl,a @EL1",
          {
            "name"      : "bl:a",
            "latency"   : Value.latencyA,
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
          r"bgu @EL1",
          {
            "name"      : "bgu",
            "latency"   : Value.latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),

        (
          r"bgu,a @EL1",
          {
            "name"      : "bgu:a",
            "latency"   : Value.latencyA,
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
          r"bleu @EL1",
          {
            "name"      : "bleu",
            "latency"   : Value.latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),

        (
          r"bleu,a @EL1",
          {
            "name"      : "bleu:a",
            "latency"   : Value.latencyA,
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
          r"bcc @EL1",
          {
            "name"      : "bcc",
            "latency"   : Value.latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),

        (
          r"bcc,a @EL1",
          {
            "name"      : "bcc:a",
            "latency"   : Value.latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "bgeu"         : # Branch on Carry Clear (Greater than or Equal, Unsigned), synonym of bcc
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"bgeu @EL1",
          {
            "name"      : "bcc",
            "latency"   : Value.latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),

        (
          r"bgeu,a @EL1",
          {
            "name"      : "bcc:a",
            "latency"   : Value.latencyA,
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
          r"bcs @EL1",
          {
            "name"      : "bcs",
            "latency"   : Value.latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),

        (
          r"bcs,a @EL1",
          {
            "name"      : "bcs:a",
            "latency"   : Value.latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "blu"         : # Branch on Carry Set (Less than, Unsigned), synonym of bcs
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"blu @EL1",
          {
            "name"      : "blu",
            "latency"   : Value.latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),

        (
          r"blu,a @EL1",
          {
            "name"      : "blu:a",
            "latency"   : Value.latencyA,
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
          r"bpos @EL1",
          {
            "name"      : "bpos",
            "latency"   : Value.latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),

        (
          r"bpos,a @EL1",
          {
            "name"      : "bpos:a",
            "latency"   : Value.latencyA,
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
          r"bneg @EL1",
          {
            "name"      : "bneg",
            "latency"   : Value.latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),

        (
          r"bneg,a @EL1",
          {
            "name"      : "bneg:a",
            "latency"   : Value.latencyA,
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
          r"bvc @EL1",
          {
            "name"      : "bvc",
            "latency"   : Value.latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),

        (
          r"bvc,a @EL1",
          {
            "name"      : "bvc:a",
            "latency"   : Value.latencyA,
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
          r"bvs @EL1",
          {
            "name"      : "bvs",
            "latency"   : Value.latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),

        (
          r"bvs,a @EL1",
          {
            "name"      : "bvs:a",
            "latency"   : Value.latencyA,
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
          r"fba @EL1",
          {
            "name"      : "fba",
            "latency"   : Value.latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
        (
          r"fba,a @EL1",
          {
            "name"      : "fba:a",
            "latency"   : Value.latencyA,
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
          r"fbn @EL1",
          {
            "name"      : "fbn",
            "latency"   : Value.latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
        (
          r"fbn,a @EL1",
          {
            "name"      : "fbn:a",
            "latency"   : Value.latencyA,
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
          r"fbu @EL1",
          {
            "name"      : "fbu",
            "latency"   : Value.latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
        (
          r"fbu,a @EL1",
          {
            "name"      : "fbu:a",
            "latency"   : Value.latencyA,
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
          r"fbg @EL1",
          {
            "name"      : "fbg",
            "latency"   : Value.latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
        (
          r"fbg,a @EL1",
          {
            "name"      : "fbg:a",
            "latency"   : Value.latencyA,
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
          r"fbug @EL1",
          {
            "name"      : "fbug",
            "latency"   : Value.latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
        (
          r"fbug,a @EL1",
          {
            "name"      : "fbug:a",
            "latency"   : Value.latencyA,
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
          r"fbl @EL1",
          {
            "name"      : "fbl",
            "latency"   : Value.latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
        (
          r"fbl,a @EL1",
          {
            "name"      : "fbl:a",
            "latency"   : Value.latencyA,
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
          r"fbul @EL1",
          {
            "name"      : "fbul",
            "latency"   : Value.latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
        (
          r"fbul,a @EL1",
          {
            "name"      : "fbul:a",
            "latency"   : Value.latencyA,
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
          r"fblg @EL1",
          {
            "name"      : "fblg",
            "latency"   : Value.latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),

        (
          r"fblg,a @EL1",
          {
            "name"      : "fblg:a",
            "latency"   : Value.latencyA,
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
          r"fbne @EL1",
          {
            "name"      : "fbne",
            "latency"   : Value.latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),

        (
          r"fbne,a @EL1",
          {
            "name"      : "fbne:a",
            "latency"   : Value.latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "fbnz"        : # Branch on Not Equal, synonym of fbne
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"fbnz @EL1",
          {
            "name"      : "fbne",
            "latency"   : Value.latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),

        (
          r"fbnz,a @EL1",
          {
            "name"      : "fbne:a",
            "latency"   : Value.latencyA,
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
          r"fbe @EL1",
          {
            "name"      : "fbe",
            "latency"   : Value.latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),

        (
          r"fbe,a @EL1",
          {
            "name"      : "fbe:a",
            "latency"   : Value.latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },

  "fbz"         : # Branch on Equal, synonym of fbe
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"fbz @EL1",
          {
            "name"      : "fbe",
            "latency"   : Value.latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),

        (
          r"fbz,a @EL1",
          {
            "name"      : "fbe:a",
            "latency"   : Value.latencyA,
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
          r"fbue @EL1",
          {
            "name"      : "fbue",
            "latency"   : Value.latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),

        (
          r"fbue,a @EL1",
          {
            "name"      : "fbue:a",
            "latency"   : Value.latencyA,
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
          r"fbge @EL1",
          {
            "name"      : "fbge",
            "latency"   : Value.latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),

        (
          r"fbge,a @EL1",
          {
            "name"      : "fbge:a",
            "latency"   : Value.latencyA,
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
          r"fbuge @EL1",
          {
            "name"      : "fbuge",
            "latency"   : Value.latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),

        (
          r"fbuge,a @EL1",
          {
            "name"      : "fbuge:a",
            "latency"   : Value.latencyA,
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
          r"fble @EL1",
          {
            "name"      : "fble",
            "latency"   : Value.latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),

        (
          r"fble,a @EL1",
          {
            "name"      : "fble:a",
            "latency"   : Value.latencyA,
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
          r"fbule @EL1",
          {
            "name"      : "fbule",
            "latency"   : Value.latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),

        (
          r"fbule,a @EL1",
          {
            "name"      : "fbule:a",
            "latency"   : Value.latencyA,
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
          r"fbo @EL1",
          {
            "name"      : "fbo",
            "latency"   : Value.latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),

        (
          r"fbo,a @EL1",
          {
            "name"      : "fbo:a",
            "latency"   : Value.latencyA,
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
          r"cba @EL1",
          {
            "name"      : "cba",
            "latency"   : Value.latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),

        (
          r"cba,a @EL1",
          {
            "name"      : "cba:a",
            "latency"   : Value.latencyA,
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
          r"cbn @EL1",
          {
            "name"      : "cbn",
            "latency"   : Value.latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),

        (
          r"cbn,a @EL1",
          {
            "name"      : "cbn:a",
            "latency"   : Value.latencyA,
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
          r"cb3 @EL1",
          {
            "name"      : "cb3",
            "latency"   : Value.latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),

        (
          r"cb3,a @EL1",
          {
            "name"      : "cb3:a",
            "latency"   : Value.latencyA,
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
          r"cb2 @EL1",
          {
            "name"      : "cb2",
            "latency"   : Value.latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),

        (
          r"cb2,a @EL1",
          {
            "name"      : "cb2:a",
            "latency"   : Value.latencyA,
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
          r"cb23 @EL1",
          {
            "name"      : "cb23",
            "latency"   : Value.latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),

        (
          r"cb23,a @EL1",
          {
            "name"      : "cb23:a",
            "latency"   : Value.latencyA,
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
          r"cb1 @EL1",
          {
            "name"      : "cb1",
            "latency"   : Value.latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),

        (
          r"cb1,a @EL1",
          {
            "name"      : "cb1:a",
            "latency"   : Value.latencyA,
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
          r"cb13 @EL1",
          {
            "name"      : "cb13",
            "latency"   : Value.latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),

        (
          r"cb13,a @EL1",
          {
            "name"      : "cb13:a",
            "latency"   : Value.latencyA,
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
          r"cb12 @EL1",
          {
            "name"      : "cb12",
            "latency"   : Value.latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),

        (
          r"cb12,a @EL1",
          {
            "name"      : "cb12:a",
            "latency"   : Value.latencyA,
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
          r"cb123 @EL1",
          {
            "name"      : "cb123",
            "latency"   : Value.latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),

        (
          r"cb123,a @EL1",
          {
            "name"      : "cb123:a",
            "latency"   : Value.latencyA,
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
          r"cb0 @EL1",
          {
            "name"      : "cb0",
            "latency"   : Value.latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),

        (
          r"cb0,a @EL1",
          {
            "name"      : "cb0:a",
            "latency"   : Value.latencyA,
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
          r"cb03 @EL1",
          {
            "name"      : "cb03",
            "latency"   : Value.latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),

        (
          r"cb03,a @EL1",
          {
            "name"      : "cb03:a",
            "latency"   : Value.latencyA,
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
          r"cb02 @EL1",
          {
            "name"      : "cb02",
            "latency"   : Value.latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),

        (
          r"cb02,a @EL1",
          {
            "name"      : "cb02:a",
            "latency"   : Value.latencyA,
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
          r"cb023 @EL1",
          {
            "name"      : "cb023",
            "latency"   : Value.latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),

        (
          r"cb023,a @EL1",
          {
            "name"      : "cb023:a",
            "latency"   : Value.latencyA,
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
          r"cb01 @EL1",
          {
            "name"      : "cb01",
            "latency"   : Value.latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),

        (
          r"cb01,a @EL1",
          {
            "name"      : "cb01:a",
            "latency"   : Value.latencyA,
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
          r"cb013 @EL1",
          {
            "name"      : "cb013",
            "latency"   : Value.latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),

        (
          r"cb013,a @EL1",
          {
            "name"      : "cb013:a",
            "latency"   : Value.latencyA,
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
          r"cb012 @EL1",
          {
            "name"      : "cb012",
            "latency"   : Value.latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
          }
        ),

        (
          r"cb012,a @EL1",
          {
            "name"      : "cb012:a",
            "latency"   : Value.latencyA,
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
            "latency"   : Value.latencyA,
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
            "latency"   : Value.latencyA,
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
            "latency"   : Value.latencyA,
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
            "latency"   : Value.latencyA,
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
            "latency"   : Value.latencyA,
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
            "latency"   : Value.latencyA,
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
            "latency"   : Value.latencyA,
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
            "latency"   : Value.latencyA,
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
            "latency"   : Value.latencyA,
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
            "latency"   : Value.latencyA,
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
            "latency"   : Value.latencyA,
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
            "latency"   : Value.latencyA,
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
            "latency"   : Value.latencyA,
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
            "latency"   : Value.latencyA,
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
            "latency"   : Value.latencyA,
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
            "latency"   : Value.latencyA,
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
            "latency"   : Value.latencyA,
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
            "latency"   : Value.latencyA,
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
            "latency"   : Value.latencyA,
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
            "latency"   : Value.latencyA,
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
            "latency"   : Value.latencyA,
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
            "latency"   : Value.latencyA,
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
            "latency"   : Value.latencyA,
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
            "latency"   : Value.latencyA,
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
            "latency"   : Value.latencyA,
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
            "latency"   : Value.latencyA,
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
            "latency"   : Value.latencyA,
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
            "latency"   : Value.latencyA,
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
            "latency"   : Value.latencyA,
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
            "latency"   : Value.latencyA,
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
            "latency"   : Value.latencyA,
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
            "latency"   : Value.latencyA,
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
            "latency"   : Value.latencyA,
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
            "latency"   : Value.latencyA,
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
            "latency"   : Value.latencyA,
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
            "latency"   : Value.latencyA,
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
            "latency"   : Value.latencyA,
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
            "latency"   : Value.latencyA,
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
            "latency"   : Value.latencyA,
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
            "latency"   : Value.latencyA,
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
            "latency"   : Value.latencyA,
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
            "latency"   : Value.latencyA,
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
            "latency"   : Value.latencyA,
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
            "latency"   : Value.latencyA,
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
            "latency"   : Value.latencyA,
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
            "latency"   : Value.latencyA,
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
            "latency"   : Value.latencyA,
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
            "latency"   : Value.latencyA,
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
            "latency"   : Value.latencyA,
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
            "latency"   : Value.latencyA,
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
            "latency"   : Value.latencyA,
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
            "latency"   : Value.latencyA,
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
            "latency"   : Value.latencyA,
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
            "latency"   : Value.latencyA,
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
            "latency"   : Value.latencyA,
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
            "latency"   : Value.latencyA,
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
            "latency"   : Value.latencyA,
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
            "latency"   : Value.latencyA,
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
            "latency"   : Value.latencyA,
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
            "latency"   : Value.latencyA,
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
            "latency"   : Value.latencyA,
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
            "latency"   : Value.latencyA,
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
            "latency"   : Value.latencyA,
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
            "latency"   : Value.latencyA,
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
            "latency"   : Value.latencyA,
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
            "latency"   : Value.latencyA,
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
            "latency"   : Value.latencyA,
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
            "latency"   : Value.latencyA,
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
            "latency"   : Value.latencyA,
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
            "latency"   : Value.latencyA,
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
            "latency"   : Value.latencyA,
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
            "latency"   : Value.latencyA,
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
            "latency"   : Value.latencyA,
            "reg-read"  : {"AR1","r0"}, #set
            "reg-mod"   : {"EM1"}, #set
            "res-used"  : None, #set
          }
        ),
        (
          r"mov @EM1 , @AR1",     # rd
          {
            "name"      : "mov",
            "latency"   : Value.latencyA,
            "reg-read"  : {"EM1"}, #set
            "reg-mod"   : {"AR1"}, #set
            "res-used"  : None, #set
          }
        ),
        (
          r"mov @AR1 , @AR2",     # or %g0, reg_or_imm, reg
          {
            "name"      : "mov",
            "latency"   : Value.latencyA,
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
            "latency"   : Value.latencyA,
            "reg-read"  : {"AR1"}, #set
            "reg-mod"   : {"AR1"}, #set
            "res-used"  : None, #set
          }
        ),
        (
          r"inc @I1 , @AR1",
          {
            "name"      : "inc",
            "latency"   : Value.latencyA,
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
            "latency"   : Value.latencyA,
            "reg-read"  : {"AR1"}, #set
            "reg-mod"   : {"AR1","icc"}, #set
            "res-used"  : None, #set
          }
        ),
        (
          r"inccc @I1 , @AR1",
          {
            "name"      : "inccc",
            "latency"   : Value.latencyA,
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
            "latency"   : Value.latencyA,
            "reg-read"  : {"AR1"}, #set
            "reg-mod"   : {"AR1"}, #set
            "res-used"  : None, #set
          }
        ),
        (
          r"dec @I1 , @AR1",
          {
            "name"      : "dec",
            "latency"   : Value.latencyA,
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
            "latency"   : Value.latencyA,
            "reg-read"  : {"AR1"}, #set
            "reg-mod"   : {"AR1","icc"}, #set
            "res-used"  : None, #set
          }
        ),
        (
          r"deccc @I1 , @AR1",
          {
            "name"      : "deccc",
            "latency"   : Value.latencyA,
            "reg-read"  : {"AR1"}, #set
            "reg-mod"   : {"AR1","icc"}, #set
            "res-used"  : None, #set
          }
        ),
      ],
  },
}

# Pefix '@' to the keys defined here, and suffix a single decimal digit.
# It is used in the specification of the instruction format.
# Each '@<ALPHABETS><NUM>' in the format is replaced with '(?P<ALPHABETSNUM>.*?)'
# And the matched text is processes using the regular expression the alphabet
# is mapped to.
# The first char should be one of A or E.
# A = All matches
# E = Exact match
# NOTE  : Changing the semantics of these keys may require changes in
#         sparc.py and instruction.py as well.
regexMap = {

  # R: Register expression
  # Extract the Registers (one by one)
  "AR"   : r"%\w+",

  # D: Double word register expression
  # Extract the Registers (one by one)
  # Add the following odd register too.
  # e.g. if r6 is found add r7 too.
  "AD"   : r"%\w+",

  # A: Address expression
  # Extract All Registers
  # If a single or no register is found, add %r0 as a register being read
  "AA"   : r"%\w+",

  # Set of registers specially for the mov synthetic instruction
  "EM"   : r"%y|%asr\d+|%psr|%wim|%tbr(?i)",

  # I: Immediate value expression
  # Extract Immediate Value
  "EI"   : r"[-+]?[ \t]*\d+|[-+]?[ \t]*0[xX][0-9a-fA-F]+",

  # L: Label
  # Extract Label Name
  "EL"   : r"[.$_a-zA-Z][.$_a-zA-Z0-9]",
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


# START : Sections in Assembly Program

# Set of all sections possible.
# It is populated in the sparc.py module using userSections and nonUserSections
# below.
sections = None

# Predefined User Sections.
# NOTE: They are automatically combined with .rel and .rela section prefix.
userSections = {".bss", ".comment", ".data", ".data1", ".debug", ".fini", ".init",
        ".rodata", ".rodata1", ".text", ".line", ".note"}
# Predefined Non-User Sections
# These are sections that are predefined but cannot be named
# in the section control directives because they are not under user control
# NOTE: They are automatically combined with .rel and .rela section prefix.
nonUserSections = {".dynamic", ".dynstr", ".dynsym", ".got", ".hash", ".interp",
        ".plt", ".shstrtab", ".strtab", ".symtab"}

# END   : Sections in Assembly Program

def printInfo():
  print("Total Instructions     :", len(instructions))
  print("Cache Hit Ratio        :", Value.hitRatio)
  print("Cache Latency          :", Value.cacheLatency)
  print("Ram Latency            :", Value.ramLatency)
  print("Avg. Mem Latency       :", Value.memLatency)
  print("User Sections        :", userSections)
  print("Non-User Sections    :", nonUserSections)
  print("All Sections         :", sections)

if __name__ == "__main__":
    printInfo()


