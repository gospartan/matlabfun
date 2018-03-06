str=[1:10];
target = 5;

tic
arr=allTargetSubsets(str,target);
toc
for i=1:length(arr)
arr{i}
end
%% function
function arr = allTargetSubsets(str,target)
if(isempty(str))
    arr = {};
    return
end

str = sort(str);

arr = {};
list=[];
arr = allTargetSubsetsHelper(str,1, target, list, arr);
end 

function arr = allTargetSubsetsHelper(str, start,  target, list, arr)
if(target< 0)
    return;
elseif(target == 0)
    arr = [arr; list];
else
    for i = start:length(str)
        list = [list,str(i)];
        arr = allTargetSubsetsHelper(str, start+1, target-str(i), list, arr);
        list = list(1:end-1);
    end
end

return
end