#!/usr/bin/env python3
# Execution of this module prints useful information.

# This python module defines the Ajit specific Sparc V8 processor details.
# These include,
# 1. Per instruction latencies.
# 2. Pair wise instruction latencies.
# 3. Instruction Formats
# 4. Read and Written registers.


latencyA      = 2
# HitRatio: 90%, CacheHit: 2, Memory: 10, round(2.8) = 3
ldLatency     = 3
stLatency     = 3

# A dictionary that maps instruction to its latency.
instructions = {
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

  "STC"         : stLatency, # Store Coprocessor
  "STDC"        : stLatency, # Store Double Coprocessor
  "STCSR"       : stLatency, # Store Coprocessor State Register
  "STDCQ"       : stLatency, # Store Double Coprocessor Queue

  "LDSTUB"      : latencyA, # Atomic Load-Store Unsigned Byte
  "LDSTUBA"     : latencyA, # Atomic Load-Store Unsigned Byte in Alt Space
  "SWAP"        : latencyA, # Swap r Register with Memory
  "SWAPA"       : latencyA, # Swap r Register with Memory in Alt Space

  "SETHI"       : latencyA, # Set High 22 bits of r Register
  "NOP"         : 1, # No Operation

  "AND"         : latencyA, # And
  "ANDCC"       : latencyA, # And and modify icc
  "ANDN"        : latencyA, # And Not
  "ANDNCC"      : latencyA, # And Not and modify icc
  "OR"          : latencyA, # Inclusive-Or
  "ORCC"        : latencyA, # Inclusive-Or and modify icc
  "ORN"         : latencyA, # Inclusive-Or Not
  "ORNCC"       : latencyA, # Inclusive-Or Not and modify icc
  "XOR"         : latencyA, # Exclusive-Or
  "XORCC"       : latencyA, # Exclusive-Or and modify icc
  "XNOR"        : latencyA, # Exclusive-Nor
  "XNORCC"      : latencyA, # Exclusive-Nor and modify icc

  "SLL"         : latencyA, # Shift Left Logical
  "SRL"         : latencyA, # Shift Right Logical
  "SRA"         : latencyA, # Shift Right Arithmetic

  "ADD"         : latencyA, # Add
  "ADDCC"       : latencyA, # Add and modify icc
  "ADDX"        : latencyA, # Add with Carry
  "ADDXCC"      : latencyA, # Add with Carry and modify icc
  "TADDCC"      : latencyA, # Tagged Add and modify icc
  "TADDCCTV"    : latencyA, # Tagged Add and modify icc and Trap on overflow

  "SUB"         : latencyA, # Subtract
  "SUBCC"       : latencyA, # Subtract and modify icc
  "SUBX"        : latencyA, # Subtract with Carry
  "SUBXCC"      : latencyA, # Subtract with Carry and modify icc
  "TSUBCC"      : latencyA, # Tagged Subtract and modify icc
  "TSUBCCTV"    : latencyA, # Tagged Subtract and modify icc and Trap on overflow

  "MULSCC"      : latencyA, # Multiply Step and modify icc

  "UMUL"        : latencyA, # Unsigned Integer Multiply
  "UMULCC"      : latencyA, # Unsigned Integer Multiply and modify icc
  "SMUL"        : latencyA, # Signed Integer Multiply
  "SMULCC"      : latencyA, # Signed Integer Multiply and modify icc

  "UDIV"        : latencyA, # Unsigned Integer Divide
  "UDIVCC"      : latencyA, # Unsigned Integer Divide and modify icc
  "SDIV"        : latencyA, # Signed Integer Divide
  "SDIVCC"      : latencyA, # Signed Integer Divide and modify icc

  "SAVE"        : latencyA, # Save caller's window
  "RESTORE"     : latencyA, # Restore caller's window

  # BICC        : Branch on integer condition codes
  "BA"          : latencyA, # Branch Always
  "BN"          : latencyA, # Branch Never
  "BNE"         : latencyA, # Branch on Not Equal
  "BE"          : latencyA, # Branch on Equal
  "BG"          : latencyA, # Branch on Greater
  "BLE"         : latencyA, # Branch on Less or Equal
  "BGE"         : latencyA, # Branch on Greater or Equal
  "BL"          : latencyA, # Branch on Less
  "BGU"         : latencyA, # Branch on Greater Unsigned
  "BLEU"        : latencyA, # Branch on Less of Equal Unsigned
  "BCC"         : latencyA, # Branch on Carry Clear (Greater than or Equal, Unsigned)
  "BCS"         : latencyA, # Branch on Carry Set (Less than, Unsigned)
  "BPOS"        : latencyA, # Branch on Positive
  "BNEG"        : latencyA, # Branch on Negative
  "BVC"         : latencyA, # Branch on Overflow Clear
  "BVS"         : latencyA, # Branch on Overflow Set

  # FBFCC       : Branch on floating-point condition codes
  "FBA"         : latencyA, # Branch Always
  "FBN"         : latencyA, # Branch Never
  "FBU"         : latencyA, # Branch on Unordered
  "FBG"         : latencyA, # Branch on Greater
  "FBUG"        : latencyA, # Branch on Unordered or Greater
  "FBL"         : latencyA, # Branch on Less
  "FBUL"        : latencyA, # Branch on Unordered or Less
  "FBLG"        : latencyA, # Branch on Less or Greater
  "FBNE"        : latencyA, # Branch on Not Equal
  "FBE"         : latencyA, # Branch on Equal
  "FBUE"        : latencyA, # Branch on Unordered or Equal
  "FBGE"        : latencyA, # Branch on Greater of Equal
  "FBUGE"       : latencyA, # Branch on Unordered or Greater or Equal
  "FBLE"        : latencyA, # Branch on Less or Equal
  "FBULE"       : latencyA, # Branch on Unordered or Less or Equal
  "FBO"         : latencyA, # Branch on Ordered


  # CBCCC       : Branch on coprocessor condition codes
  "CBA"         : latencyA, # Always
  "CBN"         : latencyA, # Never
  "CB3"         : latencyA, # 3
  "CB2"         : latencyA, # 2
  "CB23"        : latencyA, # 2 or 3
  "CB1"         : latencyA, # 1
  "CB13"        : latencyA, # 1 or 3
  "CB12"        : latencyA, # 1 or 2
  "CB123"       : latencyA, # 1 or 2 or 3
  "CB0"         : latencyA, # 0
  "CB03"        : latencyA, # 0 or 3
  "CB02"        : latencyA, # 0 or 2
  "CB023"       : latencyA, # 0 or 2 or 3
  "CB01"        : latencyA, # 0 or 1
  "CB013"       : latencyA, # 0 or 1 or 3
  "CB012"       : latencyA, # 0 or 1 or 2

  "CALL"        : latencyA, # Call and Link
  "JMPL"        : latencyA, # Jump and Link
  "RETT"        : latencyA, # Return from Trap

  # TICC        : Trap on integr contition codes
  "TA"          : latencyA, # Trap Always
  "TN"          : latencyA, # Trap Never
  "TNE"         : latencyA, # Trap on Not Equal
  "TE"          : latencyA, # Trap on Equal
  "TG"          : latencyA, # Trap on Greater
  "TLE"         : latencyA, # Trap on Less or Equal
  "TGE"         : latencyA, # Trap on Greater or Equal
  "TL"          : latencyA, # Trap on Less
  "TGU"         : latencyA, # Trap on Greater Unsigned
  "TLEU"        : latencyA, # Trap on Less or Equal Unsigned
  "TCC"         : latencyA, # Trap on Carry Clear (Greater than or Equal, Unsigned)
  "TCS"         : latencyA, # Trap on Carry Set (Less Than, Unsigned)
  "TPOS"        : latencyA, # Trap on Positive
  "TNEG"        : latencyA, # Trap on Negative
  "TVC"         : latencyA, # Trap on Overflow Clear
  "TVS"         : latencyA, # Trap on Overflow Set

  "RDASR"       : latencyA, # Read Ancillary State Register
  "RDY"         : latencyA, # Read Y Register
  "RDPSR"       : latencyA, # Read Processor State Register
  "RDWIM"       : latencyA, # Read Window Invalid Mask Register
  "RDTBR"       : latencyA, # Read Trap Base Register

  "WDASR"       : latencyA, # Write Ancillary State Register
  "WDY"         : latencyA, # Write Y Register
  "WDPSR"       : latencyA, # Write Processor State Register
  "WDWIM"       : latencyA, # Write Window Invalid Mask Register
  "WDTBR"       : latencyA, # Write Trap Base Register

  "STBAR"       : latencyA, # Store Barrier

  "UNIMP"       : latencyA, # Unimplemented

  "FLUSH"       : latencyA, # Flush Instruction Memory

  # FPop : Floating-point Operate (FPop1, FPop2)
  "FITOS"       : latencyA, # Convert Integer to Single
  "FITOD"       : latencyA, # Convert Integer to Double
  "FITOQ"       : latencyA, # Convert Integer to Quad

  "FSTOI"       : latencyA, # Convert Single to Integer
  "FDTOI"       : latencyA, # Convert Double to Integer
  "FQTOI"       : latencyA, # Convert Quad to Integer

  "FSTOD"       : latencyA, # Convert Single to Double
  "FSTOQ"       : latencyA, # Convert Single to Quad
  "FDTOS"       : latencyA, # Convert Double to Single
  "FDTOQ"       : latencyA, # Convert Double to Quad
  "FQTOS"       : latencyA, # Convert Quad to Single
  "FQTOD"       : latencyA, # Convert Quad to Double

  "FMOVS"       : latencyA, # Move
  "FNEGS"       : latencyA, # Negate
  "FABSS"       : latencyA, # Absolute Value

  "FSQRTS"      : latencyA, # Square Root Single
  "FSQRTD"      : latencyA, # Square Root Double
  "FSQRTQ"      : latencyA, # Square Root Quad

  "FADDS"       : latencyA, # Add Single
  "FADDD"       : latencyA, # Add Double
  "FADDQ"       : latencyA, # Add Quad
  "FSUBS"       : latencyA, # Subtract Single
  "FSUBD"       : latencyA, # Subtract Double
  "FSUBQ"       : latencyA, # Subtract Quad

  "FMULS"       : latencyA, # Multiply Single
  "FMULD"       : latencyA, # Multiply Double
  "FMULQ"       : latencyA, # Multiply Quad
  "FSMULD"      : latencyA, # Multiply Single to Double
  "FDMULQ"      : latencyA, # Multiply Double to Quad
  "FDIVS"       : latencyA, # Divide Single
  "FDIVD"       : latencyA, # Divide Double
  "FDIVQ"       : latencyA, # Divide Quad

  "FCMPS"       : latencyA, # Compare Single
  "FCMPD"       : latencyA, # Compare Double
  "FCMPQ"       : latencyA, # Compare Quad
  "FCMPES"      : latencyA, # Compare Single and Exception if Unordered
  "FCMPED"      : latencyA, # Compare Double and Exception if Unordered
  "FCMPEQ"      : latencyA, # Compare Quad and Exception if Unordered

  # CPop        : Coprocessor Operate Instructions
  "CPOP1"       : latencyA, # Coprocessor Operate
  "CPOP2"       : latencyA, # Coprocessor Operate
}


if __name__ == "__main__":
    print("Total Instructions :", len(instructions))


