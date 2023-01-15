# AmyAssembly
AmyAssembly is an assembly-like programming language and a fun personal project. This repo includes an interpreter for running AmyAssembly. 
(The interpreter is written in python and is only functional, not optimized for performance).

# Building + Installing
You can build and install the interpreter using the provided build script.
```bash
cd code/
./build.sh
```

This will build the interpreter and add a symlink to the executable in $HOME/bin
so you should add $HOME/bin to your PATH if it isn't already. You can do that 
by adding the following to your ~/.bashrc
```bash
export PATH="$HOME/bin:$PATH
```

# Uninstalling
AmyAssembly does not install anything outside of the cloned repo other than the symlink in $HOME/bin. To uninstall, you can remove that symlink.
```bash
rm $HOME/bin/amyasmi
```

# Running An AmyAssembly Program
AmyAssembly can be executed using the AmyAssembly Interpreter (amyasmi). Simply run the interpreter with your source code file as the only parameter.
(Language documentation coming soon)
```bash
amyasmi <your-amyasm-file>
```

The file extension doesn't matter, but it is preferred to use .amyasm to represent AmyAssembly programs.

# Sample AmyAssembly Program
Below is a sample hello world program, 'hello.amyasm'
```
// 'Simple' AmyAssembly hello world program 
// By Amy Burnett
//========================================================================
// start at main
    jump main
//========================================================================
// Returns a customary phrase stored on the heap
getCustomaryPhraseFromHeap:
    malloc phrase 13
    assign phrase[0] 'H' 
    assign phrase[1] 'e'
    assign phrase[2] 'l'
    assign phrase[3] 'l'
    assign phrase[4] 'o'
    assign phrase[5] ','
    assign phrase[6] ' '
    assign phrase[7] 'W'
    assign phrase[8] 'o'
    assign phrase[9] 'r'
    assign phrase[10] 'l'
    assign phrase[11] 'd'
    assign phrase[12] '!'
    return phrase
//========================================================================
main:
    call getCustomaryPhraseFromHeap
    // grab the return value of the previous call
    response msg 
    // loop through phrase and print out 
    assign i 0
while:
    // condition
    cmp i 13
    jge endwhile
    // body 
    print msg[i]
    // update
    add i i 1
    // repeat
    jump while
endwhile:
    println 
    free msg 
    halt
```

We can run the code with the following
```bash
amyasmi hello.amyasm
```

Which outputs
```
Hello, World!
```