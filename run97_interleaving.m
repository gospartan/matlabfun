s1 = 'aaaaaaaaba';
s2 = 'aaaaaaaa';
s3 ='aaaaaaaaaaaaaaaaab';

global ct
ct = 0;
tic
isInterleaving(s1,s2,s3)
toc
tic
isInterleaving1(s1,s2,s3)
toc
%% function
function flag = isInterleaving (s1, s2, s3)
global ct
ct = ct +1;
if(isempty(s1))
    flag = strcmp(s2, s3);
    return
end
if(isempty(s2))
    flag = strcmp(s1, s3);
    return
end

if(~strcmp(sort([s1,s2]) , sort(s3)   ))
    flag = false;
    return
end

flag = (s3(1)==s1(1) && isInterleaving(s1(2:end),s2,s3(2:end))) || (s3(1)==s2(1) && isInterleaving(s1,s2(2:end),s3(2:end)));

return
end

function flag = isInterleaving1 (s1, s2, s3)
if(isempty(s1))
    flag = strcmp(s2, s3);
    return
end
if(isempty(s2))
    flag = strcmp(s1, s3);
    return
end

if(~strcmp(sort([s1,s2]) , sort(s3)   ))
    flag = false;
    return
end

l1 = length(s1);
l2 = length(s2);
l3 = length(s3);

dp = false*zeros(l3+1, l1+1);
dp(1,1) = true;
for i3 = 1:l3
    dp(i3+1, 1) = dp(i3+1, 1) && ( s2(i3)==s3(i3) ); 
    for i1 = 1:min(l1,i3)
        i2 = i3 - i1;
        if(i2 == 0)
            dp(i3+1, i1+1) = ( dp(i3, i1) && s1(i1)==s3(i3) );
        elseif(i2 <= l2)
            dp(i3+1, i1+1) = ( dp(i3, i1) && s1(i1)==s3(i3) ) || ( dp(i3, i1+1) && s2(i2)==s3(i3) );
        end
    end
end
flag = any( dp(l3+1,:) ==true);
return
end