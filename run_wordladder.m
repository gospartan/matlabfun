close all
% first = 'hit';
% last = 'cot';
% dict =  ['hot';'dot';'dog';'lot';'log'];
% 
letters=['a':'z'];
N= 3;
first = letters(randi([1,26],[1,N])) ;
last = letters(randi([1,26],[1,N])) ;
dict =[];
for i=1:1000
    dict = [dict;letters(randi([1,26],[1,N])) ];
end

%% make life easier
if(ismember(first, dict, 'rows'))
    disp('BAD START!')
    return
end
if(ismember(last,dict, 'rows'))
    disp('BAD END!')
    return
end

%% real business
dict = [first;dict;last];

tic
s = [];
t = [];
SUM = size(dict,2)-1;
for i = 1:size(dict,1)
    idx = find(sum(dict==dict(i,:),2)== SUM).';
    if(i==1 && isempty(idx))
        disp('NO NEXT for start node');
        return
        
    end
        if(i== size(dict,1) && isempty(idx))
        disp('NO NEXT for  end node');
        return
    end
    s = [s, i*ones(size(idx))];
    t = [t, idx];
end
toc
A = sparse(s,t,ones(size(s)));

spy(A)
% figure
G = graph(A);
% h= plot(G);
% h.NodeColor = 'r';

%% find out the shortest parth using matlab call
tic
[path,d] = shortestpath(G,1,size(A,1),'Method','unweighted')
toc
dict(path,1:end)
%% another diy approach
tic
[path1,d1]= shortestpath1(A,1,size(A,1))
toc
%% another diy approach
tic
[path1,d1]= shortestpath2(A,s,t,1,size(A,1))
toc
%%
function  [path,res] = shortestpath1(A, first, last)
import java.util.*;
res = 0;
n = size(A,1);
visited = zeros(1,n);
distance = zeros(1,n);

q = LinkedList();
q.add(first);
visited(first) = 1;
distance(first) = 1;
map = containers.Map('keyType','int32','valueType','int32');

while(~q.isEmpty())
    cur = q.remove();
    idx = find(A(cur,:)~=0);
    for i = 1:length(idx)
        if(visited(idx(i))==1)
            continue
        end
        distance(idx(i)) = distance(cur) + 1;
        q.add(idx(i));
        visited(idx(i)) = 1;
        map(idx(i)) = cur;
    end
end

res = distance(last);
cur = last;
path = [last];
while(isKey(map, cur))
    path = [map(cur),path];
    cur = map(cur);
end

% path= fliplr(path);

return
end

%% method 3
function [path, res] = shortestpath2 (A,s,t, first, last)
res = -1;
path = [];
n = size(A,1);

edge = [s;t];
% edge = edge(:,s < t);
map = containers.Map('keyType','int32','valueType','int32');

ct = 0;

dist = (n+1)*ones(1,n);
dist(first) = 1;
for i = 1: n
    for j = 1:size(edge,2)
     
        if( dist(edge(1,j)) + 1 <  dist(edge(2,j)) )
            map(edge(2,j)) = edge(1,j);
        end
           dist(edge(2,j)) = min(dist(edge(1,j)) + 1, dist(edge(2,j)));
    end
end
    
    
    
    if(dist(last)==n+1)
        res = -1;
        return
    end
    
    cur = last;
path = [last];
while(isKey(map, cur))
    path = [map(cur),path];
    cur = map(cur);
end
    
    res = dist(last);

end

