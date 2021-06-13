#!/usr/bin/env python3

"""
Information useful in defining an Ajit Processor (not its state).
"""


# START : System Registers

threadRegisters = {
  "r0", "r1", "r2", "r3", "r4", "r5", "r6", "r7",

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
  "fcc", "ccc",
}

windowRegisters = {
  "r8",  "r9",  "r10", "r11", "r12", "r13", "r14", "r15",
  "r16", "r17", "r18", "r19", "r20", "r21", "r22", "r23",
  "r24", "r25", "r26", "r27", "r28", "r29", "r30", "r31",
}

registers = windowRegisters | threadRegisters

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


