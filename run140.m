%% driver
str = 'likewhichulikeisuuulikeaa';
dict={'i','like','u','which','is','wrong', 'thing','test','sfds','li','keis','likeis'};
% first approach

global mymap
mymap = containers.Map('KeyType','char', 'ValueType','any');
 % Value is like this 'd d d   / d d d /' which is comprised of 2t+1
 % vectors, put in one row [str1, str2, str3]

tic
celllist = workBreaker_dp1(str, dict);
toc
for i=1:length(celllist)
celllist{i}
end
%% function
function cells = workBreaker_dp1(str, dict)
global mymap
length(mymap)

if(isKey(mymap, str))
    cells = mymap(str);
    return
end
cell_cur = {};

if(any(strcmp(dict,str)))
cell_cur = [cell_cur, str ];
end

for i = 1: (length(str)-1)
    if( ~any(strcmp(dict, str(i+1:end) )) )
        continue
    end
    cell_left = workBreaker_dp1(str(1:i), dict) ;
    
    % append right to cell or sentence on the left
    for j = 1: length(cell_left)
        cell_left{j} = [cell_left{j},' ',str(i+1:end) ]; 
    end
    
    
    cell_cur = [cell_cur, cell_left ];
end

mymap(str) = cell_cur;
cells = mymap(str);

return
end