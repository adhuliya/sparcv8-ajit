#!/usr/bin/env python3

# This file defines properties related to the sparc assembly syntax.
# Only the properties useful for parsing the code for this implementation are present.

# START : Assembly Syntax Related

# Predefined User Sections
userSections = {".bss", ".comment", ".data", ".data1", ".debug", ".fini", ".init",
        ".rodata", ".rodata1", ".text", ".line", ".note"}
# Predefined Non-User Sections
# These are sections that are predefined but cannot be named
# in the section control directives because they are not under user control
nonUserSections = {".dynamic", ".dynstr", ".dynsym", ".got", ".hash", ".interp",
        ".plt", ".shstrtab", ".strtab", ".symtab"}

# Set of all sections possible
sections = set()

tmpSections = userSections | nonUserSections
for sectionName in tmpSections:
    sections.add(sectionName)
    sections.add(".rel" + sectionName)
    sections.add(".rela" + sectionName)

# END   : Assembly Syntax Related

def printInfo():
    print("User Sections        :", userSections)
    print("Non-User Sections    :", nonUserSections)
    print("All Sections         :", sections)

if __name__ == "__main__":
    printInfo()
