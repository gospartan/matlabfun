
n =10;
tic
ct = nqueens(n)
toc
%% 
function ct = nqueens(n)
if(n<4)
    mat = [];
    return
end
ct=0;
sol=[];
ct = nqueens_helper(n,1, sol, ct);

return
end

function ct = nqueens_helper(n, row, sol, ct)
if(row == n+1)
    ct = ct + 1;
    return
end

for col = 1 : n
if(isValid(sol, row, col, n))
    sol = [sol, col];
    ct = nqueens_helper(n, row+1, sol, ct);
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