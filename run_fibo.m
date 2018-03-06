%% run feb

tic
fibonacci(25)
toc

tic
fibonacci_recursion(25)
toc




function f = fibonacci(n)
if(n<0)
    f = -1; return
elseif(n==0)
    f = 0; return
elseif(n==1)
    f = 1; return
else 
    f2= 0;
    f1 = 1;
    for i = 2: n
        f = f2 + f1;
        f2 = f1;
        f1 = f;
    
    end
end
return
end

function f = fibonacci_recursion(n)
if(n < 0)
    f = -1;
elseif(n == 0)
    f = 0;
elseif(n==1) 
    f = 1;
else
    f = fibonacci_recursion(n-1) + fibonacci_recursion(n-1);
end
end
