clc
clear

n =10;
m = 100;
a1 = sort(randi([0,100],[1,n]));

a2 = sort(randi([0,100],[1,m]));

a0 = sort([a1,a2]);

a1 = [a1,zeros(1, m)];

i = n;
j = m;
for k = n+m : -1:1
    if(i==0)
        a1(1:j) = a2(1:j);
        break
    end
    if(j==0)
        break
    end
    if(a1(i)>=a2(j))
        a1(k) = a1(i);
        i = i -1;
    else
        a1(k) = a2(j);
        j= j -1;
    end
end
norm(a1-a0)

