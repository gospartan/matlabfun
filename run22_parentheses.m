n = 3;
results = generateParentheses(n);

for i=1: length(results)
    results{i}
end

function results = generateParentheses(n)
if(n==0)
    results={''};
    return
end
if(n==1)
    results={'()'};
    return
end

results = {};
sol='';
results = helper( n, 0,0, sol, results );

return
end

function results= helper(n, left, right,sol, results)

if(right == n)
    results = [results, sol];
    return
end

    if(left < n)
        results= helper(n, left+1, right,[sol, '('], results);
    end
    
    if(right<left)
         results= helper(n, left, right+1,[sol, ')'], results);
    end

return
end