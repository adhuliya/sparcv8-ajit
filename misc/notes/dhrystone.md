dhrystone speedup
==================

The `dhrystone` benchmark was executed 10000 times in a loop to get the readings below. (`run_dhrystone(10000)`)

Multiple readings have been taken, since the current simulation provides an approximate execution time (in seconds).

The `10000` times run and the multiple readings, together compensate for the drawback of approximate execution time available.

Timings without reordeing
---------------------------

Timings for five executions were noted,

    t1 = [5.788620e-2, 5.898565e-2, 5.797927e-2, 5.895744e-2, 5.891076e-2]

Timings with reordering
------------------------

Timings for five executions were noted,

    t2 = [5.153880e-2, 5.155012e-2, 5.153005e-2, 5.160843e-2, 5.159059e-2]

Speedup
--------

    t1avg = sum(t1)/len(t1)
    
    t2avg = sum(t2)/len(t2)
    
    diff = t1avg-t2avg
    
    (diff/t1avg) * 100
    11.923138520545891

The speed up is almost 12%.



