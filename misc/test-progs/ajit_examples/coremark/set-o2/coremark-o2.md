core_mark -o2 optimization timings
==================================

Speedup: 2.20 %
-----------------

### Timings of optimized assembled code:

    assembled/output_chip_model/ajit_chip00.output:Total time taken by CPU: 1.211193e+01 secs
    assembled/output_chip_model/ajit_chip01.output:Total time taken by CPU: 1.210943e+01 secs
    assembled/output_chip_model/ajit_chip02.output:Total time taken by CPU: 1.211002e+01 secs
    assembled/output_chip_model/ajit_chip03.output:Total time taken by CPU: 1.211035e+01 secs
    assembled/output_chip_model/ajit_chip04.output:Total time taken by CPU: 1.210944e+01 secs
    assembled/output_chip_model/ajit_chip05.output:Total time taken by CPU: 1.210947e+01 secs
    assembled/output_chip_model/ajit_chip06.output:Total time taken by CPU: 1.211038e+01 secs
    assembled/output_chip_model/ajit_chip07.output:Total time taken by CPU: 1.211005e+01 secs
    assembled/output_chip_model/ajit_chip08.output:Total time taken by CPU: 1.210973e+01 secs
    assembled/output_chip_model/ajit_chip09.output:Total time taken by CPU: 1.210981e+01 secs

    # ipython code

    In [1]: asmTimes = [1.211193e+01, 1.210943e+01, 1.211002e+01, 1.211035e+01,
       ...:  1.210944e+01, 1.210947e+01, 1.211038e+01, 1.211005e+01, 1.210973e+
       ...: 01, 1.210981e+01]

    In [2]: avgAsmTime = sum(asmTimes)/len(asmTimes)

    In [3]: avgAsmTime
    Out[3]: 12.110060999999998


### Timings of optimized compiled code:

    compiled/output_chip_model/ajit_chip00.output:Total time taken by CPU: 1.238222e+01 secs
    compiled/output_chip_model/ajit_chip01.output:Total time taken by CPU: 1.238266e+01 secs
    compiled/output_chip_model/ajit_chip02.output:Total time taken by CPU: 1.238135e+01 secs
    compiled/output_chip_model/ajit_chip03.output:Total time taken by CPU: 1.238150e+01 secs
    compiled/output_chip_model/ajit_chip04.output:Total time taken by CPU: 1.238190e+01 secs
    compiled/output_chip_model/ajit_chip05.output:Total time taken by CPU: 1.238178e+01 secs
    compiled/output_chip_model/ajit_chip06.output:Total time taken by CPU: 1.238215e+01 secs
    compiled/output_chip_model/ajit_chip07.output:Total time taken by CPU: 1.238142e+01 secs
    compiled/output_chip_model/ajit_chip08.output:Total time taken by CPU: 1.238285e+01 secs
    compiled/output_chip_model/ajit_chip09.output:Total time taken by CPU: 1.238130e+01 secs

    # ipython code

    In [4]: compTimes = [1.238222e+01, 1.238266e+01, 1.238135e+01, 1.238150e+01
       ...: , 1.238190e+01, 1.238178e+01, 1.238215e+01, 1.238142e+01, 1.238285e
       ...: +01, 1.238130e+01]

    In [5]: avgCompTime = sum(compTimes)/len(compTimes)

    In [6]: avgCompTime
    Out[6]: 12.381913

    In [7]: 100 * (avgCompTime - avgAsmTime)/avgCompTime
    Out[7]: 2.195557342391298


