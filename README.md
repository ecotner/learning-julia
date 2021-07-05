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
* different types of types:
    * primitive types (Bool, Int, Complex, Rational, etc)
        * can create new primitive types using `primitive type <name> <bits> end` where `<bits>` is the number of bit
    * abstract types: cannot be instantiated, serve as nodes in the type graph and describe a set of related complex types
    * composite types: collection of named fields; in other languages known as records/structs/objects; immutable; can be declared with `struct`
    * mutable composite types: values can be changed; declare using `mutable struct` instead
    * type unions: includes all instances of any of its argument types; can be any type in the node hierarchy of types in the union
    * parametric: placeholder for a specific type; can use different types for its fields, which are set on instantiation
    * UnionAll: expresses the iterated union of types; usually written using keyword `where`
    * type aliases: introduce a new name for an existing type; helps with readability and can facilitate portability
* data structures:
    * arrays, matrices, tuples, named tuples, dictionaries
    * arrays are 1-indexed and supports slices, can be multidimensional
    * build from vectors using `cat`, or initialize zero array using `zeros`
    * create tuples using parentheses; type is immutable; `mytuple = (1, "asdf", 0.5)`
        * create named tuple like `mytuple = (val=1, name="asdf", float=0.5)`
    * dictionaries: collection of keys and values; are basically just like in python
        * declare via `mydict = Dict("name" => "Eric", "age" => 30)` and get value via `mydict["name"]`
