clear
clc
arr=[1,2,2,3,3,4,5,5,5,5,5,10,1, 35,6,7,7,74,4];

tic
[sets3, ct] = subsets_it(arr);
toc
% sets{1:ct}

%%
function [sets, ct] = subsets_it(arr)
arr = sort(arr);


sets{1} = [];
ct =  1;
ct_sub = 1;
prev = 0;
for i = 1: length(arr)
    if(arr(i)==prev)
        for j = 1: ct_sub
            sets{ct+j,1} = [arr(i),sets{ct - ct_sub+j,1}] ;
        end
        ct = ct + ct_sub;
    else
        ct_sub = ct;
        for j = 1: ct
            sets{ct + j,1} = [arr(i),sets{j,1}] ;
        end
        ct = 2*ct;
    end
    
    prev = arr(i);
end

return
end
