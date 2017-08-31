#!/usr/bin/env python3

import re
import sys
import os

singleLineComment = re.compile(r"(?P<code>[^!]*).*(?m)")
multiLineComment = re.compile(r"/\*.*?\*/(?s)")
labels = re.compile("(?P<label>\w+)[ \t]*:[ \t]*(?P<rest>.*)")

# Returns full file in an str object
def readFile(filename):
    content = None
    with open(filename, "r") as f:
        content = f.read()
    return content

# takes file content as string
def removeMultilineComments(content):
    return multiLineComment.sub("", content)

# takes file content as string
# returns a list of lines
def removeSingleLineComments(content):
    return singleLineComment.sub("\g<code>", content)

# Puts labels on their own lines
def separateLabels(content):
    def replace(m):
        if m.group("rest")
    oldContent = content
    newContent = None

    while newContent != oldContent:
      if newContent: oldContent = newContent
      newContent = labels.sub("\g<label>:" + os.linesep + "\g<rest>", oldContent)

    return newContent

if __name__ == "__main__":
    content = readFile(sys.argv[1])
    content = removeMultilineComments(content)
    content = removeSingleLineComments(content)
    content = separateLabels(content)
    print(content)


