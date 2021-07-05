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