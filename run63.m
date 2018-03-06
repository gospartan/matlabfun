m = 5;
n = 5;

obs = randi([0 1],[m,n]);
obs(1,1) = 0;
obs(m,n) = 0;

obs = zeros(m,n);
obs(randi([1,m],1),randi([1,n],1)) =1;
obs(randi([1,m],1),randi([1,n],1)) =1;
obs(randi([1,m],1),randi([1,n],1)) =1;

obs(1,1) = 0;
obs(m,n) = 0;
obs

 totalpath(m,n,obs)
%% function
function sum = totalpath(m,n,obs);
dp = zeros(m, n);
dp(m,n) = 1;
for i= (n-1):-1:1
    dp(m, i) =   dp(m, i+1 ) * (1-obs(m,i));
end

for i= (m-1):-1:1
    dp(i, n) =   dp(i+1, n ) * (1 - obs(i, n) );
end
for i = (m-1):-1:1
    for j = (n-1):-1:1
        dp(i,j) =  (dp(i+1,j) + dp(i,j+1))*(1-obs(i,j));
    end
end

sum = dp(1,1);
return
end