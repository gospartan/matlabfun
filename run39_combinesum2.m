str=[1,1:10 ];
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
    return
else
    for i = start:length(str)
%         num_i = sum(str==str(i));
%         for j = 1:num_i
%         list = [list,str(i)*ones(1,j)];
%         arr = allTargetSubsetsHelper(str, i+num_i, target-j*str(i), list, arr);
%         list = list(1:end-num_i);
%         end
%         i = i+ num_i - 1;

        if(i> start && str(i)== str(i-1))
            continue
        end
        list = [list,str(i)];
        arr = allTargetSubsetsHelper(str, i+1, target-str(i), list, arr);
        list = list(1:end-1);
    end
end

return
end