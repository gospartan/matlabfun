str = '93'
dict = {'~','\','abc','def','ghi','jkl','mno','pqrs','tuv','wxyz'};

sol='';
results={};
results = letterCombination(str, 1, dict, sol, results)
%%
function results = letterCombination(str, n, dict, sol, results)

if( any(str(:)<'0') || any(str(:)>'9') )
    results ={};
    return
end

if(n==length(str)+1)
    results = [results,sol];
    return
else
    for i = 1:length( dict{str(n)-'0'+1})
        sol = [sol,dict{str(n)-'0'+1}(i)];
        results = letterCombination(str, n+1, dict, sol, results);
        sol = sol(1:end-1);
    end
end

return
end