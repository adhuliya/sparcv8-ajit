#!/usr/bin/env python3

# airo : Assembly Instrction Reordering

import copy
import random as rand
from textwrap import dedent

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

    def __str__(self):
        string = """\
        InstrNode(id={}, instr="{}", priority={}, pred={}, succ={})"""

        return dedent(string).format(
                self.id, self.instr.instrText if self.instr else None,
                self.priority, self.pred, self.succ)

    def copy(self):
        return InstrNode(id=self.id, instr=self.instr, priority=self.priority,
                pred=copy.copy(self.pred), succ=copy.copy(self.succ))

    def __eq__(self, other):
        return self.id == other.id

    def __hash__(self):
        return self.id


class DependencyGraph():
    def __init__(self, instrList=None, graph=None):
        # List of Instruction objects in a basic block.
        self.instrList  = instrList
        self.graph      = graph     # Dict of (InstrNode.id : InstrNode)

    def createGraph(self):
        """
        Creates graph from the list of instrctions given.
        TODO
        """
        self.graph      = None

    def copyGraph(self):
        copiedGraph = dict()
        for nodeid in self.graph:
            copiedGraph[nodeid] = self.graph[nodeid].copy()

        return copiedGraph

    def topoSort(self, huristic=None):
        """
        Topologically sorts using a List Algorithm with the given huristic.
        """
        sources     = set()
        graph       = self.copyGraph()
        sortedNodes = []

        while graph:
            # Update Sources
            sources = sources | DependencyGraph.extractSources(graph)
            # Seclect an appropriate next node
            selectedNode = DependencyGraph.selectNode(sortedNodes, sources, graph, huristic)
            # Append the (original)node into the sequence
            # Original node is added because its pred and succ are intact.
            # pred and succ info of a node may be used in selectNode()
            sortedNodes.append(self.graph[selectedNode.id])
            # Remove the node from the sources set
            sources.remove(selectedNode)
            # Remove the selected node from the graph
            graph = DependencyGraph.removeNodeFromGraph(graph, selectedNode)

        return sortedNodes

    @staticmethod
    def printGraph(graph):
        print("Graph")
        for nodeid in graph:
            print("NodeID :", nodeid)
            print(graph[nodeid])

    @staticmethod
    def extractSources(graph):
        sources = set()
        for nodeid in graph:
            if not graph[nodeid].pred:
                sources.add(graph[nodeid])

        assert len(sources) > 0

        return sources

    @staticmethod
    def removeNodeFromGraph(graph, node):
        len1 = len(graph)

        del graph[node.id]

        for nodeid in node.pred:
            graph[nodeid].succ.remove(node.id)

        for nodeid in node.succ:
            graph[nodeid].pred.remove(node.id)

        assert len1 - len(graph) == 1

        return graph

    @staticmethod
    def selectNode(sortedNodes, sources, graph, huristic):
        if huristic is None:
            return DependencyGraph.selectAnyNode(sources)
        elif huristic.strip().lower() == "notdependent":
            # separate the dependent nodes by putting in non-dependent nodes
            return DependencyGraph.selectNotDependentNode(sortedNodes, sources)

    @staticmethod
    def selectNotDependentNode(sortedNodes, sources):
        """
        Selects nodes which are not dependent on the already sorted nodes.
        As far as possible.
        """
        src = sources

        for node in reversed(sortedNotes):
            leftnodes = src - sortedNodes.succ
            if leftnodes:
                src = leftnodes
            else:
                break

        for node in src:
            return node

    @staticmethod
    def selectAnyNode(sources):
        """
        Return any one source.
        """
        for src in sources:
            return src


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

    seq = dg.topoSort("notdependent")
    print("Diamond Graph Sort Demo")
    for item in seq:
        print(item)

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

    seq = dg.topoSort("notdependent")
    print("Graph Sort Demo 2")
    for item in seq:
        print(item)


if __name__ == "__main__":
    sampleSortDemo1()
    sampleSortDemo2()


