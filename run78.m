arr=[1 :10];
tic
[sets1, ct] = subsets_bt(arr);
toc
tic
[sets2, ct] = subsets_bt_pass(arr);
toc
tic
[sets3, ct] = subsets_it(arr);
toc
% sets{1:ct}

%% 
function [sets, ct] = subsets_it(arr)
 arr = sort(arr);
 
 ct = 2^length(arr);
 sets = cell(ct,1);
 
 sets{1} = [];
 ct =  1;
 for i = 1: length(arr)
     for j = 1: ct
     sets{ct + j,1} = [arr(i),sets{j,1}] ;
     end
     ct = ct * 2;
 end
 
 return
end 

%%
function [ sets, ct]= subsets_bt(arr)
global arr1
 arr1 = sort(arr);

 [subsets, ct]= helper(2);
sets=cell(2*ct,1);
 for i = 1:ct
     sets{i,1} = [[], subsets{i,1}];
 end
 for i = 1:ct
     sets{ct+i,1} = [[arr1(1)], subsets{i,1}];
 end
 
ct = ct*2;

return 
end

function [sets, ct]=helper(m)
global arr1
if (m==length(arr1))
ct = 2;
sets{1,1}=[];
sets{2,1}=[arr1(m)];
return
end

[subsets, ct] = helper(m+1);
sets=cell(2*ct,1);

 for i = 1:ct
     sets{i,1} = [[], subsets{i,1}];
 end
 for i = 1:ct
     sets{ct+i,1} = [[arr1(m)], subsets{i,1}];
 end

 ct = 2*ct;
return
end 

%%
function [ sets, ct]= subsets_bt_pass(arr)

 arr1 = sort(arr);

 [subsets, ct]= helper_pass(2,arr1);
sets=cell(2*ct,1);
 for i = 1:ct
     sets{i,1} = [[], subsets{i,1}];
 end
 for i = 1:ct
     sets{ct+i,1} = [[arr1(1)], subsets{i,1}];
 end
 
ct = ct*2;

return 
end

function [sets, ct]=helper_pass(m, arr1)

if (m==length(arr1))
ct = 2;
sets{1,1}=[];
sets{2,1}=[arr1(m)];
return
end

[subsets, ct] = helper_pass(m+1, arr1);
sets=cell(2*ct,1);

 for i = 1:ct
     sets{i,1} = [[], subsets{i,1}];
 end
 for i = 1:ct
     sets{ct+i,1} = [[arr1(m)], subsets{i,1}];
 end

 ct = 2*ct;
return
end 