str='aaaaaaaaaaaaa';

tic
list = palindrome(str);
toc
num_of_partitions = length(list)
% for i=1:length(list)
%     list{i}
% end

tic
list = palindrome_dfs(str);
toc
num_of_partitions = length(list)
% for i=1:length(list)
%     list{i}
% end

% global dp;
% dp = containers.Map('keyType','char','valueType','any');
% tic
% list = palindrome_dp(str);
% toc
% num_of_partitions = length(list)
% for i=1:length(list)
%     list{i}
% end
%% function
function list = palindrome(str)
if(isempty(str))
    list={};
    return
end
len =length(str);
if(len==1)
list{1} = str;
end

% general case
list={};
if(isPalindrome(str))
    list = [list, str];
end
for i = 1 : len-1
    if(isPalindrome(str(1:i)))
    list_right = palindrome(str(i+1:end));
 
        for k = 1: length(list_right)
            list = [list, strcat(str(1:i) ,'\',list_right{k} )];
        end

    end
end

return
end

function list = palindrome_dfs(str)
if(isempty(str))
    list = {};
    return
end

list ={};
sol =[];
list = dfs(str, 1, list, sol);
return
end

function list = dfs(str, n, list, sol)
if(n>length(str))
    list = [list;sol];
else
    for i = n: length(str)
        if( isPalindrome(str(n:i)) )
            sol = [sol,str(i)];
            list = dfs(str,i+1, list, sol);
            sol = sol(1:end-1);
        end
    end
end
return
end

function flag = isPalindrome(str)
flag = strcmp(str, fliplr(str));
return
end


%% dp based
function list = palindrome_dp(str)
global dp;

if(isKey(dp,str))
    list = values(dp,str);
    return
end

if(isempty(str))
    list={};
    return
end
len =length(str);
if(len==1)
list{1} = str;
end
% general case
list={};
if(isPalindrome(str))
    list = [list, str];
end
for i = 1 : len-1
    if(isPalindrome(str(1:i)))
        if(isKey(dp,str(i+1:end)))
            list_right = values(dp, str(i+1:end));
        else
            list_right = palindrome(str(i+1:end));
        end
 
        for k = 1: length(list_right)
            list = [list, strcat(str(1:i) ,'\',list_right{k} )];
        end

    end
end
dp(str) = list;
return
end