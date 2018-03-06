
 totalpath(9,20)
%% function
function sum = totalpath(m,n);
dp = zeros(m, n);
dp(m,:) = 1;
dp(:,n) = 1;

for i = (m-1):-1:1
    for j = (n-1):-1:1
        dp(i,j) = dp(i+1,j) + dp(i,j+1);
    end
end

sum = dp(1,1);
return
end