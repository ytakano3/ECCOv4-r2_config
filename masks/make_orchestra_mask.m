%
% make mask for ACSIS (ECCOv4 setup)
%

%% Initial setup

% clean up workspace
clear all
clear memory
close all

% load gcmfaces and grid
gcmfaces_global;
grid_load('/Users/dcjones3/Documents/ACSIS/experiments/grid/',5,'compact');

% name of masks
fname = 'SO_30S_top500_mask';

%% Grid

% make mask of ones for errfile
msk = mygrid.hFacC<2;
msk = convert2gcmfaces(msk);
write2file('ones_llc90',msk);

% make mask to select Southern Ocean
msk1 = mygrid.YC>=-85;
msk2 = mygrid.YC<=-30;
msk = msk1 & msk2;
msk = convert2gcmfaces(msk);
write2file(strcat(fname,'C'),msk);

% surface
z = mygrid.RC;
msk1 = z>-500;
msk2 = z<0;
mskZ = msk1 & msk2;
write2file(strcat(fname,'K'),mskZ);

% time mask
mskT=zeros(1,2*175295); mskT(166535:175295)=1;
write2file(strcat(fname,'T'),mskT);

%% Analysis mask

msk1 = mygrid.YC>=-65;
msk2 = mygrid.YC<=-30;
msk3 = mygrid.XC>=-180;
msk4 = mygrid.XC<=-70;
msk = msk1 & msk2 & msk3 & msk4;

m_map_gcmfaces(msk)
msk = convert2gcmfaces(msk);
write2file('suggested_mask_for_analysis',msk);

%% Plot

% load('~/Documents/MATLAB/colormaps/div11_RdYlBu.txt')
% cmp = div11_RdYlBu./256;
% cmp = flipud(cmp);
% cmp(6,:) = [1.0 1.0 1.0];

% ---- 2D mask

cmp(1,:) = [1.0 1.0 1.0];
cmp(2,:) = [0.0 0.0 0.0];

figure('color','w','position',[161   116   813   664])
m1 = read2memory(strcat(fname,'C'));
m1 = convert2gcmfaces(m1);
m_map_gcmfaces(m1,0,...
              {'myCmap',cmp},...
              {'title','Mask values'},...
              {'myShading','flat'},...
              {'myCaxis',[0 1]})

title('Mask')          
         
% print figure
print('-djpeg90',strcat(fname,'_2D.jpg'))

% --- depth and time mask

% plot depth mask
figure('color','w')

subplot(1,2,1)
plot(mygrid.RC,mskZ,'linewidth',2.0)
title('Depth mask')
xlabel('Depth level')
ylabel('Mask value')
grid

subplot(1,2,2)
plot(mskT,'-+','linewidth',2.0)
title('Temporal mask')
xlabel('Record number')
ylabel('Mask value')

% print figure
print('-djpeg90',strcat(fname,'_depth+time.jpg'))

