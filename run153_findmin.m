n = randi([-10,10],1);
a= [ n : n + randi([1000,5000],1) ];
pivot = randi( [1, length(a)] ,1);
a=[ a(pivot+1 :end),a(1:pivot)  ];
min(a)
findMin(a)

function res = findMin(a)
if(length(a)==1)
    res = a;
    return
end

if(length(a)==2)
    res = min(a);
    return
end

idx = floor(length(a)/2);

if(a(idx)>a(idx+1) )
    res = a(idx+1);
    return
end

if(a(idx+1) > a(end) )
    res = findMin(a(idx+1 : end));
else 
    res = findMin(a(1:idx));
end

return
end