gcmfaces_global;
grid_load('../run.20yr.test/',5,'compact');

% why is mskW equal to -1 and spatially limited?
% why is mskS equal to +1 but only present in far eastern Atlantic?

%%

if 1;
    mskW=convert2gcmfaces(mygrid.LATS_MASKS(117).mskWedge);
    mskS=convert2gcmfaces(mygrid.LATS_MASKS(117).mskSedge);
    mskW(isnan(mskW))=0;
    mskS(isnan(mskS))=0;
    write2file('n27_transp_maskW',mskW);
    write2file('n27_transp_maskS',mskS);
    msk=ones(1,50); msk(11:end)=0;
    write2file('n27_transp_maskK',msk);
end;

if 1;
    % set mask regions    
    msk1 = mygrid.XC>-70;
    msk2 = mygrid.XC<60;
    msk3 = mygrid.YC>45;
    msk4 = mygrid.YC<70;
    msk = msk1 & msk2 & msk3 & msk4;   
    msk=convert2gcmfaces(msk.*mygrid.mskC(:,:,1));
    msk(isnan(msk))=0;
    write2file('north45_maskC',msk);
    %
    msk=ones(1,50); msk(11:end)=0;
    write2file('north45_maskK',msk);
    %msk=zeros(1,8); msk(4)=1;
    msk=zeros(1,2*8760); msk(8000:8760)=1;
    write2file('north45_maskT',msk);
end;

%% plot results

figure('color','w')
m_map_gcmfaces(convert2gcmfaces(mskW),1)

figure('color','w')
m_map_gcmfaces(convert2gcmfaces(mskS),1)