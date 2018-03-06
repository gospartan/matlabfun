mat = randi([0,1],[4,5])

result = NumberofIsland(mat)

function res = NumberofIsland(mat)

res = 0;
[m,n] = size(mat)

for i = 1: m
    for j = 1:n
        if(mat(i,j)==1)
        
            mat = dfs(mat,i,j);
            res = res + 1;
        end
    end
end

return
end

function mat = dfs (mat,i,j)
if(i<1||j<1||i>size(mat,1)||j>size(mat,2) || mat(i,j) == 0 )    
    return
end

mat(i,j) = 0;
mat = dfs(mat,i+1,j);
mat = dfs(mat,i-1,j);
mat = dfs(mat,i,j-1);
mat = dfs(mat,i,j+1);

return
end