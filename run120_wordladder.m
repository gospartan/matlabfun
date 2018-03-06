first = 'hit';
last = 'cog';
dict =  ["hot","dot","dog","lot","log"];
% first ='toon';
% last = 'plea';
% dict = ["poon","plee","same","poie","plea","plie","poin"]

% str = str2mat(dict(1))

wordLadder(first, last, dict)

function res = wordLadder(first, last, dict)
import java.util.*;

res = -1;

q = LinkedList();
q.add( {first,1} );

len = length(first);

while(~q.isEmpty())
    cur = q.remove();
    str=cur(1);
    ct = cur(2);
    for i = 1 : len
        str1 = str;
        for j = 'a':'z'
            str1(i) = j;
            if(strcmp(last,str1))
                res = ct+1;
                return
            end
            if(~any(dict == string(str1) ) || strcmp(str,str1)  )
                continue
            end
            
            dict=dict(dict~=string(str1));
            q.add({str1,ct+1});
        end
    end
end


return
end