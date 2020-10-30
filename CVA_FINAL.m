clear 
close all
clc
%Podajemy nazwy 
Prompt={'XaRaster','YaRaster', 'XbRaster', 'YbRaster'};
        Title='Lokalizacja plik�w wej�ciowych';
          DefaultValues={'NDVI_1.tif', 'NDMI_1.tif', 'NDVI_2.tif','NDMI_2.tif'};
%Tworzy tablice            
PARAMS=inputdlg(Prompt,Title,[1 50; 1 50; 1 50; 1 50],DefaultValues);
XaRaster=imread(PARAMS{1});
YaRaster=imread(PARAMS{2});
XbRaster=imread(PARAMS{3});
YbRaster=imread(PARAMS{4});


% konwersja na liczby double
XaRaster=double(XaRaster);
YaRaster=double(YaRaster);
XbRaster=double(XbRaster);
YbRaster=double(YbRaster);

%Normalizacja
[hh,vv]=size(XaRaster);
for ii=1:hh
    for jj=1:vv
        if XaRaster(ii,jj)<0
            XaRaster(ii,jj)=0;
            YaRaster(ii,jj)=0;
            XbRaster(ii,jj)=0;
            YbRaster(ii,jj)=0;
        end
    end
end
pause(0.1);

%% Delta

% DELTA
Xdelta=(XbRaster-XaRaster);
Ydelta=(YbRaster-YaRaster);
Xdelta2=((Xdelta).^2)
Ydelta2=((Ydelta).^2)
%% Mapa zmian wielko�ci wektora

% Magnitude Map
MG=sqrt(Xdelta2+Ydelta2)
MaxMG=max(max(MG))
MinMG=min(min(MG))
figure;imshow(MG)
title('Mapa zmian wielko�ci wektora')
colorbar
axis off
print('-djpeg','-r500','MagnitudeMap.jpg')
%% Pr�g zmian

%Treshold
StandDevMG=std(std(MG))
MeanMG=mean(mean(MG))
Treshold=MeanMG+StandDevMG
%%
%Change Map 
ChangeMap = (MG>Treshold)
figure;imshow(ChangeMap)
%% Kolor map

%Custom Map - klasy
map1 = [1.0 1.0 0.0
    0.6275 0.3216 0.1765
    0.0 0.0 1.0
    0.4863 0.9882 0];

%% Mapa zmian k�t�w wektora

% Angle Map
AngleMap=(atand(Ydelta2./Xdelta2)).*4
MaxAngle=max(max(AngleMap))
MinAngle=(min(min(AngleMap)))
figure;imshow(AngleMap)
imagesc(AngleMap)
title("Mapa zmian k�t�w wektora")
colorbar('Ticks',[0 90 180 270 360],...
    'TickLabels',{'0','90','180','270','360'})
axis off
colormap(map1)
print('-djpeg','-r500','AngleMap.jpg')
%% Ostateczna mapa zmiany

ChangeMap2=AngleMap./360
ChangeMap3=ChangeMap2.*ChangeMap
ChangeMap4=ChangeMap3.*360
map3 = [1 1 1
    1.0 1.0 0.0
    1.0 1.0 0.0
    1.0 1.0 0.0
    1.0 1.0 0.0
    1.0 1.0 0.0
    1.0 1.0 0.0
    1.0 1.0 0.0
    1.0 1.0 0.0
    1.0 1.0 0.0
    1.0 1.0 0.0
    1.0 1.0 0.0
    1.0 1.0 0.0
    1.0 1.0 0.0
    1.0 1.0 0.0
    1.0 1.0 0.0
    1.0 1.0 0.0
    1.0 1.0 0.0
    1.0 1.0 0.0
    1.0 1.0 0.0
    1.0 1.0 0.0
    1.0 1.0 0.0
    1.0 1.0 0.0
    1.0 1.0 0.0
    1.0 1.0 0.0
    1.0 1.0 0.0
    1.0 1.0 0.0
    1.0 1.0 0.0
    1.0 1.0 0.0
    1.0 1.0 0.0
    1.0 1.0 0.0
    1.0 1.0 0.0
    1.0 1.0 0.0
    1.0 1.0 0.0
    1.0 1.0 0.0
    1.0 1.0 0.0
    1.0 1.0 0.0
    1.0 1.0 0.0
    1.0 1.0 0.0
    1.0 1.0 0.0
    1.0 1.0 0.0
    1.0 1.0 0.0
    1.0 1.0 0.0
    1.0 1.0 0.0
    1.0 1.0 0.0
    1.0 1.0 0.0
    1.0 1.0 0.0
    1.0 1.0 0.0
    1.0 1.0 0.0
    1.0 1.0 0.0
    1.0 1.0 0.0
    1.0 1.0 0.0
    1.0 1.0 0.0
    1.0 1.0 0.0
    1.0 1.0 0.0
    1.0 1.0 0.0
    1.0 1.0 0.0
    1.0 1.0 0.0
    1.0 1.0 0.0
    1.0 1.0 0.0
    1.0 1.0 0.0
    1.0 1.0 0.0
    1.0 1.0 0.0
    1.0 1.0 0.0
    1.0 1.0 0.0
    1.0 1.0 0.0
    1.0 1.0 0.0
    1.0 1.0 0.0
    1.0 1.0 0.0
    1.0 1.0 0.0
    1.0 1.0 0.0
    1.0 1.0 0.0
    1.0 1.0 0.0
    1.0 1.0 0.0
    1.0 1.0 0.0
    1.0 1.0 0.0
    1.0 1.0 0.0
    1.0 1.0 0.0
    1.0 1.0 0.0
    1.0 1.0 0.0
    1.0 1.0 0.0
    1.0 1.0 0.0
    1.0 1.0 0.0
    1.0 1.0 0.0
    1.0 1.0 0.0
    1.0 1.0 0.0
    1.0 1.0 0.0
    1.0 1.0 0.0
    1.0 1.0 0.0
    1.0 1.0 0.0
    0.6275 0.3216 0.1765
    0.6275 0.3216 0.1765
    0.6275 0.3216 0.1765
    0.6275 0.3216 0.1765
    0.6275 0.3216 0.1765
    0.6275 0.3216 0.1765
    0.6275 0.3216 0.1765
    0.6275 0.3216 0.1765
    0.6275 0.3216 0.1765
    0.6275 0.3216 0.1765
    0.6275 0.3216 0.1765
    0.6275 0.3216 0.1765
    0.6275 0.3216 0.1765
    0.6275 0.3216 0.1765
    0.6275 0.3216 0.1765
    0.6275 0.3216 0.1765
    0.6275 0.3216 0.1765
    0.6275 0.3216 0.1765
    0.6275 0.3216 0.1765
    0.6275 0.3216 0.1765
    0.6275 0.3216 0.1765
    0.6275 0.3216 0.1765
    0.6275 0.3216 0.1765
    0.6275 0.3216 0.1765
    0.6275 0.3216 0.1765
    0.6275 0.3216 0.1765
    0.6275 0.3216 0.1765
    0.6275 0.3216 0.1765
    0.6275 0.3216 0.1765
    0.6275 0.3216 0.1765
    0.6275 0.3216 0.1765
    0.6275 0.3216 0.1765
    0.6275 0.3216 0.1765
    0.6275 0.3216 0.1765
    0.6275 0.3216 0.1765
    0.6275 0.3216 0.1765
    0.6275 0.3216 0.1765
    0.6275 0.3216 0.1765
    0.6275 0.3216 0.1765
    0.6275 0.3216 0.1765
    0.6275 0.3216 0.1765
    0.6275 0.3216 0.1765
    0.6275 0.3216 0.1765
    0.6275 0.3216 0.1765
    0.6275 0.3216 0.1765
    0.6275 0.3216 0.1765
    0.6275 0.3216 0.1765
    0.6275 0.3216 0.1765
    0.6275 0.3216 0.1765
    0.6275 0.3216 0.1765
    0.6275 0.3216 0.1765
    0.6275 0.3216 0.1765
    0.6275 0.3216 0.1765
    0.6275 0.3216 0.1765
    0.6275 0.3216 0.1765
    0.6275 0.3216 0.1765
    0.6275 0.3216 0.1765
    0.6275 0.3216 0.1765
    0.6275 0.3216 0.1765
    0.6275 0.3216 0.1765
    0.6275 0.3216 0.1765
    0.6275 0.3216 0.1765
    0.6275 0.3216 0.1765
    0.6275 0.3216 0.1765
    0.6275 0.3216 0.1765
    0.6275 0.3216 0.1765
    0.6275 0.3216 0.1765
    0.6275 0.3216 0.1765
    0.6275 0.3216 0.1765
    0.6275 0.3216 0.1765
    0.6275 0.3216 0.1765
    0.6275 0.3216 0.1765
    0.6275 0.3216 0.1765
    0.6275 0.3216 0.1765
    0.6275 0.3216 0.1765
    0.6275 0.3216 0.1765
    0.6275 0.3216 0.1765
    0.6275 0.3216 0.1765
    0.6275 0.3216 0.1765
    0.6275 0.3216 0.1765
    0.6275 0.3216 0.1765
    0.6275 0.3216 0.1765
    0.6275 0.3216 0.1765
    0.6275 0.3216 0.1765
    0.6275 0.3216 0.1765
    0.6275 0.3216 0.1765
    0.6275 0.3216 0.1765
    0.6275 0.3216 0.1765
    0.6275 0.3216 0.1765
    0.0 0.0 1.0
    0.0 0.0 1.0
    0.0 0.0 1.0
    0.0 0.0 1.0
    0.0 0.0 1.0
    0.0 0.0 1.0
    0.0 0.0 1.0
    0.0 0.0 1.0
    0.0 0.0 1.0
    0.0 0.0 1.0
    0.0 0.0 1.0
     0.0 0.0 1.0
    0.0 0.0 1.0
    0.0 0.0 1.0
    0.0 0.0 1.0
    0.0 0.0 1.0
    0.0 0.0 1.0
    0.0 0.0 1.0
    0.0 0.0 1.0
    0.0 0.0 1.0
    0.0 0.0 1.0
     0.0 0.0 1.0
    0.0 0.0 1.0
    0.0 0.0 1.0
    0.0 0.0 1.0
    0.0 0.0 1.0
    0.0 0.0 1.0
    0.0 0.0 1.0
    0.0 0.0 1.0
    0.0 0.0 1.0
    0.0 0.0 1.0
     0.0 0.0 1.0
    0.0 0.0 1.0
    0.0 0.0 1.0
    0.0 0.0 1.0
    0.0 0.0 1.0
    0.0 0.0 1.0
    0.0 0.0 1.0
    0.0 0.0 1.0
    0.0 0.0 1.0
    0.0 0.0 1.0
     0.0 0.0 1.0
    0.0 0.0 1.0
    0.0 0.0 1.0
    0.0 0.0 1.0
    0.0 0.0 1.0
    0.0 0.0 1.0
    0.0 0.0 1.0
    0.0 0.0 1.0
    0.0 0.0 1.0
    0.0 0.0 1.0
     0.0 0.0 1.0
    0.0 0.0 1.0
    0.0 0.0 1.0
    0.0 0.0 1.0
    0.0 0.0 1.0
    0.0 0.0 1.0
    0.0 0.0 1.0
    0.0 0.0 1.0
    0.0 0.0 1.0
    0.0 0.0 1.0
     0.0 0.0 1.0
    0.0 0.0 1.0
    0.0 0.0 1.0
    0.0 0.0 1.0
    0.0 0.0 1.0
    0.0 0.0 1.0
    0.0 0.0 1.0
    0.0 0.0 1.0
    0.0 0.0 1.0
    0.0 0.0 1.0
     0.0 0.0 1.0
    0.0 0.0 1.0
    0.0 0.0 1.0
    0.0 0.0 1.0
    0.0 0.0 1.0
    0.0 0.0 1.0
    0.0 0.0 1.0
    0.0 0.0 1.0
    0.0 0.0 1.0
    0.0 0.0 1.0
     0.0 0.0 1.0
    0.0 0.0 1.0
    0.0 0.0 1.0
    0.0 0.0 1.0
    0.0 0.0 1.0
    0.0 0.0 1.0
    0.0 0.0 1.0
    0.0 0.0 1.0
    0.0 0.0 1.0
    0.0 0.0 1.0
    0.4863 0.9882 0
    0.4863 0.9882 0
    0.4863 0.9882 0
    0.4863 0.9882 0
    0.4863 0.9882 0
    0.4863 0.9882 0
    0.4863 0.9882 0
    0.4863 0.9882 0
    0.4863 0.9882 0
    0.4863 0.9882 0
    0.4863 0.9882 0
    0.4863 0.9882 0
    0.4863 0.9882 0
    0.4863 0.9882 0
    0.4863 0.9882 0
    0.4863 0.9882 0
    0.4863 0.9882 0
    0.4863 0.9882 0
    0.4863 0.9882 0
    0.4863 0.9882 0
    0.4863 0.9882 0
    0.4863 0.9882 0
    0.4863 0.9882 0
    0.4863 0.9882 0
    0.4863 0.9882 0
    0.4863 0.9882 0
    0.4863 0.9882 0
    0.4863 0.9882 0
    0.4863 0.9882 0
    0.4863 0.9882 0
    0.4863 0.9882 0
    0.4863 0.9882 0
    0.4863 0.9882 0
    0.4863 0.9882 0
    0.4863 0.9882 0
    0.4863 0.9882 0
    0.4863 0.9882 0
    0.4863 0.9882 0
    0.4863 0.9882 0
    0.4863 0.9882 0
    0.4863 0.9882 0
    0.4863 0.9882 0
    0.4863 0.9882 0
    0.4863 0.9882 0
    0.4863 0.9882 0
    0.4863 0.9882 0
    0.4863 0.9882 0
    0.4863 0.9882 0
    0.4863 0.9882 0
    0.4863 0.9882 0
    0.4863 0.9882 0
    0.4863 0.9882 0
    0.4863 0.9882 0
    0.4863 0.9882 0
    0.4863 0.9882 0
    0.4863 0.9882 0
    0.4863 0.9882 0
    0.4863 0.9882 0
    0.4863 0.9882 0
    0.4863 0.9882 0
    0.4863 0.9882 0
    0.4863 0.9882 0
    0.4863 0.9882 0
    0.4863 0.9882 0
    0.4863 0.9882 0
    0.4863 0.9882 0
    0.4863 0.9882 0
    0.4863 0.9882 0
    0.4863 0.9882 0
    0.4863 0.9882 0
    0.4863 0.9882 0
    0.4863 0.9882 0
    0.4863 0.9882 0
    0.4863 0.9882 0
    0.4863 0.9882 0
    0.4863 0.9882 0
    0.4863 0.9882 0
    0.4863 0.9882 0
    0.4863 0.9882 0
    0.4863 0.9882 0
    0.4863 0.9882 0
    0.4863 0.9882 0
    0.4863 0.9882 0
    0.4863 0.9882 0
    0.4863 0.9882 0
    0.4863 0.9882 0
    0.4863 0.9882 0
    0.4863 0.9882 0
    0.4863 0.9882 0
    0.4863 0.9882 0
    ];
imagesc(ChangeMap4)
colormap(map3)
title("Mapa zmiany")
colorbar('Ticks',[0 90 180 270 360],...
    'TickLabels',{'0','90','180','270','360'})
axis off
print('-djpeg','-r500','ChangeMap.jpg')

imtiff=geotiffinfo(PARAMS{1});
[A, R] = geotiffread(PARAMS{1}); 
mmm=imtiff.GeoTIFFCodes;
RRR=mmm.PCS;
geotiffwrite('ChangeMap.tif',ChangeMap4,R,'CoordRefSysCode',RRR)
[ChangeMap4, RR] = geotiffread('ChangeMap.tif');
%% *Histogram powierzchni* 

edges=[0, 0.0000000001, 90, 180, 270 ,360]
histogram(ChangeMap4,edges)