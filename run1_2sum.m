% arr= [ 1 1 1 ];
% target = 2;
arr= randi([1,4],[1,7])
target = 5
result = func2sum(arr,target)

result = func2sum1(arr,target)

result = func2sum2(arr,target)
%% return one solution to the 2sum problem
function result = func2sum(arr,target)
result = [];
if(length(arr)<2)
    return
end
dp = containers.Map('KeyType','int32', 'ValueType', 'int32');

for i = 1 : length(arr)
    if(isKey(dp, target - arr(i)))
        idx = values(dp, { target - arr(i)} );
        result = [ i, idx{1} ];
        return
    else
        dp( arr(i) ) = i;
    end
end

return
end

%% return all the solutions to the 2sum problems (no duplications in the array)
function result = func2sum1(arr,target)
result = [];
if(length(arr)<2)
    return
end
dp = containers.Map('KeyType','int32', 'ValueType', 'int32');

for i = 1 : length(arr)
    if(isKey(dp, target - arr(i)))
        idx = values(dp, { target - arr(i)} );
        result =  [ result ; [ i, idx{1} ] ];
    else
        dp( arr(i) ) = i;
    end
end

return
end

%% return all the solutions to the 2sum problems (even there are duplications in the array)
function result = func2sum2(arr,target)
result = [];
if(length(arr)<2)
    return
end
dp = containers.Map('KeyType','int32', 'ValueType', 'any');
%dp = containers.Map([],[]);
arr1 = unique(arr);
for i = 1:length(arr)
    if(~isKey(dp, arr(i)))
        dp( arr(i) ) = [i];
    else
        dp(arr(i)) =  [dp(arr(i)), i];
    end
end

result_values=[];
for i = 1 : length(arr1)
    if(isKey(dp, target - arr1(i)))
        % will check out index later,[target/2, target/2] pair could be invalid
        result_values =  [ result_values ; [ arr1(i), target - arr1(i)] ];
    end
end

%% postprocessing
for i= 1:size(result_values,1)
    tmpcell = values(dp,{result_values(i,1)});
    idx1 = tmpcell{1};
     tmpcell = values(dp,{result_values(i,2)});
     idx2 =  tmpcell{1};

        for i1 = 1:length(idx1)
            for i2 = 1:length(idx2)
                if(idx1(i1) < idx2(i2))
                    result = [result;[idx1(i1),idx2(i2)]];
                end
            end
        end
end

return
end