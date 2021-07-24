dhrystone -o2 optimization timings
==================================

Speedup: 10.29 %
-----------------

### Timings of optimized assembled code:

    assembled/output_chip_model/ajit_chip00.output:Total time taken by CPU: 5.262491e-02 secs
    assembled/output_chip_model/ajit_chip01.output:Total time taken by CPU: 5.256287e-02 secs
    assembled/output_chip_model/ajit_chip02.output:Total time taken by CPU: 5.265158e-02 secs
    assembled/output_chip_model/ajit_chip03.output:Total time taken by CPU: 5.258392e-02 secs
    assembled/output_chip_model/ajit_chip04.output:Total time taken by CPU: 5.256004e-02 secs
    assembled/output_chip_model/ajit_chip05.output:Total time taken by CPU: 5.247037e-02 secs
    assembled/output_chip_model/ajit_chip06.output:Total time taken by CPU: 5.262038e-02 secs
    assembled/output_chip_model/ajit_chip07.output:Total time taken by CPU: 5.267882e-02 secs
    assembled/output_chip_model/ajit_chip08.output:Total time taken by CPU: 5.263059e-02 secs
    assembled/output_chip_model/ajit_chip09.output:Total time taken by CPU: 5.266171e-02 secs
    
    # ipython code
    In [1]: asmTimes = [5.262491e-02, 5.256287e-02, 5.265158e-02, 5.258392e-02,
       ...:  5.256004e-02, 5.247037e-02, 5.262038e-02, 5.267882e-02, 5.263059e-
       ...: 02, 5.266171e-02]

    In [2]: avgAsmTime = sum(asmTimes)/len(asmTimes)

    In [3]: avgAsmTime
    Out[3]: 0.052604519


### Timings of optimized compiled code:

    compiled/output_chip_model/ajit_chip00.output:Total time taken by CPU: 5.894229e-02 secs
    compiled/output_chip_model/ajit_chip01.output:Total time taken by CPU: 5.793769e-02 secs
    compiled/output_chip_model/ajit_chip02.output:Total time taken by CPU: 5.883770e-02 secs
    compiled/output_chip_model/ajit_chip03.output:Total time taken by CPU: 5.891813e-02 secs
    compiled/output_chip_model/ajit_chip04.output:Total time taken by CPU: 5.795571e-02 secs
    compiled/output_chip_model/ajit_chip05.output:Total time taken by CPU: 5.889363e-02 secs
    compiled/output_chip_model/ajit_chip06.output:Total time taken by CPU: 5.898125e-02 secs
    compiled/output_chip_model/ajit_chip07.output:Total time taken by CPU: 5.892683e-02 secs
    compiled/output_chip_model/ajit_chip08.output:Total time taken by CPU: 5.799260e-02 secs
    compiled/output_chip_model/ajit_chip09.output:Total time taken by CPU: 5.897120e-02 secs


    # ipython code
    In [4]: compTimes = [5.894229e-02, 5.793769e-02, 5.883770e-02, 5.891813e-02
       ...: , 5.795571e-02, 5.889363e-02, 5.898125e-02, 5.892683e-02, 5.799260e
       ...: -02, 5.897120e-02]

    In [5]: avgCompTime = sum(compTimes)/len(compTimes)

    In [6]: avgCompTime
    Out[6]: 0.058635703

    In [7]: 100 * (avgCompTime - avgAsmTime)/avgCompTime
    Out[7]: 10.285856042350161



