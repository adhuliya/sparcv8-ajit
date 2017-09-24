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
    Defines user defined convenient constants that reduce the need to type, and makes the information systematic.
    """
    hitRatio        = 0.9
    missRatio       = 1 - hitRatio
    cacheLatency    = 2
    ramLatency      = 10
    memLatency      = cacheLatency * hitRatio + (ramLatency + cacheLatency) * missRatio


    latencyA        = 2
    latencyB        = 1
    latencyC        = 3
    latencyD        = 30
    latencyE        = 50

    ldLatency       = round(memLatency)
    stLatency       = round(memLatency)

# END   : Convenient Constants


# START : System Resources
pipeline        = 3

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
            "destLabel" : None, #set
            "delaySlot" : False,
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
            "destLabel" : None, #set
            "delaySlot" : False,
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
            "destLabel" : None, #set
            "delaySlot" : False,
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
            "destLabel" : None, #set
            "delaySlot" : False,
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
            "destLabel" : None, #set
            "delaySlot" : False,
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
            "destLabel" : None, #set
            "delaySlot" : False,
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
            "destLabel" : None, #set
            "delaySlot" : False,
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
            "destLabel" : None, #set
            "delaySlot" : False,
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
            "destLabel" : None, #set
            "delaySlot" : False,
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
            "destLabel" : None, #set
            "delaySlot" : False,
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
          r"ldd \[ @AA1 \] , @ED1",
          {
            "name"      : "ldd",
            "latency"   : Value.latencyA,
            "reg-read"  : {"AA1"}, #set
            "reg-mod"   : {"ED1"}, #set
            "res-used"  : None, #set
            "destLabel" : None, #set
            "delaySlot" : False,
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
          r"ldda \[ @AA1 \] [^,]* , @ED1",
          {
            "name"      : "ldda",
            "latency"   : Value.latencyA,
            "reg-read"  : {"AA1"}, #set
            "reg-mod"   : {"ED1"}, #set
            "res-used"  : None, #set
            "destLabel" : None, #set
            "delaySlot" : False,
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
#           r"ld \[ @AA1 \] , @ED1",
#           {
#             "name"      : "ldf",
#             "latency"   : Value.latencyA,
#             "reg-read"  : {"AA1"}, #set
#             "reg-mod"   : {"ED1"}, #set
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
            "destLabel" : None, #set
            "delaySlot" : False,
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
            "destLabel" : None, #set
            "delaySlot" : False,
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
            "destLabel" : None, #set
            "delaySlot" : False,
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
            "destLabel" : None, #set
            "delaySlot" : False,
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
            "destLabel" : None, #set
            "delaySlot" : False,
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
            "destLabel" : None, #set
            "delaySlot" : False,
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
            "destLabel" : None, #set
            "delaySlot" : False,
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
            "destLabel" : None, #set
            "delaySlot" : False,
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
            "destLabel" : None, #set
            "delaySlot" : False,
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
            "destLabel" : None, #set
            "delaySlot" : False,
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
            "destLabel" : None, #set
            "delaySlot" : False,
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
            "destLabel" : None, #set
            "delaySlot" : False,
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
            "destLabel" : None, #set
            "delaySlot" : False,
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
            "destLabel" : None, #set
            "delaySlot" : False,
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
            "destLabel" : None, #set
            "delaySlot" : False,
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
            "destLabel" : None, #set
            "delaySlot" : False,
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
            "destLabel" : None, #set
            "delaySlot" : False,
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
            "destLabel" : None, #set
            "delaySlot" : False,
          }
        ),

        (
          r"std @ED1 , \[ @AA1 \]",
          {
            "name"      : "std",
            "latency"   : Value.latencyA,
            "reg-read"  : {"ED1", "AA1"}, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
            "destLabel" : None, #set
            "delaySlot" : False,
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
          r"stb @ED1 , \[ @AA1 \] [^,]*",
          {
            "name"      : "stda",
            "latency"   : Value.latencyA,
            "reg-read"  : {"ED1", "AA1"}, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
            "destLabel" : None, #set
            "delaySlot" : False,
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
            "destLabel" : None, #set
            "delaySlot" : False,
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
            "destLabel" : None, #set
            "delaySlot" : False,
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
            "destLabel" : None, #set
            "delaySlot" : False,
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
            "destLabel" : None, #set
            "delaySlot" : False,
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
            "destLabel" : None, #set
            "delaySlot" : False,
          }
        ),
      ],
  },

  "set"       : # Set High all bits of r Register
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"set [^,]* , @AR1",
          {
            "name"      : "set",
            "latency"   : Value.latencyA,
            "reg-read"  : {"r0"}, #set
            "reg-mod"   : {"AR1"}, #set
            "res-used"  : None, #set
            "destLabel" : None, #set
            "delaySlot" : False,
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
            "latency"   : Value.latencyB,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
            "destLabel" : None, #set
            "delaySlot" : False,
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
            "latency"   : Value.latencyB,
            "reg-read"  : {"AR1", "AR2"}, #set
            "reg-mod"   : {"AR3"}, #set
            "res-used"  : None, #set
            "destLabel" : None, #set
            "delaySlot" : False,
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
            "latency"   : Value.latencyB,
            "reg-read"  : {"AR1", "AR2"}, #set
            "reg-mod"   : {"AR3"}, #set
            "res-used"  : None, #set
            "destLabel" : None, #set
            "delaySlot" : False,
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
            "latency"   : Value.latencyB,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
            "destLabel" : None, #set
            "delaySlot" : False,
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
            "latency"   : Value.latencyB,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
            "destLabel" : None, #set
            "delaySlot" : False,
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
            "latency"   : Value.latencyB,
            "reg-read"  : {"AR1","AR2"}, #set
            "reg-mod"   : {"AR3"}, #set
            "res-used"  : None, #set
            "destLabel" : None, #set
            "delaySlot" : False,
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
            "latency"   : Value.latencyB,
            "reg-read"  : {"AR1","AR2"}, #set
            "reg-mod"   : {"AR3"}, #set
            "res-used"  : None, #set
            "destLabel" : None, #set
            "delaySlot" : False,
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
            "latency"   : Value.latencyB,
            "reg-read"  : {"AR1","AR2"}, #set
            "reg-mod"   : {"AR3"}, #set
            "res-used"  : None, #set
            "destLabel" : None, #set
            "delaySlot" : False,
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
            "latency"   : Value.latencyB,
            "reg-read"  : {"AR1","AR2"}, #set
            "reg-mod"   : {"AR3"}, #set
            "res-used"  : None, #set
            "destLabel" : None, #set
            "delaySlot" : False,
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
            "latency"   : Value.latencyB,
            "reg-read"  : {"AR1","AR2"}, #set
            "reg-mod"   : {"AR3"}, #set
            "res-used"  : None, #set
            "destLabel" : None, #set
            "delaySlot" : False,
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
            "latency"   : Value.latencyB,
            "reg-read"  : {"AR1","AR2"}, #set
            "reg-mod"   : {"AR3"}, #set
            "res-used"  : None, #set
            "destLabel" : None, #set
            "delaySlot" : False,
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
            "latency"   : Value.latencyB,
            "reg-read"  : {"AR1","AR2"}, #set
            "reg-mod"   : {"AR3"}, #set
            "res-used"  : None, #set
            "destLabel" : None, #set
            "delaySlot" : False,
          }
        ),
      ],
  },

  "not"        : # one's complement -- synonym for xnor (uses xnor)
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"not @AR1 , @AR2",
          {
            "name"      : "not",
            "latency"   : Value.latencyB,
            "reg-read"  : {"AR1"}, #set
            "reg-mod"   : {"AR2"}, #set
            "res-used"  : None, #set
            "destLabel" : None, #set
            "delaySlot" : False,
          }
        ),

        (
          r"not @AR1",
          {
            "name"      : "not",
            "latency"   : Value.latencyB,
            "reg-read"  : {"AR1"}, #set
            "reg-mod"   : {"AR1"}, #set
            "res-used"  : None, #set
            "destLabel" : None, #set
            "delaySlot" : False,
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
            "latency"   : Value.latencyB,
            "reg-read"  : {"AR1","AR2"}, #set
            "reg-mod"   : {"AR3"}, #set
            "res-used"  : None, #set
            "destLabel" : None, #set
            "delaySlot" : False,
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
            "latency"   : Value.latencyB,
            "reg-read"  : {"AR1","AR2"}, #set
            "reg-mod"   : {"AR3"}, #set
            "res-used"  : None, #set
            "destLabel" : None, #set
            "delaySlot" : False,
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
            "latency"   : Value.latencyB,
            "reg-read"  : {"AR1","AR2"}, #set
            "reg-mod"   : {"AR3"}, #set
            "res-used"  : None, #set
            "destLabel" : None, #set
            "delaySlot" : False,
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
            "latency"   : Value.latencyB,
            "reg-read"  : {"AR1","AR2"}, #set
            "reg-mod"   : {"AR3"}, #set
            "res-used"  : None, #set
            "destLabel" : None, #set
            "delaySlot" : False,
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
            "latency"   : Value.latencyB,
            "reg-read"  : {"AR1","AR2"}, #set
            "reg-mod"   : {"AR3"}, #set
            "res-used"  : None, #set
            "destLabel" : None, #set
            "delaySlot" : False,
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
            "latency"   : Value.latencyB,
            "reg-read"  : {"AR1","AR2"}, #set
            "reg-mod"   : {"AR3"}, #set
            "res-used"  : None, #set
            "destLabel" : None, #set
            "delaySlot" : False,
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
            "latency"   : Value.latencyB,
            "reg-read"  : {"AR1","AR2"}, #set
            "reg-mod"   : {"AR3"}, #set
            "res-used"  : None, #set
            "destLabel" : None, #set
            "delaySlot" : False,
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
            "latency"   : Value.latencyB,
            "reg-read"  : {"AR1","AR2"}, #set
            "reg-mod"   : {"AR3"}, #set
            "res-used"  : None, #set
            "destLabel" : None, #set
            "delaySlot" : False,
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
            "latency"   : Value.latencyB,
            "reg-read"  : {"AR1","AR2"}, #set
            "reg-mod"   : {"AR3"}, #set
            "res-used"  : None, #set
            "destLabel" : None, #set
            "delaySlot" : False,
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
            "latency"   : Value.latencyB,
            "reg-read"  : {"AR1","AR2"}, #set
            "reg-mod"   : {"AR3"}, #set
            "res-used"  : None, #set
            "destLabel" : None, #set
            "delaySlot" : False,
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
            "latency"   : Value.latencyB,
            "reg-read"  : {"AR1","AR2"}, #set
            "reg-mod"   : {"AR3"}, #set
            "res-used"  : None, #set
            "destLabel" : None, #set
            "delaySlot" : False,
          }
        ),
      ],
  },

  "neg"         : # Subtract, synonym for sub (uses sub)
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"neg @AR1 , @AR2",       # sub %g0 , @AR1, @AR2
          {
            "name"      : "neg",
            "latency"   : Value.latencyB,
            "reg-read"  : {"AR1"}, #set
            "reg-mod"   : {"AR2"}, #set
            "res-used"  : None, #set
            "destLabel" : None, #set
            "delaySlot" : False,
          }
        ),

        (
          r"neg @AR1",       # sub %g0 , @AR1, @AR1
          {
            "name"      : "neg",
            "latency"   : Value.latencyB,
            "reg-read"  : {"AR1"}, #set
            "reg-mod"   : {"AR1"}, #set
            "res-used"  : None, #set
            "destLabel" : None, #set
            "delaySlot" : False,
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
            "latency"   : Value.latencyB,
            "reg-read"  : {"AR1","AR2"}, #set
            "reg-mod"   : {"AR3"}, #set
            "res-used"  : None, #set
            "destLabel" : None, #set
            "delaySlot" : False,
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
            "latency"   : Value.latencyB,
            "reg-read"  : {"AR1","AR2"}, #set
            "reg-mod"   : {"AR3"}, #set
            "res-used"  : None, #set
            "destLabel" : None, #set
            "delaySlot" : False,
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
            "latency"   : Value.latencyB,
            "reg-read"  : {"AR1","AR2"}, #set
            "reg-mod"   : {"AR3"}, #set
            "res-used"  : None, #set
            "destLabel" : None, #set
            "delaySlot" : False,
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
            "latency"   : Value.latencyB,
            "reg-read"  : {"AR1","AR2"}, #set
            "reg-mod"   : {"AR3"}, #set
            "res-used"  : None, #set
            "destLabel" : None, #set
            "delaySlot" : False,
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
            "latency"   : Value.latencyB,
            "reg-read"  : {"AR1","AR2"}, #set
            "reg-mod"   : {"AR3"}, #set
            "res-used"  : None, #set
            "destLabel" : None, #set
            "delaySlot" : False,
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
            "destLabel" : None, #set
            "delaySlot" : False,
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
            "destLabel" : None, #set
            "delaySlot" : False,
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
            "destLabel" : None, #set
            "delaySlot" : False,
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
            "destLabel" : None, #set
            "delaySlot" : False,
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
            "destLabel" : None, #set
            "delaySlot" : False,
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
            "latency"   : Value.latencyD,
            "reg-read"  : {"AR1","AR2"}, #set
            "reg-mod"   : {"y","AR3"}, #set
            "res-used"  : None, #set
            "destLabel" : None, #set
            "delaySlot" : False,
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
            "latency"   : Value.latencyD,
            "reg-read"  : {"AR1","AR2"}, #set
            "reg-mod"   : {"y","AR3"}, #set
            "res-used"  : None, #set
            "destLabel" : None, #set
            "delaySlot" : False,
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
            "latency"   : Value.latencyD,
            "reg-read"  : {"AR1","AR2"}, #set
            "reg-mod"   : {"y","AR3"}, #set
            "res-used"  : None, #set
            "destLabel" : None, #set
            "delaySlot" : False,
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
            "latency"   : Value.latencyD,
            "reg-read"  : {"AR1","AR2"}, #set
            "reg-mod"   : {"y","AR3"}, #set
            "res-used"  : None, #set
            "destLabel" : None, #set
            "delaySlot" : False,
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
            "latency"   : Value.latencyC,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
            "destLabel" : None, #set
            "delaySlot" : False,
          }
        ),

        (
          r"save @AR1 , @AR2 , @AR3",
          {
            "name"      : "save",
            "latency"   : Value.latencyC,
            "reg-read"  : {"AR1","AR2"}, #set
            "reg-mod"   : {"AR3"}, #set
            "res-used"  : None, #set
            "destLabel" : None, #set
            "delaySlot" : False,
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
            "latency"   : Value.latencyC,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
            "destLabel" : None, #set
            "delaySlot" : False,
          }
        ),

        (
          r"restore @AR1 , @AR2 , @AR3",
          {
            "name"      : "restore",
            "latency"   : Value.latencyC,
            "reg-read"  : {"AR1","AR2"}, #set
            "reg-mod"   : {"AR3"}, #set
            "res-used"  : None, #set
            "destLabel" : None, #set
            "delaySlot" : False,
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
            "destLabel" : {"EL1"}, #set
            "delaySlot" : True,
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
            "destLabel" : {"EL1"}, #set
            "delaySlot" : True,
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
            "destLabel" : {"EL1"}, #set
            "delaySlot" : True,
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
            "destLabel" : {"EL1"}, #set
            "delaySlot" : True,
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
            "destLabel" : {"EL1"}, #set
            "delaySlot" : True,
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
            "destLabel" : {"EL1"}, #set
            "delaySlot" : True,
          }
        ),
      ],
  },

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
            "destLabel" : {"EL1"}, #set
            "delaySlot" : True,
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
            "destLabel" : {"EL1"}, #set
            "delaySlot" : True,
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
            "destLabel" : {"EL1"}, #set
            "delaySlot" : True,
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
            "destLabel" : {"EL1"}, #set
            "delaySlot" : True,
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
            "destLabel" : {"EL1"}, #set
            "delaySlot" : True,
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
            "destLabel" : {"EL1"}, #set
            "delaySlot" : True,
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
            "destLabel" : {"EL1"}, #set
            "delaySlot" : True,
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
            "destLabel" : {"EL1"}, #set
            "delaySlot" : True,
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
            "destLabel" : {"EL1"}, #set
            "delaySlot" : True,
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
            "destLabel" : {"EL1"}, #set
            "delaySlot" : True,
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
            "destLabel" : {"EL1"}, #set
            "delaySlot" : True,
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
            "destLabel" : {"EL1"}, #set
            "delaySlot" : True,
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
            "destLabel" : {"EL1"}, #set
            "delaySlot" : True,
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
            "destLabel" : {"EL1"}, #set
            "delaySlot" : True,
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
            "destLabel" : {"EL1"}, #set
            "delaySlot" : True,
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
            "destLabel" : {"EL1"}, #set
            "delaySlot" : True,
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
            "destLabel" : {"EL1"}, #set
            "delaySlot" : True,
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
            "destLabel" : {"EL1"}, #set
            "delaySlot" : True,
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
            "destLabel" : {"EL1"}, #set
            "delaySlot" : True,
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
            "destLabel" : {"EL1"}, #set
            "delaySlot" : True,
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
            "destLabel" : {"EL1"}, #set
            "delaySlot" : True,
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
            "destLabel" : {"EL1"}, #set
            "delaySlot" : True,
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
            "destLabel" : {"EL1"}, #set
            "delaySlot" : True,
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
            "destLabel" : {"EL1"}, #set
            "delaySlot" : True,
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
            "destLabel" : {"EL1"}, #set
            "delaySlot" : True,
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
            "destLabel" : {"EL1"}, #set
            "delaySlot" : True,
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
            "destLabel" : {"EL1"}, #set
            "delaySlot" : True,
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
            "destLabel" : {"EL1"}, #set
            "delaySlot" : True,
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
            "destLabel" : {"EL1"}, #set
            "delaySlot" : True,
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
            "destLabel" : {"EL1"}, #set
            "delaySlot" : True,
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
            "destLabel" : {"EL1"}, #set
            "delaySlot" : True,
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
            "destLabel" : {"EL1"}, #set
            "delaySlot" : True,
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
            "destLabel" : {"EL1"}, #set
            "delaySlot" : True,
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
            "destLabel" : {"EL1"}, #set
            "delaySlot" : True,
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
            "destLabel" : {"EL1"}, #set
            "delaySlot" : True,
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
            "destLabel" : {"EL1"}, #set
            "delaySlot" : True,
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
            "destLabel" : {"EL1"}, #set
            "delaySlot" : True,
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
            "destLabel" : {"EL1"}, #set
            "delaySlot" : True,
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
            "destLabel" : {"EL1"}, #set
            "delaySlot" : True,
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
            "destLabel" : {"EL1"}, #set
            "delaySlot" : True,
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
            "destLabel" : {"EL1"}, #set
            "delaySlot" : True,
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
            "destLabel" : {"EL1"}, #set
            "delaySlot" : True,
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
            "destLabel" : {"EL1"}, #set
            "delaySlot" : True,
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
            "destLabel" : {"EL1"}, #set
            "delaySlot" : True,
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
            "destLabel" : {"EL1"}, #set
            "delaySlot" : True,
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
            "destLabel" : {"EL1"}, #set
            "delaySlot" : True,
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
            "destLabel" : {"EL1"}, #set
            "delaySlot" : True,
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
            "destLabel" : {"EL1"}, #set
            "delaySlot" : True,
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
            "destLabel" : {"EL1"}, #set
            "delaySlot" : True,
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
            "destLabel" : {"EL1"}, #set
            "delaySlot" : True,
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
            "destLabel" : {"EL1"}, #set
            "delaySlot" : True,
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
            "destLabel" : {"EL1"}, #set
            "delaySlot" : True,
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
            "destLabel" : {"EL1"}, #set
            "delaySlot" : True,
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
            "destLabel" : {"EL1"}, #set
            "delaySlot" : True,
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
            "destLabel" : {"EL1"}, #set
            "delaySlot" : True,
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
            "destLabel" : {"EL1"}, #set
            "delaySlot" : True,
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
            "destLabel" : {"EL1"}, #set
            "delaySlot" : True,
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
            "destLabel" : {"EL1"}, #set
            "delaySlot" : True,
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
            "destLabel" : {"EL1"}, #set
            "delaySlot" : True,
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
            "destLabel" : {"EL1"}, #set
            "delaySlot" : True,
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
            "destLabel" : {"EL1"}, #set
            "delaySlot" : True,
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
            "destLabel" : {"EL1"}, #set
            "delaySlot" : True,
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
            "destLabel" : {"EL1"}, #set
            "delaySlot" : True,
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
            "destLabel" : {"EL1"}, #set
            "delaySlot" : True,
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
            "destLabel" : {"EL1"}, #set
            "delaySlot" : True,
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
            "destLabel" : {"EL1"}, #set
            "delaySlot" : True,
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
            "destLabel" : {"EL1"}, #set
            "delaySlot" : True,
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
            "destLabel" : {"EL1"}, #set
            "delaySlot" : True,
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
            "destLabel" : {"EL1"}, #set
            "delaySlot" : True,
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
            "destLabel" : {"EL1"}, #set
            "delaySlot" : True,
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
            "destLabel" : {"EL1"}, #set
            "delaySlot" : False,
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
            "destLabel" : {"EL1"}, #set
            "delaySlot" : False,
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
            "destLabel" : {"EL1"}, #set
            "delaySlot" : False,
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
            "destLabel" : {"EL1"}, #set
            "delaySlot" : False,
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
            "destLabel" : {"EL1"}, #set
            "delaySlot" : False,
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
            "destLabel" : {"EL1"}, #set
            "delaySlot" : False,
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
            "destLabel" : {"EL1"}, #set
            "delaySlot" : False,
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
            "destLabel" : {"EL1"}, #set
            "delaySlot" : False,
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
            "destLabel" : {"EL1"}, #set
            "delaySlot" : False,
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
            "destLabel" : {"EL1"}, #set
            "delaySlot" : False,
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
            "destLabel" : {"EL1"}, #set
            "delaySlot" : False,
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
            "destLabel" : {"EL1"}, #set
            "delaySlot" : False,
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
            "destLabel" : {"EL1"}, #set
            "delaySlot" : False,
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
            "destLabel" : {"EL1"}, #set
            "delaySlot" : False,
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
            "destLabel" : {"EL1"}, #set
            "delaySlot" : False,
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
            "destLabel" : {"EL1"}, #set
            "delaySlot" : False,
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
            "destLabel" : {"EL1"}, #set
            "delaySlot" : False,
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
            "destLabel" : {"EL1"}, #set
            "delaySlot" : False,
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
            "destLabel" : {"EL1"}, #set
            "delaySlot" : False,
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
            "destLabel" : {"EL1"}, #set
            "delaySlot" : False,
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
            "destLabel" : {"EL1"}, #set
            "delaySlot" : False,
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
            "destLabel" : {"EL1"}, #set
            "delaySlot" : False,
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
            "destLabel" : {"EL1"}, #set
            "delaySlot" : False,
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
            "destLabel" : {"EL1"}, #set
            "delaySlot" : False,
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
            "destLabel" : {"EL1"}, #set
            "delaySlot" : False,
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
            "destLabel" : {"EL1"}, #set
            "delaySlot" : False,
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
            "destLabel" : {"EL1"}, #set
            "delaySlot" : False,
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
            "destLabel" : {"EL1"}, #set
            "delaySlot" : False,
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
            "destLabel" : {"EL1"}, #set
            "delaySlot" : False,
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
            "destLabel" : {"EL1"}, #set
            "delaySlot" : False,
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
            "destLabel" : {"EL1"}, #set
            "delaySlot" : False,
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
            "destLabel" : {"EL1"}, #set
            "delaySlot" : False,
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
          r"call @EL1",
          {
            "name"      : "call",
            "latency"   : Value.latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : {"r15"}, #set
            "res-used"  : None, #set
            "destLabel" : {"EL1"}, #set
            "delaySlot" : False,
          }
        ),

        (
          r"call @AA1",         # jmpl address, %o7
          {
            "name"      : "call",
            "latency"   : Value.latencyA,
            "reg-read"  : {"AA1"}, #set
            "reg-mod"   : {"o7"}, #set
            "res-used"  : None, #set
            "destLabel" : {"EL1"}, #set
            "delaySlot" : False,
          }
        ),

        (
          r"call @EL1 , @AR1",       # TODO:unknown instr: "call vectorGen, 0"
          {
            "name"      : "call",
            "latency"   : Value.latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : {"r15"}, #set
            "res-used"  : None, #set
            "destLabel" : {"EL1"}, #set
            "delaySlot" : False,
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
          r"jmpl @AA1 , @AR1",
          {
            "name"      : "jmpl",
            "latency"   : Value.latencyA,
            "reg-read"  : {"AA1"}, #set
            "reg-mod"   : {"AR1"}, #set
            "res-used"  : None, #set
            "destLabel" : None, #set
            "delaySlot" : False,
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
          r"rett @AA1",
          {
            "name"      : "rett",
            "latency"   : Value.latencyA,
            "reg-read"  : {"AA1"}, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
            "destLabel" : None, #set
            "delaySlot" : False,
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
          r"ta @AA1",
          {
            "name"      : "ta",
            "latency"   : Value.latencyA,
            "reg-read"  : {"AA1"}, #set
            "reg-mod"   : {"r17", "r18"}, #set
            "res-used"  : None, #set
            "destLabel" : None, #set
            "delaySlot" : False,
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
          r"tn @AA1",
          {
            "name"      : "tn",
            "latency"   : Value.latencyA,
            "reg-read"  : {"AA1"}, #set
            "reg-mod"   : {"r17", "r18"}, #set
            "res-used"  : None, #set
            "destLabel" : None, #set
            "delaySlot" : False,
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
          r"tne @AA1",
          {
            "name"      : "tne",
            "latency"   : Value.latencyA,
            "reg-read"  : {"AA1"}, #set
            "reg-mod"   : {"r17", "r18"}, #set
            "res-used"  : None, #set
            "destLabel" : None, #set
            "delaySlot" : False,
          }
        ),
      ],
  },

  "tnz"         : # Trap on Not Equal, synonym of tne
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"tnz @AA1",
          {
            "name"      : "tne",
            "latency"   : Value.latencyA,
            "reg-read"  : {"AA1"}, #set
            "reg-mod"   : {"r17", "r18"}, #set
            "res-used"  : None, #set
            "destLabel" : None, #set
            "delaySlot" : False,
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
          r"te @AA1",
          {
            "name"      : "te",
            "latency"   : Value.latencyA,
            "reg-read"  : {"AA1"}, #set
            "reg-mod"   : {"r17", "r18"}, #set
            "res-used"  : None, #set
            "destLabel" : None, #set
            "delaySlot" : False,
          }
        ),
      ],
  },

  "tz"          : # Trap on Equal
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"tz @AA1",
          {
            "name"      : "te",
            "latency"   : Value.latencyA,
            "reg-read"  : {"AA1"}, #set
            "reg-mod"   : {"r17", "r18"}, #set
            "res-used"  : None, #set
            "destLabel" : None, #set
            "delaySlot" : False,
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
          r"tg @AA1",
          {
            "name"      : "tg",
            "latency"   : Value.latencyA,
            "reg-read"  : {"AA1"}, #set
            "reg-mod"   : {"r17", "r18"}, #set
            "res-used"  : None, #set
            "destLabel" : None, #set
            "delaySlot" : False,
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
          r"tle @AA1",
          {
            "name"      : "tle",
            "latency"   : Value.latencyA,
            "reg-read"  : {"AA1"}, #set
            "reg-mod"   : {"r17", "r18"}, #set
            "res-used"  : None, #set
            "destLabel" : None, #set
            "delaySlot" : False,
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
          r"tge @AA1",
          {
            "name"      : "tge",
            "latency"   : Value.latencyA,
            "reg-read"  : {"AA1"}, #set
            "reg-mod"   : {"r17", "r18"}, #set
            "res-used"  : None, #set
            "destLabel" : None, #set
            "delaySlot" : False,
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
          r"tl @AA1",
          {
            "name"      : "tl",
            "latency"   : Value.latencyA,
            "reg-read"  : {"AA1"}, #set
            "reg-mod"   : {"r17", "r18"}, #set
            "res-used"  : None, #set
            "destLabel" : None, #set
            "delaySlot" : False,
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
          r"tgu @AA1",
          {
            "name"      : "tgu",
            "latency"   : Value.latencyA,
            "reg-read"  : {"AA1"}, #set
            "reg-mod"   : {"r17", "r18"}, #set
            "res-used"  : None, #set
            "destLabel" : None, #set
            "delaySlot" : False,
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
          r"tleu @AA1",
          {
            "name"      : "tleu",
            "latency"   : Value.latencyA,
            "reg-read"  : {"AA1"}, #set
            "reg-mod"   : {"r17", "r18"}, #set
            "res-used"  : None, #set
            "destLabel" : None, #set
            "delaySlot" : False,
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
          r"tcc @AA1",
          {
            "name"      : "tcc",
            "latency"   : Value.latencyA,
            "reg-read"  : {"AA1"}, #set
            "reg-mod"   : {"r17", "r18"}, #set
            "res-used"  : None, #set
            "destLabel" : None, #set
            "delaySlot" : False,
          }
        ),
      ],
  },

  "tgeu"         : # Trap on Carry Clear (Greater than or Equal, Unsigned), synonym of tcc
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"tgeu @AA1",
          {
            "name"      : "tcc",
            "latency"   : Value.latencyA,
            "reg-read"  : {"AA1"}, #set
            "reg-mod"   : {"r17", "r18"}, #set
            "res-used"  : None, #set
            "destLabel" : None, #set
            "delaySlot" : False,
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
          r"tcs @AA1",
          {
            "name"      : "tcs",
            "latency"   : Value.latencyA,
            "reg-read"  : {"AA1"}, #set
            "reg-mod"   : {"r17", "r18"}, #set
            "res-used"  : None, #set
            "destLabel" : None, #set
            "delaySlot" : False,
          }
        ),
      ],
  },

  "tlu"         : # Trap on Carry Set (Less Than, Unsigned), synonym of tcs
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"tlu @AA1",
          {
            "name"      : "tcs",
            "latency"   : Value.latencyA,
            "reg-read"  : {"AA1"}, #set
            "reg-mod"   : {"r17", "r18"}, #set
            "res-used"  : None, #set
            "destLabel" : None, #set
            "delaySlot" : False,
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
          r"tpos @AA1",
          {
            "name"      : "tpos",
            "latency"   : Value.latencyA,
            "reg-read"  : {"AA1"}, #set
            "reg-mod"   : {"r17", "r18"}, #set
            "res-used"  : None, #set
            "destLabel" : None, #set
            "delaySlot" : False,
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
          r"tneg @AA1",
          {
            "name"      : "tneg",
            "latency"   : Value.latencyA,
            "reg-read"  : {"AA1"}, #set
            "reg-mod"   : {"r17", "r18"}, #set
            "res-used"  : None, #set
            "destLabel" : None, #set
            "delaySlot" : False,
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
          r"tvc @AA1",
          {
            "name"      : "tvc",
            "latency"   : Value.latencyA,
            "reg-read"  : {"AA1"}, #set
            "reg-mod"   : {"r17", "r18"}, #set
            "res-used"  : None, #set
            "destLabel" : None, #set
            "delaySlot" : False,
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
          r"tvs @AA1",
          {
            "name"      : "tvs",
            "latency"   : Value.latencyA,
            "reg-read"  : {"AA1"}, #set
            "reg-mod"   : {"r17", "r18"}, #set
            "res-used"  : None, #set
            "destLabel" : None, #set
            "delaySlot" : False,
          }
        ),
      ],
  },


  "rd"       : # Read
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"rd @EM1 , @AR1",
          {
            "name"      : "rd",
            "latency"   : Value.latencyA,
            "reg-read"  : {"EM1"}, #set
            "reg-mod"   : {"AR1"}, #set
            "res-used"  : None, #set
            "destLabel" : None, #set
            "delaySlot" : False,
          }
        ),
      ],
  },


  "wr"       : # Write
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"wr @AR1 , @AR2 , @EM1",
          {
            "name"      : "wr",
            "latency"   : Value.latencyA,
            "reg-read"  : {"AR1","AR2"}, #set
            "reg-mod"   : {"EM1"}, #set
            "res-used"  : None, #set
            "destLabel" : None, #set
            "delaySlot" : False,
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
          r"stbar",
          {
            "name"      : "stbar",
            "latency"   : Value.latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
            "destLabel" : None, #set
            "delaySlot" : False,
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
          r"unimp [^,]*",
          {
            "name"      : "unimp",
            "latency"   : Value.latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
            "destLabel" : None, #set
            "delaySlot" : False,
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
          r"flush @AA1",
          {
            "name"      : "flush",
            "latency"   : Value.latencyA,
            "reg-read"  : {"AA1"}, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
            "destLabel" : None, #set
            "delaySlot" : False,
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
          r"fitos @AR1 , @AR2",
          {
            "name"      : "fitos",
            "latency"   : Value.latencyC,
            "reg-read"  : {"AR1"}, #set
            "reg-mod"   : {"AR2"}, #set
            "res-used"  : None, #set
            "destLabel" : None, #set
            "delaySlot" : False,
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
          r"fitod @AR1 , @ED1",
          {
            "name"      : "fitod",
            "latency"   : Value.latencyC,
            "reg-read"  : {"AR1"}, #set
            "reg-mod"   : {"ED1"}, #set TODO: confirm it
            "res-used"  : None, #set
            "destLabel" : None, #set
            "delaySlot" : False,
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
          r"fitoq @AR1 , @EQ1",
          {
            "name"      : "fitoq",
            "latency"   : Value.latencyC,
            "reg-read"  : {"AR1"}, #set
            "reg-mod"   : {"EQ1"}, #set TODO
            "res-used"  : None, #set
            "destLabel" : None, #set
            "delaySlot" : False,
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
          r"fstoi @AR1 , @AR2",
          {
            "name"      : "fstoi",
            "latency"   : Value.latencyC,
            "reg-read"  : {"AR1"}, #set
            "reg-mod"   : {"AR2"}, #set
            "res-used"  : None, #set
            "destLabel" : None, #set
            "delaySlot" : False,
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
          r"fdtoi @ED1 , @AR2",
          {
            "name"      : "fdtoi",
            "latency"   : Value.latencyC,
            "reg-read"  : {"ED1"}, #set TODO
            "reg-mod"   : {"AR2"}, #set TODO
            "res-used"  : None, #set
            "destLabel" : None, #set
            "delaySlot" : False,
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
          r"fqtoi @EQ1 , @AR2",
          {
            "name"      : "fqtoi",
            "latency"   : Value.latencyC,
            "reg-read"  : {"EQ1"}, #set
            "reg-mod"   : {"AR2"}, #set TODO
            "res-used"  : None, #set
            "destLabel" : None, #set
            "delaySlot" : False,
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
          r"fstod @AR1 , @ED1",
          {
            "name"      : "fstod",
            "latency"   : Value.latencyC,
            "reg-read"  : {"AR1"}, #set
            "reg-mod"   : {"ED1"}, #set
            "res-used"  : None, #set
            "destLabel" : None, #set
            "delaySlot" : False,
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
          r"fstoq @AR1 , @EQ1",
          {
            "name"      : "fstoq",
            "latency"   : Value.latencyC,
            "reg-read"  : {"AR1"}, #set
            "reg-mod"   : {"EQ1"}, #set
            "res-used"  : None, #set
            "destLabel" : None, #set
            "delaySlot" : False,
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
          r"fdtos @ED1 , @AR1",
          {
            "name"      : "fdtos",
            "latency"   : Value.latencyC,
            "reg-read"  : {"ED1"}, #set
            "reg-mod"   : {"AR1"}, #set
            "res-used"  : None, #set
            "destLabel" : None, #set
            "delaySlot" : False,
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
          r"fdtoq @ED1 , @EQ1",
          {
            "name"      : "fdtoq",
            "latency"   : Value.latencyC,
            "reg-read"  : {"ED1"}, #set
            "reg-mod"   : {"EQ1"}, #set
            "res-used"  : None, #set
            "destLabel" : None, #set
            "delaySlot" : False,
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
          r"fqtos @EQ1 , @AR1",
          {
            "name"      : "fqtos",
            "latency"   : Value.latencyC,
            "reg-read"  : {"EQ1"}, #set
            "reg-mod"   : {"AR1"}, #set
            "res-used"  : None, #set
            "destLabel" : None, #set
            "delaySlot" : False,
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
          r"fqtod @EQ1 , @ED1",
          {
            "name"      : "fqtod",
            "latency"   : Value.latencyC,
            "reg-read"  : {"EQ1"}, #set
            "reg-mod"   : {"ED1"}, #set
            "res-used"  : None, #set
            "destLabel" : None, #set
            "delaySlot" : False,
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
          r"fmovs @AR1 , @AR2",
          {
            "name"      : "fmovs",
            "latency"   : Value.latencyB,
            "reg-read"  : {"AR1"}, #set
            "reg-mod"   : {"AR2"}, #set
            "res-used"  : None, #set
            "destLabel" : None, #set
            "delaySlot" : False,
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
          r"fnegs @AR1 , @AR2",
          {
            "name"      : "fnegs",
            "latency"   : Value.latencyC,
            "reg-read"  : {"AR1"}, #set
            "reg-mod"   : {"AR2"}, #set
            "res-used"  : None, #set
            "destLabel" : None, #set
            "delaySlot" : False,
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
          r"fabss @AR1 , @AR2",
          {
            "name"      : "fabss",
            "latency"   : Value.latencyC,
            "reg-read"  : {"AR1"}, #set
            "reg-mod"   : {"AR2"}, #set
            "res-used"  : None, #set
            "destLabel" : None, #set
            "delaySlot" : False,
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
          r"fsqrts @AR1 , @AR2",
          {
            "name"      : "fsqrts",
            "latency"   : Value.latencyD,
            "reg-read"  : {"AR1"}, #set
            "reg-mod"   : {"AR2"}, #set
            "res-used"  : None, #set
            "destLabel" : None, #set
            "delaySlot" : False,
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
          r"fsqrts @ED1 , @ED2",
          {
            "name"      : "fsqrtd",
            "latency"   : Value.latencyD,
            "reg-read"  : {"ED1"}, #set
            "reg-mod"   : {"ED2"}, #set
            "res-used"  : None, #set
            "destLabel" : None, #set
            "delaySlot" : False,
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
          r"fsqrts @EQ1 , @EQ2",
          {
            "name"      : "fsqrtq",
            "latency"   : Value.latencyD,
            "reg-read"  : {"EQ1"}, #set
            "reg-mod"   : {"EQ2"}, #set
            "res-used"  : None, #set
            "destLabel" : None, #set
            "delaySlot" : False,
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
          r"fadds @AR1 , @AR2 , @AR3",
          {
            "name"      : "fadds",
            "latency"   : Value.latencyC,
            "reg-read"  : {"AR1","AR2"}, #set
            "reg-mod"   : {"AR3"}, #set
            "res-used"  : None, #set
            "destLabel" : None, #set
            "delaySlot" : False,
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
          r"fadds @ED1 , @ED2 , @ED3",
          {
            "name"      : "faddd",
            "latency"   : Value.latencyC,
            "reg-read"  : {"ED1","ED2"}, #set
            "reg-mod"   : {"ED3"}, #set
            "res-used"  : None, #set
            "destLabel" : None, #set
            "delaySlot" : False,
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
          r"fadds @EQ1 , @EQ2 , @EQ3",
          {
            "name"      : "faddq",
            "latency"   : Value.latencyC,
            "reg-read"  : {"EQ1","EQ2"}, #set
            "reg-mod"   : {"EQ3"}, #set
            "res-used"  : None, #set
            "destLabel" : None, #set
            "delaySlot" : False,
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
          r"fsubs @AR1 , @AR2 , @AR3",
          {
            "name"      : "fsubs",
            "latency"   : Value.latencyC,
            "reg-read"  : {"AR1","AR2"}, #set
            "reg-mod"   : {"AR3"}, #set
            "res-used"  : None, #set
            "destLabel" : None, #set
            "delaySlot" : False,
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
          r"fsubd @ED1 , @ED2 , @ED3",
          {
            "name"      : "fsubd",
            "latency"   : Value.latencyC,
            "reg-read"  : {"ED1","ED2"}, #set
            "reg-mod"   : {"ED3"}, #set
            "res-used"  : None, #set
            "destLabel" : None, #set
            "delaySlot" : False,
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
          r"fsubq @EQ1 , @EQ2 , @EQ3",
          {
            "name"      : "fsubq",
            "latency"   : Value.latencyC,
            "reg-read"  : {"EQ1","EQ2"}, #set
            "reg-mod"   : {"EQ3"}, #set
            "res-used"  : None, #set
            "destLabel" : None, #set
            "delaySlot" : False,
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
          r"fmuls @AR1 , @AR2 , @AR3",
          {
            "name"      : "fmuls",
            "latency"   : Value.latencyC,
            "reg-read"  : {"AR1","AR2"}, #set
            "reg-mod"   : {"AR3"}, #set
            "res-used"  : None, #set
            "destLabel" : None, #set
            "delaySlot" : False,
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
          r"fdivd @ED1 , @ED2 , @ED3",
          {
            "name"      : "fmuld",
            "latency"   : Value.latencyC,
            "reg-read"  : {"ED1","ED2"}, #set
            "reg-mod"   : {"ED3"}, #set
            "res-used"  : None, #set
            "destLabel" : None, #set
            "delaySlot" : False,
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
          r"fmulq @EQ1 , @EQ2 , @EQ3",
          {
            "name"      : "fmulq",
            "latency"   : Value.latencyC,
            "reg-read"  : {"EQ1","EQ2"}, #set
            "reg-mod"   : {"EQ3"}, #set
            "res-used"  : None, #set
            "destLabel" : None, #set
            "delaySlot" : False,
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
          r"fsmuld @AR1 , @AR2 , @ED1",
          {
            "name"      : "fsmuld",
            "latency"   : Value.latencyC,
            "reg-read"  : {"AR1","AR2"}, #set
            "reg-mod"   : {"ED1"}, #set
            "res-used"  : None, #set
            "destLabel" : None, #set
            "delaySlot" : False,
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
          r"fdmulq @ED1 , @ED2 , @EQ1",
          {
            "name"      : "fdmulq",
            "latency"   : Value.latencyC,
            "reg-read"  : {"ED1","ED2"}, #set
            "reg-mod"   : {"EQ1"}, #set
            "res-used"  : None, #set
            "destLabel" : None, #set
            "delaySlot" : False,
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
          r"fdivs @AR1 , @AR2 , @AR3",
          {
            "name"      : "fdivs",
            "latency"   : Value.latencyD,
            "reg-read"  : {"AR1","AR2"}, #set
            "reg-mod"   : {"AR3"}, #set
            "res-used"  : None, #set
            "destLabel" : None, #set
            "delaySlot" : False,
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
          r"fdivd @ED1 , @ED2 , @ED3",
          {
            "name"      : "fdivd",
            "latency"   : Value.latencyE,
            "reg-read"  : {"ED1","ED2"}, #set
            "reg-mod"   : {"ED3"}, #set
            "res-used"  : None, #set
            "destLabel" : None, #set
            "delaySlot" : False,
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
          r"fdivq @EQ1 , @EQ2 , @EQ3",
          {
            "name"      : "fdivq",
            "latency"   : Value.latencyE,
            "reg-read"  : {"EQ1","EQ2"}, #set
            "reg-mod"   : {"EQ3"}, #set
            "res-used"  : None, #set
            "destLabel" : None, #set
            "delaySlot" : False,
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
          r"fcmps @AR1 , @AR2",
          {
            "name"      : "fcmps",
            "latency"   : Value.latencyC,
            "reg-read"  : {"AR1","AR2"}, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
            "destLabel" : None, #set
            "delaySlot" : False,
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
          r"fcmpd @ED1 , @ED2",
          {
            "name"      : "fcmpd",
            "latency"   : Value.latencyC,
            "reg-read"  : {"ED1","ED2"}, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
            "destLabel" : None, #set
            "delaySlot" : False,
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
          r"fcmpq @EQ1 , @EQ2",
          {
            "name"      : "fcmpq",
            "latency"   : Value.latencyC,
            "reg-read"  : {"EQ1","EQ2"}, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
            "destLabel" : None, #set
            "delaySlot" : False,
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
          r"fcmpes @AR1 , @AR2",
          {
            "name"      : "fcmpes",
            "latency"   : Value.latencyC,
            "reg-read"  : {"AR1","AR2"}, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
            "destLabel" : None, #set
            "delaySlot" : False,
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
          r"fcmped @ED1 , @ED2",
          {
            "name"      : "fcmped",
            "latency"   : Value.latencyC,
            "reg-read"  : {"ED1","ED2"}, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
            "destLabel" : None, #set
            "delaySlot" : False,
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
          r"fcmpeq @EQ1 , @EQ2",
          {
            "name"      : "fcmpeq",
            "latency"   : Value.latencyC,
            "reg-read"  : {"EQ1","EQ2"}, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
            "destLabel" : None, #set
            "delaySlot" : False,
          }
        ),
      ],
  },


  # CPop        : Coprocessor Operate Instructions
  # Interpretation depends on the coprocessor,
  # therefore specification given here is INCOMPLETE.
  "cpop1"       : # Coprocessor Operate
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"cpop1 [^,]* , @AR1 , @AR2 , @AR3",
          {
            "name"      : "cpop1",
            "latency"   : Value.latencyA,
            "reg-read"  : {"AR1","AR2"}, #set
            "reg-mod"   : {"AR3"}, #set
            "res-used"  : None, #set
            "destLabel" : None, #set
            "delaySlot" : False,
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
          r"cpop2 [^,]* , @AR1 , @AR2 , @AR3",
          {
            "name"      : "cpop2",
            "latency"   : Value.latencyA,
            "reg-read"  : {"AR1","AR2"}, #set
            "reg-mod"   : {"AR3"}, #set
            "res-used"  : None, #set
            "destLabel" : None, #set
            "delaySlot" : False,
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
            "destLabel" : None, #set
            "delaySlot" : False,
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
            "destLabel" : None, #set
            "delaySlot" : False,
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
            "destLabel" : None, #set
            "delaySlot" : False,
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
            "destLabel" : None, #set
            "delaySlot" : False,
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
            "destLabel" : None, #set
            "delaySlot" : False,
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
            "destLabel" : None, #set
            "delaySlot" : False,
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
            "destLabel" : None, #set
            "delaySlot" : False,
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
            "destLabel" : None, #set
            "delaySlot" : False,
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
            "destLabel" : None, #set
            "delaySlot" : False,
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
            "destLabel" : None, #set
            "delaySlot" : False,
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
            "destLabel" : None, #set
            "delaySlot" : False,
          }
        ),
      ],
  },

  "cmp"         : # compare
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"cmp @AR1 , @AR2",
          {
            "name"      : "cmp",
            "latency"   : Value.latencyA,
            "reg-read"  : {"AR1","AR2"}, #set
            "reg-mod"   : {"icc"}, #set
            "res-used"  : None, #set
            "destLabel" : None, #set
            "delaySlot" : False,
          }
        ),
      ],
  },

  "jmp"         : # compare
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"jmp @AA1",
          {
            "name"      : "jmp",
            "latency"   : Value.latencyA,
            "reg-read"  : {"AA1"}, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
            "destLabel" : None, #set
            "delaySlot" : False,
          }
        ),
      ],
  },

  "tst"         : # test
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"tst @AR1",
          {
            "name"      : "tst",
            "latency"   : Value.latencyA,
            "reg-read"  : {"AR1"}, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
            "destLabel" : None, #set
            "delaySlot" : False,
          }
        ),
      ],
  },

  "clr"         : # clear(zero) register / word
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"clr @AR1",          # or %g0 , %g0 , @AR1
          {
            "name"      : "clr",
            "latency"   : Value.latencyA,
            "reg-read"  : None, #set
            "reg-mod"   : {"AR1"}, #set
            "res-used"  : None, #set
            "destLabel" : None, #set
            "delaySlot" : False,
          }
        ),

        (
          r"clr \[ @AA1 \]",          # st %g0 , [ @AA1 ]
          {
            "name"      : "clr",
            "latency"   : Value.latencyA,
            "reg-read"  : {"AA1"}, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
            "destLabel" : None, #set
            "delaySlot" : False,
          }
        ),
      ],
  },

  "clrb"         : # clear byte
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"clrb \[ @AA1 \]",          # stb %g0 , [ @AA1 ]
          {
            "name"      : "clrb",
            "latency"   : Value.latencyA,
            "reg-read"  : {"AA1"}, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
            "destLabel" : None, #set
            "delaySlot" : False,
          }
        ),
      ],
  },

  "clrh"         : # clear halfword
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"clrh \[ @AA1 \]",          # sth %g0 , [ @AA1 ]
          {
            "name"      : "clrh",
            "latency"   : Value.latencyA,
            "reg-read"  : {"AA1"}, #set
            "reg-mod"   : None, #set
            "res-used"  : None, #set
            "destLabel" : None, #set
            "delaySlot" : False,
          }
        ),
      ],
  },

  "btst"         : # bit test
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"btst @AR1 , @AR2",          # andcc @AR1 , @AR2 , %g0
          {
            "name"      : "btst",
            "latency"   : Value.latencyA,
            "reg-read"  : {"AR1","AR2"}, #set
            "reg-mod"   : {"icc"}, #set
            "res-used"  : None, #set
            "destLabel" : None, #set
            "delaySlot" : False,
          }
        ),
      ],
  },

  "bset"         : # bit set
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"bset @AR1 , @AR2",          # or @AR1 , @AR2 , @AR1
          {
            "name"      : "bset",
            "latency"   : Value.latencyA,
            "reg-read"  : {"AR1","AR2"}, #set
            "reg-mod"   : {"AR2"}, #set
            "res-used"  : None, #set
            "destLabel" : None, #set
            "delaySlot" : False,
          }
        ),
      ],
  },

  "bclr"         : # bit clear
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"bclr @AR1 , @AR2",          # andn @AR1 , @AR2 , @AR1
          {
            "name"      : "bclr",
            "latency"   : Value.latencyA,
            "reg-read"  : {"AR1","AR2"}, #set
            "reg-mod"   : {"AR2"}, #set
            "res-used"  : None, #set
            "destLabel" : None, #set
            "delaySlot" : False,
          }
        ),
      ],
  },

  "btog"         : # bit toggle
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"btog @AR1 , @AR2",          # xor @AR1 , @AR2 , @AR1
          {
            "name"      : "btog",
            "latency"   : Value.latencyA,
            "reg-read"  : {"AR1","AR2"}, #set
            "reg-mod"   : {"AR2"}, #set
            "res-used"  : None, #set
            "destLabel" : None, #set
            "delaySlot" : False,
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
  # Extract the Register (should be even).
  # Add the following odd register too.
  # e.g. if r6 is found add r7 too.
  "ED"   : r"%\w+\d+",

  # Q: Quad word register expression (e.g. for quad floating point)
  # Extract the Register (should be divisible by 4).
  # Add the following three registers too.
  # e.g. if f4 is found add f5 f6 f7 too.
  "EQ"   : r"%\w+\d+",

  # A: Address expression
  # Extract All Registers
  # If a single or no register is found, add %r0 as a register being read
  "AA"   : r"%\w+",

  # Set of registers specially related to the mov,rd,wr instructions
  "EM"   : r"%y|%asr\d+|%psr|%wim|%tbr(?i)",

  # I: Immediate value expression
  # Extract Immediate Value
  "EI"   : r"[-+]?[ \t]*\d+|[-+]?[ \t]*0[xX][0-9a-fA-F]+",

  # L: Label
  # Extract Label Name
  "EL"   : r"[.$_a-zA-Z][.$_a-zA-Z0-9]*",
}

labeledBranch = {
  # Misc instructions
  "call"
  # Branch on icc
  "ba", "bn", "bne", "bnz", "be", "bz", "bg",
  "ble", "bge", "bl", "bgu", "bleu", "bcc", "bgeu",
  "bcs", "blu", "bpos", "bneg", "bvc", "bvs",
  # Branch on fcc
  "fba", "fbn", "fbu", "fbg", "fbug", "fbl",
  "fbul", "fblg", "fbne", "fbnz", "fbe", "fbz",
  "fbue", "fbge", "fbuge", "fble", "fbule", "fbo",
  # Branch on ccc
  "cba", "cbn", "cb3", "cb2", "cb23", "cb1",
  "cb13", "cb12", "cb123", "cb0", "cb03",
  "cb02", "cb023", "cb01", "cb013", "cb012",
}

nonLabeledBranch = {
  # Misc instructions
  "rett", "jmpl", "retl", "ret", "jmp",
  # Trap on icc
  "ta", "tn", "tne", "tnz", "te", "tz", "tg", "tle",
  "tge", "tl", "tgu", "tleu", "tcc", "tgeu",
  "tcs", "tlu", "tpos", "tneg", "tvc", "tvs",
}

branchInstr = labeledBranch | nonLabeledBranch

# Instructions that help identify a basic block
bbBoundary = branchInstr | {"save", "restore", "stbar", "unimp", "flush"}

# Branch instructions with no delay slots
noDelaySlot = {
  # Trap on icc
  "ta", "tn", "tne", "tnz", "te", "tz", "tg", "tle",
  "tge", "tl", "tgu", "tleu", "tcc", "tgeu",
  "tcs", "tlu", "tpos", "tneg", "tvc", "tvs",
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


