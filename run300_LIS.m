% arr = [10, 9, 2, 5, 3, 7, 101, 18]

% arr= randi([-10, 10], [1 ,10])
arr=[1 1 2 2 3 3 -5 9]

% get the numer
tic
res = longestIncreasingSub(arr)
toc

tic
[result, res] = longestIncresingSub1(arr)
toc


% get the subsequence

%% function
function res = longestIncreasingSub(arr)
res = 0;
if(isempty(arr))
    return
end
if(length(arr)==1)
    res = 1;
    return
end
dp = ones(1, length(arr));
for i = 2 : length(arr)
    tmp = 0;
    for j = 1 : i-1
        if(arr(j) < arr(i) )
            tmp = max(tmp, dp(j)) ;
        end
    end
    
    dp(i) = tmp + 1;
end
res = max(dp);
return
end

%% function, output all the possible longest subsequences, with no duplications
function [result, num] = longestIncresingSub1(arr)
num = 0;
result = [];
if(isempty(arr))
    return
end

dp = ones(1, length(arr));
% result = mat2cell(arr,[1],ones(1,10));
dp2 = num2cell(arr);

for i = 2 : length(arr)
    tmp = 0;
    for j = 1: i -1
        if(arr(j)< arr(i))
            tmp = max(tmp, dp(j));
        end
    end
    dp(i) = tmp + 1;
    
    %% start to work with actual subsequences
    if(tmp == 0)
        continue
    end
    
    for j = 1 : i-1
        if(arr(j)<arr(i) && tmp == dp(j))
            dp2{i} = [ dp2{j} , arr(i)*ones( size(dp2{2},1) ,1) ];
        end
    end
    
    dp2{i} = unique(dp2{i}, 'rows'); % can be done earlier
end

[num, loc] = max(dp);
idx = find(dp==num);
for i = 1:length(idx)
    result = [result ; dp2{idx(i)}];
end
% to kick out when the array contains the same number, the first unique in
% the loop is not activated yet.
result = unique(result,'rows'); 
return
end