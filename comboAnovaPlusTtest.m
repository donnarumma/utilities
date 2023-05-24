function comboAnovaPlusTtest(Xt,nn,s,infvec)
% Xt=globTotLen{end};
% fprintf('\nTest2 Gaussian 1 versus Gaussian 1\n');
% [h,p,ci,stats]=ttest(Xt1);
try
    infvec;
catch
    infvec={'Low Cooperation: No Recognition and No Signaling .','Agent B Recognition, No Signaling','Agent B Recognition & Signaling','Agent A,B Recognition, No Signaling','Agent A,B Recognition & Signaling'};
end
Xt1=Xt / nn;
for ind=1:size(Xt1,2)-1
    [h,p,ci,t_stats]=ttest2(Xt1(:,ind),Xt1(:,end));
    fprintf('\n%s tTest %s versus %s\n',s,infvec{end},infvec{ind});
    printTTest(h,p,ci,t_stats);
end
% [p,table,a_stats]=anova1(Xt1);
[~,table,a_stats]=anova1(Xt1);

figure;
[c,m,hfig]=multcompare(a_stats);

% etasquared=table{2,2}/table{4,2};
% effectsize=sqrt(etasquared/(1-etasquared));

% fprintf('F[%g,%g]=%g, p=%g, e=%g\n',table{2,3},table{3,3},table{2,5},table{2,6},effectsize);
fprintf('\n%s Anova F[%g,%g]=%g, p=%g\n',s,table{2,3},table{3,3},table{2,5},table{2,6});
% close all;
