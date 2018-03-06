
s = [ 67 8 9 5];
 result = firstMissingPositive(s)

function result = firstMissingPositive(s)
if(isempty(s)|| length(s)==1)
    result = 1;
    return
end

for i = 1: length(s)
    while( s(i)>0 && s(i)<length(s)+1 && s(s(i))~=s(i) )
        tmp = s(s(i));
        s(s(i)) = s(i);
        s(i) = tmp;
    end
end

for i = 1: length(s)
    if(s(i)~=i)
        result = i;
        return
    end
end
result = length(s)+1;
return
end