m= 15;
tic
num_bst(m)
toc
tic
num_bst_rc(m)
toc
function n = num_bst(m)

if(m==1)
    n = 1;
    return
end
if(m==2)
    n = 2;
    return
end
dp = zeros(m+1,1);

dp(0+1) =1;
dp(1+1) =1;
dp(1+2) = 2;
for i=3:m
    for j=1:i
        dp(i+1) = dp(i+1) + dp(j)*dp(i-j+1); 
    end
end

n = dp(m+1);
return
end

function num = num_bst_rc( m)
if(m==0)
    num = 1;
    return
end
if(m==1)
    num = 1;
    return
end
if(m==2)
    num = 2;
    return
end
num =0;
for i = 0: m-1
num = num + num_bst_rc(i)*num_bst_rc(m-i-1);
end
return
end