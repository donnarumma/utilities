function optionsBar(inds,muvbar,stdbar,xl,yl,infvec,font_size,colormode)
%% function optionsBar(inds,muvbar,stdbar,xl,yl,infvec,font_size)

try
    fs=font_size;
catch
    fs=22;
end
set(gca,'fontsize',fs);
xlabel(xl,'fontsize',fs);
ylabel(yl,'fontsize',fs);

hm=length(muvbar);

%     col=linspace(0.4,1,hm);

try
    yescol=colormode;
catch
% yescol=1;
    yescol=0;
end
% col(2:3)=col(3:-1:2);
if yescol==0
    cmaps=repmat(linspace(0.4,1,hm),3,1)';
elseif yescol==1
    cmaps=linspecer(hm);
elseif yescol==2
    cmaps=repmat(linspace(1,0.4,hm),3,1)';
end
for i=1:length(inds)
%     thecol=col(i)*[1,1,1];
%     if yescol
      thecol=cmaps(i,:);
%     end
    bar(inds(i),muvbar(i),'facecolor',thecol);
end
errorbar(inds,muvbar,stdbar,'ko','linewidth',2)

set(gca,'Xtick',inds);
set(gca,'Xticklabel',infvec)