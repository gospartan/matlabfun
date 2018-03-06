
grid = randi(5,5)

tic
num = minPathSum(grid)
toc
tic
num = minPathSum1(grid)
toc
%%
function num = minPathSum(grid)
if(isempty(grid))
    num = 0;
end
[m, n]= size(grid);

dp = sum(sum(grid))*ones(m+1,n+1);
dp(m:m+1,n:n+1) = 0;
for i= m:-1:1
    for j = n:-1:1
        dp(i,j) = grid(i,j) + min( dp(i,j+1),dp(i+1,j) );
    end
end

num = dp(1,1);
return 
end

function num = minPathSum1(grid)
if(isempty(grid))
    num = 0;
end
[m, n]= size(grid);

dp = sum(sum(grid))*ones(2, n+1);
dp(1, n+1) = 0;
dp(2, n) = 0;
for i= m:-1:1
    for j = n:-1:1
        dp(1,j) = grid(i,j) + min( dp(1,j+1),dp(2,j) );
    end
    dp(2,:) = dp(1,:)   ;
    dp(1, n+1) = intmax;
end

num = dp(1);
return 
end
