This is a simple single thread example.

To build and run the example (no flash):

    ./build.sh -O2;
    ./run.sh;

To build and run the example to simulate
on flash,

    ./build.sh --ramstart 0x40000000 -O2;
    ./run.sh;

