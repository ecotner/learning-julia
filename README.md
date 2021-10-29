# Learning Julia

Julia is a relatively new programming language that tries to combine easy to use syntax with performance.
It is rising in popularity within the statistics/data science space because of the combination of useful packages plus fast performance.
It is a functional language, so doesn't have classes/objects.

## Installing
I'm running an Ubuntu environment so the directions to get it installed are as follows:
Simply [download the tarball](https://julialang.org/downloads/) for the version of Julia you want using `wget`, and extract the contents.
Copy the extracted folder into a more permanent directory and create a symlink to the binary:
```bash
cd ~/Downloads
wget <download URL>
tar -xzvf <downloaded file>
sudo cp -r julia-<version> /opt/
sudo ln -s /opt/julia-<version>/bin/julia /usr/local/bin/julia
```
Now try running `julia` in the shell to enter the REPL interpreter.
You can also install `IJulia` which allows you to run Julia in a Jupyter notebook.
Simply start the `julia` REPL, press `]` to enter the package manager, and type `add IJulia` to install.
Now you should see an option to start a Julia kernel in Jupyter lab/notebook!

## Variables and Types
* Assign values to variables using `=`: `x = 42`.
* Can get the type of variables using `typeof(x)`
* Julia's type system is dynamic, but provides static typing
* the typing system is a tree-based structure with the type `Any` at the root node
    * you can get the subtypes of any type using `subtypes(Type)`, and find the supertypes using `supertype(Type)`
### different types of types:
* primitive types (Bool, Int, Complex, Rational, etc)
    * can create new primitive types using `primitive type <name> <bits> end` where `<bits>` is the number of bit
* abstract types: cannot be instantiated, serve as nodes in the type graph and describe a set of related complex types
* composite types: collection of named fields; in other languages known as records/structs/objects; immutable; can be declared with `struct`
* mutable composite types: values can be changed; declare using `mutable struct` instead
* type unions: includes all instances of any of its argument types; can be any type in the node hierarchy of types in the union
* parametric: placeholder for a specific type; can use different types for its fields, which are set on instantiation
* UnionAll: expresses the iterated union of types; usually written using keyword `where`
* type aliases: introduce a new name for an existing type; helps with readability and can facilitate portability

### data structures:
* arrays, matrices, tuples, named tuples, dictionaries
* arrays are 1-indexed and supports slices, can be multidimensional
* build from vectors using `cat`, or initialize zero array using `zeros`
* create tuples using parentheses; type is immutable; `mytuple = (1, "asdf", 0.5)`
    * create named tuple like `mytuple = (val=1, name="asdf", float=0.5)`
* dictionaries: collection of keys and values; are basically just like in python
    * declare via `mydict = Dict("name" => "Eric", "age" => 30)` and get value via `mydict["name"]`

## Controlling Program Flow
### Compound expressions
Come in two types:
* `begin`/`end` block: you put a bunch of expressions between these two keywords and the last expression is returned as a value (no `return` keyword needed)
* semicolon chain: expressions separated by semicolons within parentheses, like `result = (exp1; exp2; exp3)` will assign the result of `exp3` to `result`
There is no requirement for blocks/chains to be either single or multi-line, and any intermediate expressions are evaluated in global scope.

### Conditionals and Short Circuiting
* standard `if`/`elseif`/`else` construct, but needs to end with `end` keyword
    * does not require braces/colons
    * no requirement to be on multiple lines
* ternary operator: `result = condition ? true_val : false_val`
* short circuit evaluation: only minimum necessary operators are evaluated
    * if you do `<statement-a> && <statement-b>`, `b` only gets evaluated if `a` is `true`
    * if you do `<statement-a> || <statement-b>`, `b` only gets evaluated if `a` is `false`

### Loops
Julia supports both standard `for`/`while` loops (both need to end in `end` keyword)
* `for` loop iterates over iterable object; can use `=`, `in` or `∈`
* `while` loop iterates as long as the condition is true
* if variable is modified within scope of loop you must declare it `global`
* you can break execution of a loop with `break`

### Exception Handling
Use `try`/`catch`/`finally`/`end` to handle exceptions.
Some common exceptions:
* `ArgumentError`: function parameters do not match valid signature
* `DomainError`: argument value is outside valid domain
* `DivideError`: Integer division was attempted with denominator of 0
* `InterruptError`: The process was stopped by a terminal interrupt (Ctrl+C)
* `ErrorException`: Generic error type
You can also raise your own custom errors using the `error()` function (specifically, raises an `ErrorException`)

### Parallelism
Julia can execute code in parallel natively.
This can be done using Tasks (coroutines), and numerical operations on Arrays can be done on multiple cores or GPU's out of the box.