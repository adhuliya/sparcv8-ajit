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

# Pefix '@' when using any key below in the instruction format specification.
regexMapping = {
  # Registers
  "R"   : r"(%\w+)",
  # Immediate
  "I"   : r"(\d+|0[xX][0-9a-fA-F]+)",
}

# START : Instructions with Details
instructions = {
  "ldsb"        : # Load Signed Byte
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "ldsb",
            "latency"   : latencyA,
            "read"      : {}, #set
            "modified"  : {}, #set
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
          r"format1",
          {
            "name"      : "ldsba",
            "latency"   : latencyA,
            "read"      : {}, #set
            "modified"  : {}, #set
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
          r"format1",
          {
            "name"      : "ldsh",
            "latency"   : latencyA,
            "read"      : {}, #set
            "modified"  : {}, #set
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
          r"format1",
          {
            "name"      : "ldsha",
            "latency"   : latencyA,
            "read"      : {}, #set
            "modified"  : {}, #set
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
          r"format1",
          {
            "name"      : "ldub",
            "latency"   : latencyA,
            "read"      : {}, #set
            "modified"  : {}, #set
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
          r"format1",
          {
            "name"      : "lduba",
            "latency"   : latencyA,
            "read"      : {}, #set
            "modified"  : {}, #set
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
          r"format1",
          {
            "name"      : "lduh",
            "latency"   : latencyA,
            "read"      : {}, #set
            "modified"  : {}, #set
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
          r"format1",
          {
            "name"      : "lduha",
            "latency"   : latencyA,
            "read"      : {}, #set
            "modified"  : {}, #set
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
          r"format1",
          {
            "name"      : "ld",
            "latency"   : latencyA,
            "read"      : {}, #set
            "modified"  : {}, #set
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
          r"format1",
          {
            "name"      : "lda",
            "latency"   : latencyA,
            "read"      : {}, #set
            "modified"  : {}, #set
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
          r"format1",
          {
            "name"      : "ldd",
            "latency"   : latencyA,
            "read"      : {}, #set
            "modified"  : {}, #set
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
          r"format1",
          {
            "name"      : "ldda",
            "latency"   : latencyA,
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
          r"format1",
          {
            "name"      : "st",
            "latency"   : latencyA,
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
          r"format1",
          {
            "name"      : "sethi",
            "latency"   : latencyA,
            "read"      : {}, #set
            "modified"  : {}, #set
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
          r"format1",
          {
            "name"      : "nop",
            "latency"   : latencyA,
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
          r"format1",
          {
            "name"      : "or",
            "latency"   : latencyA,
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
          r"format1",
          {
            "name"      : "add",
            "latency"   : latencyA,
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
          r"format1",
          {
            "name"      : "bne",
            "latency"   : latencyA,
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
          }
        ),
      ],
  },


  # TICC        : Trap on integr contition codes
  "ta"          : # Trap Always
  {
      "formats"     :
      [
        # List of Tuple Pairs (format, format-info)
        (
          r"format1",
          {
            "name"      : "ta",
            "latency"   : latencyA,
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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
            "read"      : {}, #set
            "modified"  : {}, #set
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


