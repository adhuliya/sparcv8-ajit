core_mark -o1 optimization timings
==================================

Speedup: 1.42 %
-----------------

### Timings of optimized assembled code:

    assembled/output_chip_model/ajit_chip00.output:Total time taken by CPU: 1.460979e+01 secs
    assembled/output_chip_model/ajit_chip01.output:Total time taken by CPU: 1.461201e+01 secs
    assembled/output_chip_model/ajit_chip02.output:Total time taken by CPU: 1.461010e+01 secs
    assembled/output_chip_model/ajit_chip03.output:Total time taken by CPU: 1.461108e+01 secs
    assembled/output_chip_model/ajit_chip04.output:Total time taken by CPU: 1.461084e+01 secs
    assembled/output_chip_model/ajit_chip05.output:Total time taken by CPU: 1.461002e+01 secs
    assembled/output_chip_model/ajit_chip06.output:Total time taken by CPU: 1.461038e+01 secs
    assembled/output_chip_model/ajit_chip07.output:Total time taken by CPU: 1.461048e+01 secs
    assembled/output_chip_model/ajit_chip08.output:Total time taken by CPU: 1.460972e+01 secs
    assembled/output_chip_model/ajit_chip09.output:Total time taken by CPU: 1.461026e+01 secs

    # ipython code

    In [1]: asmTimes = [1.460979e+01, 1.461201e+01, 1.461010e+01, 1.461108e+01,
       ...:  1.461084e+01, 1.461002e+01, 1.461038e+01, 1.461048e+01, 1.460972e+
       ...: 01, 1.461026e+01]

    In [2]: avgAsmTime = sum(asmTimes)/len(asmTimes)

    In [3]: avgAsmTime
    Out[3]: 14.610468000000003


### Timings of optimized compiled code:

    compiled/output_chip_model/ajit_chip00.output:Total time taken by CPU: 1.481742e+01 secs
    compiled/output_chip_model/ajit_chip01.output:Total time taken by CPU: 1.482357e+01 secs
    compiled/output_chip_model/ajit_chip02.output:Total time taken by CPU: 1.482562e+01 secs
    compiled/output_chip_model/ajit_chip03.output:Total time taken by CPU: 1.481926e+01 secs
    compiled/output_chip_model/ajit_chip04.output:Total time taken by CPU: 1.482359e+01 secs
    compiled/output_chip_model/ajit_chip05.output:Total time taken by CPU: 1.482100e+01 secs
    compiled/output_chip_model/ajit_chip06.output:Total time taken by CPU: 1.481646e+01 secs
    compiled/output_chip_model/ajit_chip07.output:Total time taken by CPU: 1.482662e+01 secs
    compiled/output_chip_model/ajit_chip08.output:Total time taken by CPU: 1.481676e+01 secs
    compiled/output_chip_model/ajit_chip09.output:Total time taken by CPU: 1.482507e+01 secs

    # ipython code

    In [4]: compTimes = [1.481742e+01, 1.482357e+01, 1.482562e+01, 1.481926e+01
       ...: , 1.482359e+01, 1.482100e+01, 1.481646e+01, 1.482662e+01, 1.481676e
       ...: +01, 1.482507e+01]

    In [5]: avgCompTime = sum(compTimes)/len(compTimes)

    In [6]: avgCompTime
    Out[6]: 14.821537000000001

    In [7]: 100 * (avgCompTime - avgAsmTime)/avgCompTime
    Out[7]: 1.4240695819873364

