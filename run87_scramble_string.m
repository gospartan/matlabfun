
str1='greatfgfg'
str2=str1(randperm(length(str1)))
isScramble(str1, str2)
%% function
function flag = isScramble(str1, str2)
if (length(str1) ~= length(str2))
    flag = false;
    return
end
if(str1==str2)
    flag = true;
    return
end
if(~strcmp(sort(str1),sort(str2)) )
    flag =false;
    return
end
if(length(str1)==1 && str1==str2)
    flag= true;
    return
end

len = length(str1);
for i = 1: len-1
    if( (isScramble(str1(1:i), str2(1:i)) && isScramble(str1(i+1:end), str2(i+1:end))) ...
            ||( isScramble(str1(1:i), str2( (len-i+1):end)) && isScramble(str1(i+1:end), str2(1:(len-i)  ) ) ) )
        flag = true;
        return
    end
end

flag = false;
return
end