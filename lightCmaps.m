function cmapslight=lightCmaps(cmaps,factor)
%% function cmapslight=lightCmaps(cmaps,factor)
try
    factor;
catch
    factor=0.5;
end
cmapslight=cmaps*(1+factor);

hm=size(cmaps,1);
for ih=1:hm
    if sum(cmaps(ih,:))==0
        cmapslight(ih,:)=factor*[1,1,1];
    end
end

cmapslight(cmapslight>1)=1;

