function    result=recopyFields(source,target)
%% function result=recopyFields(source,target)
% e.g.: params=recopyFields(params,defaultParams);
result=target;
NFs=fieldnames(source);
for is=1:length(NFs)
    result.(NFs{is}) = source.(NFs{is});
end
