arr = randi([-5,5],[1,10])
target = 0;
%
% arr = sort(arr)
%  func2sum(arr,-10)
tic
func3sum(arr, target)
toc
tic
func3sum_map(arr, target)
toc
sort(arr)
%% function of 2 sum
function result = func2sum(arr,target)
result = [];
if(length(arr)<2)
    return
end

pt1 = 1;
pt2 = length(arr);

while(pt1 < pt2)
    if(arr(pt1) + arr(pt2) == target)
        result = [result; [arr(pt1), arr(pt2)]];
        prev = pt1;
        while( arr(prev)== arr(pt1) && pt1 <= length(arr))
            pt1 = pt1+1;
        end
    elseif(arr(pt1) + arr(pt2) < target)
        prev = pt1;
        while( arr(prev)== arr(pt1) && pt1 < pt2)
            pt1 = pt1+1;
        end
    else
        next = pt2;
        while( arr(next)== arr(pt2) && pt1 < pt2 )
            pt2 = pt2-1;
        end
    end
    
end

return
end

%% function of 3sum based on 2sum
function result = func3sum(arr, target)
result = [];
if( length(arr) <3 )
    return
end

arr = sort(arr);

for i = 1: length(arr)-2
    prev = i;
    sol = func2sum( arr(i+1:end) , target - arr(i));
    if(~isempty(sol))
        result = [result; [ arr(i)*ones( size(sol,1) ,1) ,sol ]];
    end
    while(arr(prev)==arr(i) && i< length(arr)-2 )
        i = i + 1;
    end
end

return
end

%% function of 3 sum using map (more space)
function result = func3sum_map(arr, target)
result = [];
if( length(arr) <3 )
    return
end
% arr = sort(arr); % no sorting is necessary
mymap = containers.Map('keyType','int32','valueType','any');
for i = 1: length(arr)
    if(~isKey(mymap, arr(i)))
        mymap(arr(i)) = i;
    else
        idx=values(mymap, {arr(i)});
        mymap(arr(i)) = [idx{1},i];
    end
end

for i = 1: length(arr)
    for j = i+1 : length(arr)
        target1 = target - arr(i) - arr(j);
        
        if(~isKey(mymap, target1))
            continue
        end
        idx=values(mymap, {target1});
        for c1 = 1: length(idx{1})
            sol = sort([arr(i),arr(j),arr(idx{1}(c1))]);
            if(idx{1}(c1)~=i && idx{1}(c1)~=j && ( isempty(result) ||~ismember(sol, result,'rows')) )
                result=[result; sol];
            end
        end
        
    end
    
end

return
end