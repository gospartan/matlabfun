clc
clear
%% driver
str = 'likewhichlikewhichlikewhichlikewhichlikewhichlikewhichlikewhichlikewhichlikewhichlikewhichlikewhichlikewhichlikewhichlikewhichlikewhichlikewhich';
dict={'i','like','u','which','is','wrong', 'thing','test','sfds','i','like','u','which','is','wrong', 'thing','test','sfds','i','like','u','which','is','wrong', 'thing','test','sfds','i','like','u','which','is','wrong', 'thing','test','sfds'};
% first approach
tic
flag = wordBreaker(str, dict)
toc

% 2nd approach
% tic
% flag = wordBreaker_dp(str, dict)
% toc

% 3rd
% global mymap
%  mymap = containers.Map('KeyType','char', 'ValueType','logical');
% tic
% flag = wordBreaker_dp1(str, dict)
% toc

% 
tic
global mymap1
mymap1 =containers.Map('KeyType','char', 'ValueType','logical');
flag = wordBreaker_dp2( str, dict)
toc

tic
flag = wordBreaker_dp3( str, dict)
toc
%% function
function flag = wordBreaker(str, dict)

flag = false;
if(isempty(str))
    flag = true;
    return
end

if(length(str)==1)
    flag = any(strcmp(dict,str));
    return
end

if(any(strcmp(dict,str)))
    flag = true;
    return
end

for i = 1: length(str)-1
    substr = str(1:i);
    if( any(strcmp(dict,substr)) && wordBreaker(str(i+1:end), dict) )
        flag = true;
                return
    end
end


return
end
%%
function flag = wordBreaker_dp(str, dict)
persistent map;

if ~isempty(map)
    map = containers.Map('KeyType','char', 'ValueType','logical');
end

if(isKey(map,str))
flag = map(str);
return
end

flag = false;
if(isempty(str))
    flag = true;
    map(str) = flag;
    return
end

for i = 1: length(str)
    if( any(strcmp(dict, str(1:i) )) && wordBreaker_dp(str(i+1:end), dict) )
        flag = true;
        map(str) = flag;
        return
    end
end

flag = false;

 map(str) = flag;


return
end
%%
function flag = wordBreaker_dp1(str, dict)
global mymap glb
length(mymap)
glb
if(isKey(mymap,str))
flag = mymap(str);
return
end
if(isempty(str))
    flag = true;
    mymap(str) = flag;
    return
end

for i = 1: length(str)
    if( any(strcmp(dict, str(1:i) )) && wordBreaker_dp1(str(i+1:end), dict) )
        flag = true;
        
         mymap(str) = flag;
         glb = length(mymap);
        return
    end
end
flag = false;
 mymap(str) = flag;
return
end

%%
function flag = wordBreaker_dp2( str, dict)
global mymap1

% in map
if(isKey(mymap1,str))
disp('haha')
flag = mymap1(str);
return
end
% empty
if(any(strcmp(dict,str)))
    flag = true;
    mymap1(str) = flag;
    return
end

for i = 1: length(str)-1
    if( any(strcmp(dict, str(i+1:end) )) )
        flag1=  wordBreaker_dp2(str(1:i), dict); 
        if( flag1 )
          flag = true;    
          mymap1(str) = flag;
        return
        end
    end
end
flag = false;
 mymap1(str) = flag;
return
end

%%
function flag = wordBreaker_dp3(str, dict)
len = length(str);

if(any(strcmp(dict, str)))
flag = true;
return
end

dp = false*zeros(len+1,1);
dp(1) = true;

for i= 1 : len
    for j = 1: i
        if(dp(j) && any(strcmp( dict, str(j:i)) )  )
            dp(i+1) = true ;
            break
        end
    end
end
flag = dp(len+1);
return
end