

a = randi([0,1],[5,5]);
a=ones(5,5);
a(1,1)=0;
a
tic
 b = distMatrix(a)
 toc
%%
function res = distMatrix (a)
import java.util.*;
[m, n ] = size(a);

q= LinkedList();

  for j = 1:n
for i = 1: m
        if(a(i,j)==0)
            q.add([i,j]);
        else
            a(i,j) = n*m+1;
        end
    end
  end
  
  next=[ 0 1; 0 -1; 1 0; -1 0].';
  
  while(~q.isEmpty())
      pos = q.remove();
      for i = 1:4
          x = pos(1) + next(1,i);
          y = pos(2) + next(2,i);
          if(x<1 || x> m || y<1 || y>n || a(x,y) <= a(pos(1),pos(2)) )
              continue
          end
          a(x,y) = a(pos(1),pos(2)) + 1;
              q.add([x,y]);
      end
  end

% q.add([2,3]);
% q.add([1,2]);
% 
%  i = q.peek()
%  j = q.remove()
%  i=q.peek()

 res =a;
return
end