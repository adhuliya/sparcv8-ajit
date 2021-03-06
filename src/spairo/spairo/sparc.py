#!/usr/bin/env python3

# The assembly language specification is specified in `info.py` file by the user.
# This module loads the specification into ready to use data structures.
# All the modules use this module for specification information.


from . import sparcinfo
import re

pattern1 = re.compile(r"@(?P<name>[AE][A-Z]\d)|(?P<space>\s+)")
spaceRegex = r"[ \t]*"

def processInstrData():
    instrData = sparcinfo.instrData
    instr = dict()

    def processFormats(formats):
        def substituteFormat(match):
            groupdict = match.groupdict()
            if groupdict["name"] is not None:
                name = match.group("name")
                if name[0] == "A":
                    # "A" means All matches
                    # All content in the position is captured first.
                    # Regex is used to extract ALL occurances from the captured text.
                    return r"(?P<{}>[^,]*?)".format(name)
                elif name[0] == "E":
                    # "E" means Exact match
                    # add the actual regex for the name
                    return r"(?P<{}>{})".format(name, regexMap[name[:2]][1])
            elif groupdict["space"] is not None:
                return spaceRegex
            else:
                assert False

        formatList = []

        for fmt, details in formats:
            fmt = "^" + fmt + "$"
            p = re.compile(pattern1.sub(substituteFormat, fmt))
            formatList.append((p, details))

        return formatList

    for key, val in instrData.items():
        instr[key] = dict()
        instr[key]["formats"] = processFormats(val["formats"])

    return instr

def  processRegexMap():
    rMap = sparcinfo.regexMap
    newRMap = dict()

    for key in rMap:
        newRMap[key] = (re.compile(rMap[key]), rMap[key])

    return newRMap

def processSectionNames():
    sections = set()
    tmpSections = sparcinfo.userSections | sparcinfo.nonUserSections
    for sectionName in tmpSections:
        sections.add(sectionName)
        sections.add(".rel" + sectionName)
        sections.add(".rela" + sectionName)
    return sections


# START : Useful Processed Data

regexMap    = processRegexMap()
# process regexMap before instr
instr           = processInstrData()
branchInstr     = sparcinfo.branchInstr
nonLabeledBranch= sparcinfo.nonLabeledBranch
labeledBranch   = sparcinfo.labeledBranch
bbBoundary      = sparcinfo.bbBoundary
noDelaySlot     = sparcinfo.noDelaySlot
registers       = sparcinfo.registers
regSynonyms     = sparcinfo.regSynonyms
resources       = sparcinfo.resources
pipeline        = sparcinfo.pipeline
pair            = sparcinfo.pairLatency
userSections    = sparcinfo.userSections
nonUserSections = sparcinfo.nonUserSections
sections        = processSectionNames()
Value           = sparcinfo.Value

# END   : Useful Processed Data


def printInfo():
    print("Total Instr Menemonics   :", len(instr))
    print()
    print("Branch Instr             :\n", branchInstr)
    print()
    print("Labeled Branch Instr     :\n", labeledBranch)
    print()
    print("NonLabeled Branch Instr  :\n", nonLabeledBranch)
    print()
    print("BB Boundary Instr        :\n", bbBoundary)
    print()
    print("User Sections            :\n", userSections)
    print()
    print("Non User Sections        :\n", nonUserSections)
    print()
    print("Registers                :\n", registers)
    


if __name__ == "__main__":
    printInfo()


