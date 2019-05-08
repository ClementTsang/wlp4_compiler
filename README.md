# wlp4_compiler

This is the resulting compiled files for a WLP4 compiler written for CS 241, written in C++.  The compiler takes in ``.wlp4`` files and generates ``.asm`` files, from which one can use the appropriate converters to generate the resulting ``.mips`` code.

The compiler features various optimization features to reduce the length of the generated file.  

## What is WLP4?
WLP4 is a subset of C, with various limitations put in to make it more digestable to write a compiler for second year students.  A brief overview of the differences can be seen [here](https://www.student.cs.uwaterloo.ca/~cs241/wlp4/WLP4tutorial.html), while a full specification of the language can be found [here](https://www.student.cs.uwaterloo.ca/~cs241/wlp4/WLP4.html).

## Where are the implementation files?  
Unfortunately, I cannot and will not share the implementation files, due to the fact that this was an assignment that is most definitely done every term - sorry.  Nor will I share some of the files used in the middle, such as the ``.merl`` files as I do not know how much I can share.

As such, this compiler is frankly quite useless other than generating assembly code as we cannot go from assembly  code -> machine code, as we require ``print.merl`` and ``alloc.merl`` to be linked for our code to work.

However, if you do wish to use this to generate *just* assembly code, go ahead.
