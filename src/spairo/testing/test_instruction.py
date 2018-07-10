#!/usr/bin/env python3
# Test the Instruction class in instruction.py

import unittest
from .. import instruction as instr
from ..parse.asm import AsmChunk

instr_tests = [

( AsmChunk (text="ldsb [%r1+%r2],%r4", unitType="instr", isTextSection=True),
instr.Instruction(asmChunk   = AsmChunk (text="ldsb [%r1+%r2],%r4", unitType="instr", isTextSection=True),
            mnemonic    = "ldsb",
            name        = "ldsb",
            suffix      = None,
            latency     = 2,
            regRead     = {"r1", "r2"},
            regMod      = {"r4"},
            resUsed     = {})),

(AsmChunk (text="ldsb [%r1],%r4", unitType="instr", isTextSection=True),
instr.Instruction(asmChunk   = AsmChunk (text="ldsb [%r1],%r4", unitType="instr", isTextSection=True),
            mnemonic    = "ldsb",
            name        = "ldsb",
            suffix      = None,
            latency     = 2,
            regRead     = {"r1", "r0"},
            regMod      = {"r4"},
            resUsed     = {})),

(AsmChunk (text="ldsb [%l0],%r4", unitType="instr", isTextSection=True),
instr.Instruction(asmChunk   = AsmChunk (text="ldsb [%l0],%r4", unitType="instr", isTextSection=True),
            mnemonic    = "ldsb",
            name        = "ldsb",
            suffix      = None,
            latency     = 2,
            regRead     = {"r16", "r0"},
            regMod      = {"r4"},
            resUsed     = {})),
]

class TestInstruction(unittest.TestCase):
    def test_parsing(self):
        iobj = None
        try:
            for stmt, obj in instr_tests:
                iobj = instr.Instruction(stmt).parse()
                self.assertEqual(iobj, obj)
        except Exception as e:
            print("CORRECT:")
            print(obj)
            print("INCORRECT:")
            print(iobj)
            raise e

if __name__ == "__main__":
    unittest.main()
