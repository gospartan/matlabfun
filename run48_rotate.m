% mat =[ 1 2 3; 4 5 6; 7 8 9]
mat =rand(7);
mat1 = rotatematrix(mat);
mat2 = fliplr(mat.');
norm(mat1-mat2)
function mat = rotatematrix(mat)
n =size(mat,2);
for i = 1:n/2
    for j = i : (n-i)
        tmp1 = mat(j, n-i+1);
        mat(j, n-i+1) = mat(i,j);
        
        tmp2 = mat(n-i+1, n-j+1);
        mat(n-i+1, n-j+1) = tmp1;
        
        tmp1 = mat(n-j+1,i);
        mat(n-j+1,i) = tmp2;
        
        mat(i,j ) = tmp1;
    end
end
return
end