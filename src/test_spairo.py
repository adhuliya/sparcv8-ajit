#!/usr/bin/env python3

# This module unittests whole of SPAIRO
# does integration tests too

import unittest

# Import all subclasses of unittest.TestCase
from spairo.testing.test_instruction import TestInstruction

if __name__ == "__main__":
    # Unittests all unittest.TestCase subclasses in this scope
    unittest.main()

