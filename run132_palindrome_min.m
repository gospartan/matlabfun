str='aasdfggdfsdfsfsdadgdsagdddddddfgdggfdfsfsfdsfb';

% tic
% list = palindrome(str);
% toc
% num_of_partitions = length(list)
% mincuts = intmax;
% for i=1:length(list)
%     list{i};
%    mincuts = min ( mincuts,sum(list{i}=='\'));
% end
% mincuts
tic
palindrome_mincuts(str)
toc
tic
palindrome_mincuts_dp(str)
toc
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

%%
function num = palindrome_mincuts(str)
len = length(str);
if(isempty(str) || len==1 || isPalindrome(str))
    num = 0;
    return
end

num_cur = intmax;
for i = 1: len-1
    if(isPalindrome(str(1:i)) )
        num_cur = min(num_cur, 1 +  palindrome_mincuts(str(i+1:end )));
    end
end
num = num_cur;
return
end

function flag = isPalindrome(str)
flag = strcmp(str, fliplr(str));
return
end
%%
function num = palindrome_mincuts_dp(str)
len = length(str);
if(isempty(str) || len==1 || isPalindrome(str))
    num = 0;
    return
end

dp = false*zeros(len+1,len+1);
dp1 = len*ones(1,len);
for i = len:-1:1
    for j = i : len
        dp(i,j+1) = (i==j)||(j-i==1 && str(i)==str(j)) || (j-i>1 && str(i)==str(j)&&dp(i+1,j));
    end
end

dp1(1) = 0;
for i = 2 : len
    dp1(i) = intmax*(1- dp(1, i+1));  %isPalindrome(str(1:i))
    for j = 1: i-1
%          dp(j+1, i+1) 
%          isPalindrome(str(j+1:i))
   
        if(  dp(j+1, i+1) ) %isPalindrome(str(j+1:i))
            dp1(i) = min (dp1(i), 1 + dp1(j));
        end
    end
    
end




num = dp1(len);
return
end