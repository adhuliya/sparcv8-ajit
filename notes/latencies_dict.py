# This python module defines a dictionary that maps instruction to its latency.

instructionLatency = {
  "ADD"     : 2,
  "SUB"     : 2,
  "LD"      : 3, # HitRatio: 90%, CacheHit: 2, Memory: 10, round(2.8) = 3
  "ST"      : 3,
  "MUL"     : 2,
  "DIV"     : 30,


}
