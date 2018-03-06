
s = '25525511135'

ip = restoreIP(s);
%%
function ip = restoreIP(s)
ip = {};
if(length(s)< 4 || length(s)>3*4 || any( s<'0' ) || any(s>'9') || s(1)=='0')
    return
end

sol=[];
ip = [];
ip = restoreIP_helper(s, 1, sol, ip )

return
    
end

%%
function ip = restoreIP_helper(s, idx, sol, ip)
if( length(sol)==4)
    if(idx==length(s)+1)
        ip = [ip;  sol];
    end
    return
end

    for i = idx: idx+3
        if(i<=length(s) && str2num(s(idx:i)) <256  && s(idx)~='0')
            
            sol = [sol,str2num(s(idx:i))];
            ip = restoreIP_helper(s,i+1, sol, ip);
            
               sol = sol(1:end-1);
        end
    end

    return
end