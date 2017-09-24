#!/usr/bin/env python3

# airo : Assembly Instrction Reordering

import copy
import random as rand
from textwrap import dedent
from .instruction import Instruction
from .parse.asm import AsmChunk

class InstrNode():
    id  = 0

    @staticmethod
    def getId():
        InstrNode.id += 1
        return InstrNode.id

    def __init__(self, id=None, instr=None, priority=None, pred=None, succ=None):
        if id is None:
            self.id = InstrNode.getId()
        else:
            self.id = id
        self.instr      = instr
        self.priority   = priority
        self.pred       = pred if pred else set()  # set of InstrNodes ids
        self.succ       = succ if succ else set()  # set of InstrNodes ids

        # some huristic counters
        self.count1     = 0

    def __str__(self):
        string = """\
        InstrNode(id={}, instr="{}", priority={}, pred={}, succ={})"""

        return dedent(string).format(
                self.id, self.instr.asmChunk.text if self.instr else None,
                self.priority, self.pred, self.succ)

    def copy(self):
        return InstrNode(id=self.id, instr=self.instr, priority=self.priority,
                pred=copy.copy(self.pred), succ=copy.copy(self.succ))

    def __eq__(self, other):
        return self.id == other.id

    def __hash__(self):
        return self.id


class DependencyGraph():
    huristicsMap = {
            "none"      : "A plain topological sort.", 
            "nodep"     : "Choose not-dependent nodes first.", 
            "raw"       : "Tries to separate RAW dependendent instructions.",
            "default"   : "raw", # must be a valid key in THIS map
            }

    def __init__(self, instrList=None, graph=None):
        # List of Instruction objects in a basic block.
        self.instrList  = instrList
        # graph is explicity given in unittests
        self.graph      = graph

        # if instrList is not None, graph is automatically generated
        if instrList: self.generateGraph()


    def generateGraph(self):
        """
        Creates graph from self.instrList
        Old graph is purged.
        """
        assert self.instrList

        self.graph      = dict()

        # Convert instr list to instr node list
        instrNodeList   = []
        for instr in self.instrList:
            instrNodeList.append(InstrNode(instr=instr))

        # Put the node into the graph
        for node in instrNodeList:
            self.graph[node.id] = node

        # Work out all the dependencies
        for i, nodePred in enumerate(instrNodeList):
            for j, nodeSucc in enumerate(instrNodeList[i+1:]):
                isDep = nodeSucc.instr.isDependentOn(nodePred.instr)
                if isDep:
                    # add mutual dependency
                    nodePred.succ.add(nodeSucc.id)
                    nodeSucc.pred.add(nodePred.id)
                    # convert direct dependenies to transitive
                    for pred in nodePred.pred:
                        if nodeSucc.id in self.graph[pred].succ:
                            self.graph[pred].succ.remove(nodeSucc.id)
                            nodeSucc.pred.remove(self.graph[pred].id)



    def copyGraph(self):
        copiedGraph = dict()
        for nodeid in self.graph:
            copiedGraph[nodeid] = self.graph[nodeid].copy()

        return copiedGraph

    # Sorts with the give huristics and returns a new sequence.
    def topoSort(self, huristic="none"):
        """
        Topologically sorts using a List Algorithm with the given huristic.
        """

        assert huristic in self.huristicsMap, "Unknow huristic: '{}'".format(huristic)

        sources     = set()
        graph       = self.copyGraph()
        sortedNodeIds = []

        while graph:
            # Update Sources
            sources = sources | self.extractSourceIds(graph)
            # Seclect an appropriate next node
            selectedNodeId = self.selectNode(sortedNodeIds, sources, graph, huristic)
            # Append the (original)node into the sequence
            # Original node is added because its pred and succ are intact.
            # pred and succ info of a node may be used in selectNode()
            sortedNodeIds.append(selectedNodeId)
            # Remove the node from the sources set
            sources.remove(selectedNodeId)
            # Remove the selected node from the working graph
            graph = self.removeNodeFromGraph(graph, graph[selectedNodeId])

        return sortedNodeIds

    # Sorts with the give huristics and returns a reordered list of instructions.
    def getReorderedInstrList(self, huristics=None):
        seq = self.topoSort(huristics)

        instrList = []
        for num in seq:
            instrList.append(self.graph[num].instr)

        return instrList

    @staticmethod
    def printGraph(graph):
        print("Graph")
        for nodeid in graph:
            print("NodeID :", nodeid)
            print(graph[nodeid])

    def extractSourceIds(self, graph):
        sources = set()
        for nodeid in graph:
            if not graph[nodeid].pred:
                sources.add(nodeid)

        assert len(sources) > 0

        return sources

    def removeNodeFromGraph(self, graph, node):
        len1 = len(graph)

        del graph[node.id]

        for nodeid in node.pred:
            graph[nodeid].succ.remove(node.id)

        for nodeid in node.succ:
            graph[nodeid].pred.remove(node.id)

        assert len1 - len(graph) == 1

        return graph

    def selectNode(self, sortedNodeIds, sources, graph, huristic):
        if huristic.strip().lower() == "none":
            return self.selectAnyNode(sources)
        elif huristic.strip().lower() == "nodep":
            # separate the dependent nodes by putting in non-dependent nodes
            return self.selectNotDependentNode(sortedNodeIds, sources)
        elif huristic.strip().lower() == "raw":
            return self.selectNotRawFirst(sortedNodeIds, sources)

    def selectNotRawFirst(self, sortedNodeIds, sources):
        """
        Select nodes which are not Raw dependent to the already sorted nodes.
        """
        src = sources

        for nodeid in reversed(sortedNodeIds):
            node = self.graph[nodeid]


            # extract raw dependent successors
            rawSet = set()
            for succ in node.succ:
                if self.graph[succ].instr.isRawDependentOn(node.instr):
                    rawSet.add(succ)

            leftnodes = src - rawSet

            if leftnodes:
                src = leftnodes
            else:
                break

        for nodeid in src:
            return nodeid

    def selectNotDependentNode(self, sortedNodeIds, sources):
        """
        Selects nodes which are not dependent on the already sorted nodes.
        As far as possible.
        """
        src = sources

        for nodeid in reversed(sortedNodeIds):
            leftnodes = src - self.graph[nodeid].succ
            if leftnodes:
                src = leftnodes
            else:
                break

        for nodeid in src:
            return nodeid

    def selectAnyNode(self, sources):
        """
        Return any one source.
        """
        for nodeid in sources:
            return nodeid

    def getAllHuristics(self):
        return self.huristicsMap

    @staticmethod
    def getHuristicHelpMsg():
        msg = ""
        for key, val in DependencyGraph.huristicsMap.items():
            msg += "\n{:<10}: {}".format(key, val)
        return msg




def sampleSortDemo1():
    n4 = InstrNode()
    n2 = InstrNode()
    n1 = InstrNode()
    n3 = InstrNode()

    n1.succ |= {n2.id, n3.id}
    n2.succ |= {n4.id}
    n3.succ |= {n4.id}
    n4.pred |= {n2.id, n3.id}
    n2.pred |= {n1.id}
    n3.pred |= {n1.id}

    nodelist = [n1,n2,n3,n4]

    graph = dict()
    for n in nodelist:
        graph[n.id] = n

    dg = DependencyGraph(graph=graph)

    seq = dg.topoSort("nodep")
    print("Diamond Graph Sort Demo")
    for item in seq:
        print(dg.graph[item])

def sampleSortDemo2():
    n0 = InstrNode()
    n1 = InstrNode()
    n2 = InstrNode()
    n3 = InstrNode()
    n4 = InstrNode()
    n5 = InstrNode()

    n0.pred |= {n5.id, n4.id}
    n1.pred |= {n3.id, n4.id}
    n2.pred |= {n5.id}
    n2.succ |= {n3.id}
    n3.succ |= {n1.id}
    n3.pred |= {n2.id}
    n4.succ |= {n0.id, n1.id}
    n5.succ |= {n0.id, n2.id}

    # Assume all arrows are downwards
    # n5    n4
    # | \  / |
    # n2 n0  |
    # |      /
    # n3    /
    #   \  /
    #    n1

    nodelist = [n0,n1,n2,n3,n4,n5]

    graph = dict()
    for n in nodelist:
        graph[n.id] = n

    dg = DependencyGraph(graph=graph)

    seq = dg.topoSort("nodep")
    print("Graph Sort Demo 2")
    for item in seq:
        print(dg.graph[item])

def sampleSortDemo3():
    instr1 = Instruction(AsmChunk(index=0, text="add %r1,%r2,%r3", unitType="instr", isTextSection=True)).parse()
    instr2 = Instruction(AsmChunk(index=0, text="add %r1,%r2,%r3", unitType="instr", isTextSection=True)).parse()
    instr3 = Instruction(AsmChunk(index=0, text="add %r6,%r6,%r6", unitType="instr", isTextSection=True)).parse()

    dg = DependencyGraph(instrList=[instr1, instr2, instr3])
    seq = dg.topoSort("nodep")
    print("Graph Sort Demo 2")
    for item in seq:
        print(dg.graph[item])


if __name__ == "__main__":
    # sampleSortDemo1()
    # sampleSortDemo2()
    sampleSortDemo3()


