% separate function "replacing" is used
%it replaces   a) layer wise        b) point wise
clc; clf; clear all;close all;
A=imread('model.png'); 
A=rgb2gray(A); 

imagesc(A); colormap(gray); hold on

N=11;       [x,y]=ginput(N);
for i=1:N
    pixel_value(i)= A(floor(y(i)),floor(x(i)));
end

[A]=replacing_layer_value(A,x,y,pixel_value);

[A]=replacing_pixel_value(A,x,y,pixel_value);

generate_model(A,N)

