function tmpN = generateParamsMatString(params,tmp_dir,LenS)
%function tmpN = generateParamsMatString(params)
%    params  =loadTEST(runIdx);

    try
        LenS;
    catch
        LenS=10;  
    end
    s=generateRandomString(LenS);
    try
        tmp_dir;    
    catch
        tmp_dir  = '/tmp/';
    end
    tmpN    =[tmp_dir '/' s '.mat'];
    save(tmpN,'-struct','params');
%    load(tmpN);