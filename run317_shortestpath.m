% a= randi([0,1],[4,4])
a = [ 1 0 2 0; 0 0 0 1; 1 1 0 1 ]
[res,row,col,cnt]= shortestDistancefromBuildings(a)

%%
function [res,row,col,cnt ]= shortestDistancefromBuildings(a)
import java.util.*;
res = -1;
row =[];
col =[];
flag = 0;
[m,n] = size(a);
next = [0,1;0 ,-1;1,0;-1,0].';
cnt = zeros(m,n);

spot=[0,0];
       
for i = 1: m
    for j = 1:n
        if(a(i,j)~=1)
            continue
        end
       q = LinkedList(); 
       q.add([i*n+j, 0]);

       res = intmax;
       
       while( ~q.isEmpty())
           pos = q.remove();
           for k = 1:4
              
               x = floor((pos(1)-1)/n) + next(1,k);
               y = mod( pos(1)-1, n ) + 1 + next(2,k);
               
               if(x<1 ||x>m || y<1 ||y>n || a(x,y)~=flag)
                   continue
               end
                
               a(x, y) = a(x,y) - 1;
               cnt(x,y) = cnt(x,y) + pos(2) + 1;
               res = min(res, cnt(x,y));
               q.add([x*n+y,pos(2)+1]);
           end
       end

       flag = flag -1;
       
    end
end

if(res == intmax)
    res = -1;
end

[row,col]=find(cnt==res);
return
end