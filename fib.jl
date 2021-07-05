# a simple fibonacci script

function fib(n::Int)
    n<0 && error("n must not be negative")
    n==1 && return 1
    n==0 && return 1
    fib(n-1) + fib(n-2)
end

# execute fib in a for loop
for i=1:parse(Int, ARGS[1])
    println(string("fibonacci of ", i, " = ", fib(i)))
end