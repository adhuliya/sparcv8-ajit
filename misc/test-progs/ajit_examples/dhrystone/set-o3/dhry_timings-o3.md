dhrystone -o3 optimization timings
==================================

Speedup: 4.625 %
-----------------

### Timings of optimized assembled code:

    assembled/output_chip_model/ajit_chip00.output:Total time taken by CPU: 4.949797e-02 secs
    assembled/output_chip_model/ajit_chip01.output:Total time taken by CPU: 5.620420e-02 secs
    assembled/output_chip_model/ajit_chip02.output:Total time taken by CPU: 4.951311e-02 secs
    assembled/output_chip_model/ajit_chip03.output:Total time taken by CPU: 5.586615e-02 secs
    assembled/output_chip_model/ajit_chip04.output:Total time taken by CPU: 4.950516e-02 secs
    assembled/output_chip_model/ajit_chip05.output:Total time taken by CPU: 6.023769e-02 secs
    assembled/output_chip_model/ajit_chip06.output:Total time taken by CPU: 4.942233e-02 secs
    assembled/output_chip_model/ajit_chip07.output:Total time taken by CPU: 6.186399e-02 secs
    assembled/output_chip_model/ajit_chip08.output:Total time taken by CPU: 4.948431e-02 secs
    assembled/output_chip_model/ajit_chip09.output:Total time taken by CPU: 6.105023e-02 secs


    # python list format
    In [1]: asmTimes = [4.949797e-02, 5.620420e-02, 4.951311e-02, 5.586615e-02, 4.950516e-02, 6.023769e-02, 4.942233e-02, 6.186399e-02, 4.948431e-02, 6.105023e-02]

    In [2]: avgAsmTime = sum(asmTimes)/len(asmTimes)

    In [3]: avgAsmTime
    Out[3]: 0.054264514


### Timings of optimized c code:

    compiled/output_chip_model/ajit_chip00.output:Total time taken by CPU: 5.573877e-02 secs
    compiled/output_chip_model/ajit_chip01.output:Total time taken by CPU: 6.730621e-02 secs
    compiled/output_chip_model/ajit_chip02.output:Total time taken by CPU: 5.578916e-02 secs
    compiled/output_chip_model/ajit_chip03.output:Total time taken by CPU: 5.557355e-02 secs
    compiled/output_chip_model/ajit_chip04.output:Total time taken by CPU: 5.576864e-02 secs
    compiled/output_chip_model/ajit_chip05.output:Total time taken by CPU: 5.577719e-02 secs
    compiled/output_chip_model/ajit_chip06.output:Total time taken by CPU: 5.574863e-02 secs
    compiled/output_chip_model/ajit_chip07.output:Total time taken by CPU: 5.577376e-02 secs
    compiled/output_chip_model/ajit_chip08.output:Total time taken by CPU: 5.583055e-02 secs
    compiled/output_chip_model/ajit_chip09.output:Total time taken by CPU: 5.565238e-02 secs

    # python list format
    In [4]: compTimes = [5.573877e-02, 6.730621e-02, 5.578916e-02, 5.557355e-02, 5.576864e-02, 5.577719e-02, 5.574863e-02, 5.577376e-02, 5.583055e-02, 5.565238e-02]

    In [5]: avgCompTime = sum(compTimes)/len(compTimes)

    In [6]: avgCompTime
    Out[6]: 0.05689588400000001

    In [7]: 100 * (avgCompTime - avgAsmTime)/avgCompTime
    Out[7]: 4.624886397757714


