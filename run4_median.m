n = 9;
m = 10;
a=sort( randi([1,100],[1,n]))
b = sort(randi([1,100],[1,m]))

result = medianTwoSortedArray(a, b)
result = median([a,b])

function result = medianTwoSortedArray(arr1, arr2)
if(length(arr1) > length(arr2))
    result = medianTwoSortedArray(arr2, arr1);
    return
end

len = length(arr1) + length(arr2);

n1 = 0;
n2 = 0;
i_start = 0;
i_end = length(arr1);

while(n1 <= length(arr1))

    
    n1 = floor(i_end - i_start) + i_start ;
    n2 = floor(len/2) - n1;
% 
%     l1 = (n1==0)*realmin + (n1~=0)*arr1(n1); 
%     l2 = (n2==0)*realmin + (n2~=0)*arr2(n2);
%     r1 = (n1==length(arr1))*realmax + (n1~=length(arr1))*arr1(n1);
%     r2 = (n2==length(arr2))*realmax + (n2~=length(arr2))*arr2(n2);
    
    if(n1==0)
        l1 = intmin;
    else
        l1 = arr1(n1);
    end
    
    if(n2==0)
        l2 = intmin;
    else
        l2 = arr2(n2);
    end
    
    if(n1==length(arr1))
        r1 = intmax;
    else
        r1 = arr1(n1+1);
    end
    if(n2==length(arr2))
        r2  = intmax;
    else
        r2 = arr2(n2+1);
    end
    
    
    if(l1 > r2)
        i_end = n1-1;
    elseif(l2 > r1)
        i_start = n1 + 1;
    else
        if( mod(len,2)==0) %even
            result = (max(l1,l2) + min(r1,r2) )/2;
        else
            result = min(r1,r2);
        end
        return
    end
    
end

return
end