function [mtl,stl,bci]=CI_compute(X,params)
%% function [mtl,stl,bci]=CI_compute(X,params)
try 
    P=params.P; % Confidence interval
catch
    P=90;	    % Default Confidence Interval
    P=95;	    % Default Confidence Interval
end
try 
    NNN=params.N; % number of bootstrap samples
catch
    NNN=10000;
end
try
    OPT_CALC=params.opt;
catch
%     OPT_CALC=[1,0,0];  % note: first two are equivalent - BOOTSTRAP - the second is slower and demonstrative
    OPT_CALC=[0,0,1];  % note: first two are equivalent - normal mean - the second is slower and demonstrative
end
alpha =(1-P/100);
% xval=all{n,k};
xval=X;
if OPT_CALC(1)
    %% WITH BOOTSTRAP
    [bci,bmeans] = bootci(NNN,{@mean,xval},'alpha',alpha);
    mtl          = mean(bmeans);

    stl          = diff(bci)/2;                % confidence semi interval
elseif OPT_CALC(2)
    %% WITH BOOTSTRAP and HAND CALCULATED standard error
    Tmax=size(xval,2);
    mtl=nan(1,Tmax);
    stl=nan(1,Tmax);
    for iT=1:Tmax
        xval_cur= xval(:,iT);
        stats   = bootstrp(NNN,@(x)[mean(x) std(x)],xval_cur);
        sts     = mean(stats);
        mtl(iT) = sts(1);
        stl(iT) = sts(2);
        % get bootstrap means and std
    end
    N=size(xval,1);
    ts    = tinv([alpha/2  (1-alpha/2)],NNN-1);  % T-Score with bootstrap
    ts_   = max(ts);
    stl   = stl/sqrt(N);                         % standard error
    
    stl   = ts_*stl;                             % confidence semi interval size
    bci   = [mtl-stl; mtl+stl];                  % confidence interval
elseif OPT_CALC(3)
    %% WITHOUT BOOTSTRAP
    N     = size(xval,1);
    
    mtl   = mean(xval,1,'omitnan');
    stl   = std(xval,[],1,'omitnan')/sqrt(N);     % standard error
    ts    = tinv([alpha/2  (1-alpha/2)],N-1);     % T-Score
    ts_   = max(ts);

    stl   = ts_*stl;                              % confidence semi interval size
    bci   =[mtl-stl; mtl+stl];                    % confidence interval
end 
