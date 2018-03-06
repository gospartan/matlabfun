%%run120

mat = randi(4,4)

tic
n = minimumTotal(mat)
toc

function fval = minimumTotal(mat)

minval = mat(size(mat,1),:);

for i = size(mat, 1)-1:-1:1
    for j = 1: i 
        minval(j) = min( minval(j),  minval(j+1)) + mat(i,j)  ;
    end
end

fval = minval(1);
return
end 