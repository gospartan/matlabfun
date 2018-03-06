a=100;
n =3;
b=3;
mod(a^n,b)
res = fastPower(a, b,n)
function res = fastPower(a, b,n)
if(b==0)
    res = -1;
    return
end
if(n==0) 
    res = mod(1, b);
    return
end
if(n==1)
    res = mod(a,b);
    return
end
x = fastPower(a, b, floor(n/2));
if(mod(n,2)==0)
res = mod(x*x, b) ;
else
    res = mod(x*x, b) ;
res = mod(res*mod(a,b),b );
end

return
end
