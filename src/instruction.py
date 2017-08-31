#!/usr/bin/env python3

class Instruction():
    def __init__(self, mnemonic="", name="", suffix="",
            read=None, modified=None, originalText=""):
        self.mnemonic = mnemonic
        self.name = name
        self.suffix = suffix
        self.originalText = originalText

        # Set of strings: each identifying a data src or dst
        self.read = read if read else set()
        self.modified = modified if modified else set()

    @staticmethod
    def parse(originalText):
        """
        Parses the instruction and returns the Instruction object.
        """
        pass

if __name__ == "__main__":
    # TODO print some informative msg
    # TODO or do some testing here
    pass
