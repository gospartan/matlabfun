arr=[3 1 2 4 5]
result = maxContainer(arr)
function result = maxContainer(arr)
ptr1 = 1; ptr2= length(arr);
result = 0;
while(true)
    if(ptr1==ptr2)
        return
    end
    result = max(result, (ptr2-ptr1)*min(arr(ptr1),arr(ptr2)));
    if(arr(ptr2)> arr(ptr1))
        ptr1 = ptr1 + 1;
    else
        ptr2 = ptr2 - 1;
    end
end
end