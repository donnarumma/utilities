function closeEditor()
% function closeEditor()
    edtSvc  = com.mathworks.mlservices.MLEditorServices;
    edtSvc.getEditorApplication.close;
end