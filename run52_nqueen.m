
n =5;
mat=[];
tic
mat = nqueens(n)
toc
%% 
function mat = nqueens(n)
if(n<4)
    mat = [];
    return
end
mat = [];
sol=[];
mat = nqueens_helper(n,1, sol, mat);

return
end

function mat = nqueens_helper(n, row, sol, mat)
if(row == n+1)
    mat = [mat; sol];
end

for col = 1 : n
if(isValid(sol, row, col, n))
    sol = [sol, col];
    mat = nqueens_helper(n, row+1, sol, mat);
    sol = sol(1:end-1);
end
end

return
end

function flag = isValid(sol, row, col, n)
if(isempty(sol))
    flag =true;
    return
end
for i= 1 : row-1

    if(sol(i)==col || abs(i-row)==abs(sol(i)-col))
        flag= false;
        return
    end
end
flag = true;
return
end