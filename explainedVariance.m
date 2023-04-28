function [explained, hfig1, hfig2]=explainedVariance(X,ifplot,save_dir,name,compmode)
%%
% example: 
% out=loadDataR042_2013_08_18;
% [dx,dy]=refineData(out);
% X=prepareRatDataset(dx,dy);
% explained=explainedVariance(X,1);
if nargin < 3
    save_dir='/tmp';
end
if nargin < 4
    name='';
end
try 
    compmode;
catch
    compmode=0;
end
if compmode
    paths=cell(0,0);
    % paths{end+1}='/media/Data/Boxes/BoxInwind/Dropbox/matlab_code/Pca/';
    paths{end+1}='~/matlab_code/Pca/';
    paths{end+1}='../fieldtrip/external/dmlt/external/murphy/KPMstats/';
    % paths{end+1}='~/matlab_code/Pca/';
           
    for i=1:length(paths)
        rmpath (paths{i});
    end
end
% [coeff, score, latent, tsquared, explained, mu] = pca(X);
[~, ~, ~, ~, explained, ~] = pca(X);

if compmode
    for i=1:length(paths)
        addpath (paths{i});
    end
end
try 
    ip=ifplot;
catch
    ip=0;
end
hfig1=[];
hfig2=[];
if ip
    hfig1=figure; hold on; box on; grid on;
    ms=14;
    plot(explained,'marker','o','color',0*ones(3,1),'markersize',4);
    set(gca,'FontSize',ms)
    xlabel('principal components','fontsize',ms)
    ylabel('percent explained','fontsize',ms)
    title('Explained variance','fontsize',ms+2)
    
    yl=get(gca,'Ylim');
    ylim([-0.1,yl(2)]);
%     xl=get(gca,'xlim');
    xlim([-1,length(explained)+2]);
    nf=[save_dir '/ExplainedVariance' name];
    print(hfig1,'-depsc2',[nf '.eps']);
    
    hfig2=figure; 
    bar(cumsum(explained),'facecolor',0.7*ones(3,1));
    hold on; box on; grid on;
    inds=cumsum(explained)>90;
    xt=get(gca,'Xtick');
    
    j=find(inds==1);
    j=j(1);
    xt=sort([xt,j]);
    xt=unique(xt);
    set(gca,'Xtick',xt);
    hm=length(xt);
    mm=6;ym=13;
    mm=1;ym=14;
    
    outside=rectangle('Position',[xt(xt==j)-mm,hm-ym,mm*2,5]);
    set(outside,'Clipping','off')
    
    for i=1:length(xt)
        
    end
    cs=cumsum(explained);
    hold on;
    plot([j,j],[0,cs(j)],'r');
    
    ylim([-1,100+1])
    xlim([-2,length(explained)+2])
    ylabel('cumulative percent explained','fontsize',ms)
    xlabel('principal components','fontsize',ms)
    title('cumulative explained variance','fontsize',ms+2)
    nf=[save_dir '/cumulativeExplainedVariance' name];
    print(hfig2,'-depsc2',[nf '.eps']);
end
    
