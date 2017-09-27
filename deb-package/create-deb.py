#!/usr/bin/env python3

"""
This module builds the deb package used to install spairo.
"""
import subprocess as subp
import sys


debDir = "spairo-deb-d"
genDebFile = debDir + ".deb"
finalDebFile = "spairo_{version}_amd64.deb"


controlFile = """\
Package: spairo
Version: {}
Section: custom
Priority: optional
Architecture: all
Essential: no
Installed-Size: 1024
Maintainer: Anshuman Dhuliya <dhuliya@cse.iitb.ac.in>
Description: SParc Assembly Instruction ReOrdering (SPAIRO) -- Optimized Instr Scheduling
Depends: python3 (>= 3.5.1)
"""

usageMsg = "Usage: {} <version-string>"

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print(usageMsg.format(sys.argv[0]))
        exit(1)

    subp.run("rm -Rf {0}/usr/bin/spairo {0}/usr/lib/python3/dist-packages/*".format(debDir),
            shell=True)
    subp.run("cp -R ../src/spairo {}/usr/lib/python3/dist-packages/".format(debDir),
            shell=True)
    subp.run("cp ../src/main.py {}/usr/bin".format(debDir),
            shell=True)
    subp.run("mv {0}/usr/bin/main.py {0}/usr/bin/spairo".format(debDir),
            shell=True)
    with open("{}/DEBIAN/control".format(debDir), "w") as f:
        f.write(controlFile.format(sys.argv[1]))

    print("dpkg --build {}".format(debDir))
    cp = subp.run("dpkg --build {}".format(debDir), shell=True)

    if cp.returncode == 0:
      newName = finalDebFile.format(version=sys.argv[1])
      subp.run("mv {} {}".format(genDebFile, newName), shell=True)
      print("success")
    else:
      print("failure")




