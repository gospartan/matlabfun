str = '11111';

tic
numDecodings(str)
toc

tic
numDecodings1(str)
toc
%% function

function num = numDecodings(str)
if(isempty(str))
    num =0;
    return
end

    if(str(1)>'9' || str(1)<'0')
        num = 0;
        return
    end
    
len = length(str);
dp = zeros(1,len+1);


dp(1) = 1;
dp(2) = 1;

for i = 2:len
    if(str(i)>'9' || str(i)<'1')
        num = 0;
        return
    end
    
    if(str(i-1)>'2'  || (str(i-1)=='2' && str(i)>'6' ))
        dp(i+1) = dp(i);
    else
        dp(i+1) = dp(i) + dp(i-1);
    end

end
num = dp(len+1);
return
end

%%
function num = numDecodings1(str)
if(isempty(str))
    num =0;
    return
end

    if(str(1)>'9' || str(1)<'0')
        num = 0;
        return
    end
    
len = length(str);


dp1 = 1;
dp2 = 1;

for i = 2:len
    if(str(i)>'9' || str(i)<'1')
        num = 0;
        return
    end
    
    if(str(i-1)>'2'  || (str(i-1)=='2' && str(i)>'6' ))
        num = dp2;
    else
       num = dp1 + dp2;
    end
    
    dp1 = dp2;
    dp2 = num;

end
return
end