n = 9;
mat = zeros(n,n);
mat = [1     2     3     4     5     6     7     8     9
     2     1     4     3     6     5     8     9     7
     3     4     1     2     7     8     9     6     5
     4     3     2     1     8     9     5     7     6
     5     6     7     8     9     1     2     4     3
     6     5     8     9     1     7     3     2     4
     7     8     9     6     2     3     4     5     1
     8     9     5     7     3     4     6     1     2
     9     7     6     5     4     2     1     3     8];

mask = randi([0,1],9,9);
mat1 = mat.*mask
mask = randi([0,1],9,9);
mat1 = mat1.*mask

tic
mat2 = solveSudoku(mat1)

norm(mat2-mat)
toc
%%
function [ mat, flag ]= solveSudoku(mat)
[row, col]=findFirstBlankCell(mat);

if(row > 9)
    mat = mat;
    flag = true;
    return
end

for i = 1: 9
    if(isValid(mat,row, col, i))
        mat(row, col) = i;
        [mat, flag] = solveSudoku(mat);
        if(flag)
            return
        end
        mat(row,col) = 0;
    end
end

flag =false;
return
end

function [row, col]=findFirstBlankCell(mat)

zerosets = (find((mat)==0));
if(~isempty(zerosets))
    col = floor( (zerosets(1)-1)/9 ) +1;
    row = mod(zerosets(1)-1,9)+1;
    return
end
row = size(mat,1)+1;
col = size(mat,1)+1;
% for i = 1:size(mat,1)
%     for j = 1:size(mat, 1)
%         if(mat(i,j)==0)
%             row = i; 
%             col = j;
%             return
%         end
%     end
% end
return
end

function flag = isValid(mat,row,col,value)
if(any(mat(row,1:9)==value )) 
    flag = false;
    return
end

if(any( mat(1:9, col)==value))
    flag = false;
    return
end

idx1 = floor( (row-1)/3) ;
idx2 = floor( (col-1)/3) ;
if(any( mat(3*idx1+[1:3], 3*idx2+[1:3]) ==value ))
    flag = false;
    return
end
flag = true;
return
end