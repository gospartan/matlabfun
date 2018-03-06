x = 10.5;n=5;
f1 = x^n
f2 = pow(x,n)
err=abs(f1-f2)/abs(f1)
function res = pow(x, n)
if(n==0) 
    res = 1;
    return
end

y = pow(x,floor(n/2));

res = y*y;

if(mod(n,2)==1)
    res = res * x;
end

return
end