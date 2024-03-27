function   [RMS, sumNormTarget]=RMSError(output, target, targetVar)
% function [RMS, sumNormTarget]=RMSError(output, target, targetVar)
output = output(:,:); % consider all other dimensions > 2 in the same variance
target = target(:,:);
Nsamples=size(output,1);

if (nargin < 3)
    target_m       =mean(target);

    target_rep     =repmat(target_m,Nsamples,1);

    % sumNormTarget  =sum(snormMat(target,target_rep));

    % C              =size(target,2);

    tmdiff         = abs(target-target_rep);

    % if (C==1)
    %     sumNormTarget=diff.^2;
    % else
        % sumNormTarget=sum((diff.*diff)')';
        sumNormTarget=sum(tmdiff.*tmdiff,2);
    % end


else
    sumNormTarget=targetVar;
end

todiff         = abs(target-output);
% sumNormInput=sum(snormMat(target,output));
sumNormInput=sum(todiff .* todiff,2);

RMS         =sumNormInput/sumNormTarget;

return;