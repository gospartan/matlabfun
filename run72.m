%% driver script
str1 = 'Susfsdfsddfsfssdfsfdgjgkhgkh,rtsfdfdfddfsnday';
str2 = 'Sfgdgdsdfsfsfddsfgsag6unsdfsfsnydgdgday';
tic
dist = mindist(str1, str2)
toc
%%  function
function dist = mindist(str1, str2)
if(isempty(str1)||isempty(str2))
    dist = max(length(str1),length(str2));
    return
end

dp = zeros(length(str1)+1, length(str2)+1);

for j = 0 : length(str2)
    for i = 0: length(str1)
        if(j==0)
            dp(i+1,j+1) = i;
        elseif(i==0)
            dp(i+1,j+1) = j;
        elseif(str1(i)==str2(j))
            dp(i+1,j+1) = dp(i,j);
        else
            dp(i+1,j+1) = min([ dp(i,j+1),dp(i,j),dp(i+1,j)])+1;
        end
    end
end
dist = dp(length(str1)+1,length(str2)+1);
return
end

function dist = mindist1(str1, str2)
if(isempty(str1)||isempty(str2))
    dist = max(length(str1),length(str2));
    return
end

dp = zeros(length(str1)+1);

for j = 0 : length(str2)
    for i = 0: length(str1)
        if(j==0)
            dp(i+1,j+1) = i;
        elseif(i==0)
            dp(i+1,j+1) = j;
        elseif(str1(i)==str2(j))
            dp(i+1,j+1) = dp(i,j);
        else
            dp(i+1,j+1) = min([ dp(i,j+1),dp(i,j),dp(i+1,j)])+1;
        end
    end
end
dist = dp(length(str1)+1);
return
end
%% helper