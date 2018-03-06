clc
clear
global mymap
mymap =containers.Map('KeyType','int32', 'ValueType','int32');
add1(10,100)
%% func1
function add1(key,value)
global mymap
disp('in add1')
length(mymap)

if(length(mymap)>=6)
    return
end
mymap(key) = value;
 if(value < 110 )
add1(key+1 ,value+1)
 end
return
end

function add2(key,value)
global mymap
disp('in add2')
length(mymap)

mymap(key) = value;

add1(key+1 ,value+1)

return
end