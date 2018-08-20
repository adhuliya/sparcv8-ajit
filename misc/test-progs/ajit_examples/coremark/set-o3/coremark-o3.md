core_mark -o3 optimization timings
==================================

Speedup: 0.71 %
-----------------

### Timings of optimized assembled code:

    assembled/output_chip_model/ajit_chip00.output:Total time taken by CPU: 1.236851e+01 secs
    assembled/output_chip_model/ajit_chip01.output:Total time taken by CPU: 1.236803e+01 secs
    assembled/output_chip_model/ajit_chip02.output:Total time taken by CPU: 1.236799e+01 secs
    assembled/output_chip_model/ajit_chip03.output:Total time taken by CPU: 1.236818e+01 secs
    assembled/output_chip_model/ajit_chip04.output:Total time taken by CPU: 1.236873e+01 secs
    assembled/output_chip_model/ajit_chip05.output:Total time taken by CPU: 1.236836e+01 secs
    assembled/output_chip_model/ajit_chip06.output:Total time taken by CPU: 1.236815e+01 secs
    assembled/output_chip_model/ajit_chip07.output:Total time taken by CPU: 1.236851e+01 secs
    assembled/output_chip_model/ajit_chip08.output:Total time taken by CPU: 1.236822e+01 secs
    assembled/output_chip_model/ajit_chip09.output:Total time taken by CPU: 1.236802e+01 secs

    # ipython code

    In [1]: asmTimes = [1.236851e+01, 1.236803e+01, 1.236799e+01, 1.236818e+01,
       ...:  1.236873e+01, 1.236836e+01, 1.236815e+01, 1.236851e+01, 1.236822e+
       ...: 01, 1.236802e+01]

    In [2]: avgAsmTime = sum(asmTimes)/len(asmTimes)

    In [3]: avgAsmTime
    Out[3]: 12.36827


### Timings of optimized compiled code:

    compiled/output_chip_model/ajit_chip00.output:Total time taken by CPU: 1.245669e+01 secs
    compiled/output_chip_model/ajit_chip01.output:Total time taken by CPU: 1.245734e+01 secs
    compiled/output_chip_model/ajit_chip02.output:Total time taken by CPU: 1.245701e+01 secs
    compiled/output_chip_model/ajit_chip03.output:Total time taken by CPU: 1.245668e+01 secs
    compiled/output_chip_model/ajit_chip04.output:Total time taken by CPU: 1.245625e+01 secs
    compiled/output_chip_model/ajit_chip05.output:Total time taken by CPU: 1.245662e+01 secs
    compiled/output_chip_model/ajit_chip06.output:Total time taken by CPU: 1.245630e+01 secs
    compiled/output_chip_model/ajit_chip07.output:Total time taken by CPU: 1.245635e+01 secs
    compiled/output_chip_model/ajit_chip08.output:Total time taken by CPU: 1.245638e+01 secs
    compiled/output_chip_model/ajit_chip09.output:Total time taken by CPU: 1.245718e+01 secs

    # ipython code

    In [4]: compTimes = [1.245669e+01, 1.245734e+01, 1.245701e+01, 1.245668e+01
       ...: , 1.245625e+01, 1.245662e+01, 1.245630e+01, 1.245635e+01, 1.245638e
       ...: +01, 1.245718e+01]

    In [5]: avgCompTime = sum(compTimes)/len(compTimes)

    In [6]: avgCompTime
    Out[6]: 12.456679999999999

    In [7]: 100 * (avgCompTime - avgAsmTime)/avgCompTime
    Out[7]: 0.7097396738135514






