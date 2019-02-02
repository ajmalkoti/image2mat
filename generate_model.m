function generate_model(A,N)

vp=zeros(size(A)); vs=zeros(size(A)); dens=zeros(size(A)); 
qp= zeros(size(A)); qs= zeros(size(A));

vp_value=[1500 2000 2150 2300 2500 2700 4500 2800 3100 3500 3700];
vs_value=[0 900 1250 1400 1450 1500 2600 1600 1650 1700 1800];
dens_value=[1.00 1.55 1.60 1.70 1.85 2.00 2.60 1.90 2.20 2.40 2.60];
qp_value=100*ones(size(dens_value));
qs_value=70*ones(size(dens_value));

figure(4); imagesc(A); colormap(gray); hold on
[x,y]=ginput(N);

for i=1:N
    pixel_value(i)= A(floor(y(i)),floor(x(i)));
end

%pixel_value=[178 225 105 75 121 128 0 91 142 53 52];

for i=1:length(pixel_value)
    [a,b]=find(A==pixel_value(i));
    
    for j=1:length(a)
        vp(a(j),b(j))=vp_value(i);
        vs(a(j),b(j))=vs_value(i);
        dens(a(j),b(j))=1000*dens_value(i);
        qp(a(j),b(j))=qp_value(i);
        qs(a(j),b(j))=qs_value(i);
    end
    
end

save('data_model_1','vp','vs','dens','qp','qs' );

figure(3); subplot(2,3,1); imagesc(A); colormap(gray); title('given data');
figure(3); subplot(2,3,2); imagesc(vp); colormap(gray); title('P-wave Velocity');
figure(3); subplot(2,3,3); imagesc(vs); colormap(gray); title('S-wave Velocity');
figure(3); subplot(2,3,4); imagesc(dens); colormap(gray); title('Density');
figure(3); subplot(2,3,5); imagesc(qp); colormap(gray); title('Attenuation Qp');
figure(3); subplot(2,3,6); imagesc(qs); colormap(gray); title('Attenuation Qs ');
