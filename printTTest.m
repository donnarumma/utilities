function s=printTTest(h,p,ci,stats)
if h
    resTest='Rejected';
else
    resTest='failure to Rejected';
end
s{1}=sprintf('Ttest result: %s',resTest);
s{2}=sprintf('p-value: %g',p);
s{3}=sprintf('confidence interval: (%g,%g)',ci(1),ci(2));
s{4}=sprintf('degree of freedom: %g',stats.df);

for i=1:length(s)
    fprintf('%s\n',s{i})
end
% fprintf('Ttest result: %s\n',resTest);
% fprintf('p-value: %g\n',p);
% fprintf('confidence interval: (%g,%g)\n',ci(1),ci(2));
% fprintf('degree of freedom: %g\n',stats.df);
