#!/usr/bin/env python3
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

# START : Assembly Syntax Related

# Predefined User Sections
sections1 = {".bss", ".comment", ".data", ".data1", ".debug", ".fini", ".init",
        ".rodata", ".rodata1", ".text", ".line", ".note"}
# Predefined Non-User Sections
# These are sections that are predefined but cannot be named
# in the section control directives because they are not under user control
sections2 = {".dynamic", ".dynstr", ".dynsym", ".got", ".hash", ".interp",
        ".plt", ".shstrtab", ".strtab", ".symtab"}

# Set of all sections possible
sections = set()

tmpSections = section1 + section2
for sectionName in tmpSections:
    sections.add(sectionName)
    sections.add(".rel" + sectionName)
    sections.add(".rela" + sectionName)

# END   : Assembly Syntax Related

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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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
            "reg-read"  : {}, #set
            "reg-mod"   : {}, #set
            "res-used"  : {}, #set
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


