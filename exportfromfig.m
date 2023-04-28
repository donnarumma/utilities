function exportfromfig(fig_name,svs)    
% function exportfromfig(fig_name,svs)    

hfig_e = openfig(fig_name);
for is=1:length(svs)
    sv=svs{is};
    t=tic;
%         fprintf('Saving %s', sv);
    if is==2
        exportgraphics(hfig_e,sv);
    else
        exportgraphics(hfig_e,sv,'ContentType','vector');
    end
    fprintf('Saved %s. Elapsed time %gs\n', sv,toc(t));
end
