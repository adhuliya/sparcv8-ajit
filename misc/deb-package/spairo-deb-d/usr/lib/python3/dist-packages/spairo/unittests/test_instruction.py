#!/usr/bin/env python3
# Test the Instruction class in instruction.py

import unittest
from .. import instruction as instr

instr_tests = [
("ldsb [%r1+%r2],%r4",
instr.Instruction(instrText   = "ldsb [%r1+%r2],%r4",
            mnemonic    = "ldsb",
            name        = "ldsb",
            suffix      = None,
            latency     = 2,
            regRead     = {"r1", "r2"},
            regMod      = {"r4"},
            resUsed     = {})),
("ldsb [%r1],%r4",
instr.Instruction(instrText   = "ldsb [%r1],%r4",
            mnemonic    = "ldsb",
            name        = "ldsb",
            suffix      = None,
            latency     = 2,
            regRead     = {"r1", "r0"},
            regMod      = {"r4"},
            resUsed     = {})),
("ldsb [%l0],%r4",
instr.Instruction(instrText   = "ldsb [%l0],%r4",
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
