function out = compareStructs(A,B,params)
% function out = compareStructs(A,B,params)

nfA=fields(A);
nfB=fields(B);
out=true;
if ~length(nfA)==length(nfB)
    out=false;
end
try
    printEqual      =params.printEqual;
catch
    printEqual      =1;
end
try
    printNotEqual   =params.printNotEqual;
catch
    printNotEqual   =1;
end
try
    pauseNotEqual   =params.pauseNotEqual;
catch
    pauseNotEqual   =1;
end
try
    pauseNotPresent =params.pauseNotPresent;
catch
    pauseNotPresent =0;
end

N=length(nfA);
for n=1:N
    try 
%         B.(nfB{ismember(nfB,nfA{n})});
        e=isequalwithequalnans(A.(nfA{n}),B.(nfB{ismember(nfB,nfA{n})}));
        if e
            if printEqual
                fprintf('Field name %s is equal\n',nfA{n});
            end
        else
            if printNotEqual
                fprintf('Field name %s is NOT equal!\n',nfA{n});
            end
            if pauseNotEqual
                pause;
            end
        end
        out=out && e;
    catch
        fprintf('Not present %s\n',nfA{n});
        if pauseNotPresent
            pause;
        end
        out=false;
    end
end