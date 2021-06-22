Notes
-------------

### Components
0. Read user configuration - yaml file -- DONE
1. Linking
   1. Linker Script
      * To compile each program into a separate text/data region.
   1. Linking (of setup_page_tables.s and init.s etc.)
      * Only with the first program which will run on thread (0,0).
2. Co-operative scheduler that will schedule processes on a thread.    
   * The scheduler starts the first process.
   * The processes call the scheduler at appropriate places,
     and the scheduler schedules the next process in the queue.
   * If a process ends, it returns to the scheduler which may
      * Stop the process forever.
      * Or restart the process.
2. Malloc library (bget: <https://www.fourmilab.ch/bget/>)
   * Defines an API to access the malloc logic.
   * Allocates a location for a locking variable.
   * Allocates a chunk of memory from which the allocations are made.
3. Message Queues
   * defines an API to use the queue.
   * allocates an array of locking variables (each for one queue).
   * allocates the space for each queue.
4. Lock/Release (Syncronization) procedures
   * allocates an array of locking variables
6. How to find the size of text and data sections?
   <https://medium.com/analytics-vidhya/exploring-elf-files-using-pyelftools-93bb7665cce3>
8. Read cortos documentation.


## Stage 1
Objective: To be able to run N programs on N threads without any communication.

## Stage 2
Objective: To be able to run N programs on N threads with a shared lock.

## Stage 2.5
Objective: To be able to run N programs on N threads with M shared locks.

## Stage 3
Objective: To be able to run N programs on N threads with a fixed shared queue.  

## Stage 3.5
Objective: To be able to run N programs on N threads with a variable shared queue.

## Stage 4
Objective: To be able to run N programs on N threads with M shared queues.

## Stage 5
Objective: To be able to run N programs on N threads with M shared queues,
           and with malloc functionality (bget?).

## Stage 6
Objective: To be able to run N programs on X threads with M shared queues.
           (will use co-operative scheduler, where the main function of processes
           return to the scheduler.)

## Stage 6.5
Objective: To be able to run N programs on X threads with M shared queues.
           (will use co-operative scheduler, where processes yield to the
            scheduler at specific program points)



Memory Layout Notes
-------------------------
Contents:
* programs (text, data), and their stack
* synchronization variables
* space for queues
* malloc area


    0x00000000  part of init.s starts here      (addr: 0)
    0x00000000  reserved space (say 256 bytes)  (addr: pre-computed)
    0x00000000  synchronization variables       (addr: pre-computed)
    0x00000000  queue space                     (addr: pre-computed)
    0x00000000  rest of the init.s is here
    0x00000000  malloc area                     (addr: pre-computed)
    0x00000000  program0 (text, data)           (addr: pre-computed)
    0x00000000  program1 (text, data)           (addr: pre-computed)
    0x00000000  program0 stack                  (addr: pre-computed)
    0x00000000  program1 stack                  (addr: pre-computed)
    0x00000000  unused area                     (addr: pre-computed)


