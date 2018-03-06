n = 10;
k=4;
% tic
% mat = combine(10,9)
% toc
% tic
% mat = nchoosek([1:n],k);
% toc

tic
mat = combine_bt(n,k);
toc
size(mat,1)

tic
mat = combine_bt1(n,k);
toc
size(mat,1)
%% function combine
%  return mat where each row is one k-subset of 1-n
function mat = combine(n, k)
if(k>n)
    mat = [];
    return
end

if(k==1)
    mat = [1:n].';
    return
end

for i = 1:n
mat = combine(n-1, k-1);
mat=[mat, n*ones(size(mat,1),1) ];
if((n-1) >= k )
mat2 = combine(n-1, k);
mat = [mat; mat2];
end

end

return
end
%%
function mat = combine_bt(n, k)
global arr

if(k>n)
    mat = [];
    return
end

if(k==1)
    mat = [1:n].';
    return
end

arr = [];
list=[];
combine_helper(n, k, 1, list);
mat = arr;
return
end
function combine_helper(n,k, start, list)
global arr
if(k==0)
    arr =[arr; list];
else
    for i = start:1:n
        list = [list,i];
        combine_helper(n,k-1, i+1,list);
        list = list(1:end-1);
    end
end

return
end

%% 
function arr = combine_bt1(n, k)


if(k>n)
    arr = [];
    return
end

if(k==1)
    arr = [1:n].';
    return
end

arr = [];
list=[];
arr = combine_helper1(n, k, 1, arr, list);

return
end
function arr = combine_helper1(n,k, start, arr, list)
if(k==0)
    arr =[arr; list];
else
    for i = start:1:n
        list = [list,i];
        arr = combine_helper1(n,k-1, i+1, arr, list);
        list = list(1:end-1);
    end
end
return
end

%% function combine
%  return mat where each row is one k-subset of 1-n
function mat = combine_iterative(n, k)

if(k>n)
    mat = [];
    return
end

if(k==1)
    mat = [1:n].';
    return
end

if(k==n)
    mat = [1:n];
    return
end

mat = [];
for i = 1: n
    nrow = size(mat, 1);
    for j = i: nrow
        
    end
end


return
end
%%
function mat = combine1(n, k)
if(k>n)
    mat = [];
    return
end

if(k==1)
    mat = [1:n].';
    return
end
i=0;
p = zeros(1, k);

while (i>=0)
end
    

return
end