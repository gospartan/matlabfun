
t = 'sdfsfdsfsf';
s = 'sdfsfdsfsfsdfsfdsfsfsdfsfdsfsfsdfsfdsfsfsdfsfdsfsfsdfsfdsfsfsdfsfdsfsfsdfsfdsfsfsdfsfdsfsf';

tic
num = numDistinct(s,t)
toc


%% function
function num = numDistinct(s, t)
if(isempty(t))
    num = 1;
    return
end
if(length(t)>length(s))
    num = 0;
    return
end
n = length(s);
m = length(t);

dp = zeros(n+1, m+1);
dp(:,1) = 1;
for i = 1: n 
    for j = 1 :m
        dp(i+1, j+1) =  dp(i,j+1) +  dp(i,j)*(s(i)==t(j));
    end
end

num = dp(n+1,m+1);
return 
end