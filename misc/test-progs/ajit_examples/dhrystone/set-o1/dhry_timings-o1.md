dhrystone -o1 optimization timings
==================================

Speedup: 6.29 %
-----------------

### Timings of optimized assembled code:

    assembled/output_chip_model/ajit_chip00.output:Total time taken by CPU: 7.900656e-02 secs
    assembled/output_chip_model/ajit_chip01.output:Total time taken by CPU: 7.885747e-02 secs
    assembled/output_chip_model/ajit_chip02.output:Total time taken by CPU: 7.887281e-02 secs
    assembled/output_chip_model/ajit_chip03.output:Total time taken by CPU: 7.896001e-02 secs
    assembled/output_chip_model/ajit_chip04.output:Total time taken by CPU: 7.890270e-02 secs
    assembled/output_chip_model/ajit_chip05.output:Total time taken by CPU: 7.889224e-02 secs
    assembled/output_chip_model/ajit_chip06.output:Total time taken by CPU: 7.882654e-02 secs
    assembled/output_chip_model/ajit_chip07.output:Total time taken by CPU: 7.893153e-02 secs
    assembled/output_chip_model/ajit_chip08.output:Total time taken by CPU: 7.890573e-02 secs
    assembled/output_chip_model/ajit_chip09.output:Total time taken by CPU: 7.882124e-02 secs

    # ipython code

    In [1]: asmTimes = [7.900656e-02, 7.885747e-02, 7.887281e-02, 7.896001e-02,
       ...:  7.890270e-02, 7.889224e-02, 7.882654e-02, 7.893153e-02, 7.890573e-
       ...: 02, 7.882124e-02]

    In [2]: avgAsmTime = sum(asmTimes)/len(asmTimes)

    In [3]: avgAsmTime
    Out[3]: 0.07889768300000001
      

### Timings of optimized compiled code:

    compiled/output_chip_model/ajit_chip00.output:Total time taken by CPU: 8.425792e-02 secs
    compiled/output_chip_model/ajit_chip01.output:Total time taken by CPU: 8.418732e-02 secs
    compiled/output_chip_model/ajit_chip02.output:Total time taken by CPU: 8.422055e-02 secs
    compiled/output_chip_model/ajit_chip03.output:Total time taken by CPU: 8.405823e-02 secs
    compiled/output_chip_model/ajit_chip04.output:Total time taken by CPU: 8.418253e-02 secs
    compiled/output_chip_model/ajit_chip05.output:Total time taken by CPU: 8.421235e-02 secs
    compiled/output_chip_model/ajit_chip06.output:Total time taken by CPU: 8.423015e-02 secs
    compiled/output_chip_model/ajit_chip07.output:Total time taken by CPU: 8.423010e-02 secs
    compiled/output_chip_model/ajit_chip08.output:Total time taken by CPU: 8.423047e-02 secs
    compiled/output_chip_model/ajit_chip09.output:Total time taken by CPU: 8.408691e-02 secs

    # ipython code

    In [4]: compTimes = [8.425792e-02, 8.418732e-02, 8.422055e-02, 8.405823e-02
       ...: , 8.418253e-02, 8.421235e-02, 8.423015e-02, 8.423010e-02, 8.423047e
       ...: -02, 8.408691e-02]

    In [5]: avgCompTime = sum(compTimes)/len(compTimes)

    In [6]: avgCompTime
    Out[6]: 0.084189653

    In [7]: 100 * (avgCompTime - avgAsmTime)/avgCompTime
    Out[7]: 6.285772433341651


