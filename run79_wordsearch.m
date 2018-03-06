a = ['abce';'sfcs';'adee'];
w = 'abcces';
wordSearch(a,w)

function res = wordSearch(a,w)
if(isempty(w))
    res = true;
    return
end

if(isempty(a))
    res = false;
    return
end

if(numel(a)<length(w))
    res = false;
    return
end

[m,n] =size(a);

for i = 1:m
    for j = 1:n
        res = dfs(i,j,a, w, 1);
        if(res)
            return
        end
    end
end

return
end

function res = dfs (i,j, a, w, k)

if(i>size(a,1) || i < 1 || j <1 || j>size(a,2) || a(i,j)~=w(k))
    res = false;
    return
end
if(k==length(w))
    res = true;
    return
end
cur = a(i,j);
a(i,j) = 0;
res = dfs(i+1,j,a,w,k+1)|| dfs(i-1,j,a,w,k+1) || dfs(i,j-1,a,w,k+1) || dfs(i,j+1,a,w,k+1);
a(i,j) = cur;
return
end