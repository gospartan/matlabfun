clear
clc
%% driver with tests and randomly generate tests
Ns = 10;
symbols = ['a':'z'];
for i=1: Ns
    randlen = randi([1, 20],1);
    randpos=randi([1,26], [1, randlen]);
    strcell{i} = symbols(randpos);
end
%  strcell={'a','b','c','dd'};
%  strcell = {'with','examples','science'};
% 
% target = 'abccdddda';
% target = 'thehat';
    randlen = 80;
    randpos=randi([1,26], [1, randlen]);
    target = symbols(randpos);

% strcell = {'owhqpzcnncxwludqglvf','miuzegs','zzqwkqzo','smqxfkzkrxzqcaqoztr'};
% target = 'hahafs';

%% test
% first approach using integer programming
tic
num_of_stickers = minStickers(strcell, target)
toc
% second appraoch using dynamic programing
tic
num_of_stickers = testfunc_stickers(strcell, target)
toc

%% function
function res = minStickers (strcell, target)

if(isempty(target))
    res = 0;
    return
end

tgt = unique(target);
tgtCounter = sum(tgt==target',1);
srcCounter = zeros(length(tgt), length(strcell) );
for i = 1: length(strcell)
    tmp1 = sum(tgt==strcell{i}',1);
srcCounter(:, i) = tmp1;
end


len = length(strcell);
[x,fval,EXITFLAG] = intlinprog(ones(1,len), [1:len], -srcCounter, -tgtCounter,[],[],zeros(1,len),[]);

res = fval;
% EXITFLAG;
if(isempty(res))
    res = -1;
end
return
end

%% popular dumb way using dynamic programming
function minval =  testfunc_stickers(strcell, target)

Ns = length(strcell);
arr_s = zeros(26, Ns);

for j = 1 : Ns
    for i=1 : length(strcell{j})
        arr_s(strcell{j}(i)-'a'+1 ,j) = arr_s(strcell{j}(i)-'a'+1 ,j) + 1;
    end
end
dp = containers.Map('KeyType','char','ValueType','int32');
dp('') = 0;
minval = helper(dp, arr_s, target) ;
return
end

function minval = helper(dp, s, target)
% target
% pause
if(isKey(dp, target))
    minval = dp(target);
    return
end

val = intmax;
arr_t = zeros(26,1);

for i=1: length(target)
    arr_t(target(i)-'a'+1 ,1) = arr_t(target(i)-'a'+1 ,1) + 1;
end

for i = 1: size(s, 2)
    if(s( target(1)-'a'+1,i) == 0)
        continue
    end
    
    target1 = '';
    for j = 1: 26
        if( (arr_t(j,1)-s(j,i)) > 0)
            tmpstr ='';
            tmpstr(1: (arr_t(j,1)-s(j,i))) = char('a'+j-1);
            target1 =  strcat(target1, tmpstr);
        end
    end
    
    tmp = helper(dp, s, target1);
    if(tmp~=-1)
        val = min([tmp+1, val]);
    end
end
if(val==intmax) 
    dp(target)=-1;
else
    dp(target) = val;
end
minval = dp(target);
return
end