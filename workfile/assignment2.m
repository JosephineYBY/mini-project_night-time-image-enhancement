clc;clear;
%%
image=imread('assignment.jpg');
I=rgb2gray(image);
n=size(I,1)*size(I,2);
L=256;
s=size(image);
i_test=double(image);
%contrast-limited Adaptive Histogram Equalization
count_r=imhist(image);
count_gray=imhist(I);
Lab=rgb2lab(image);
L=Lab(:,:,1)/100;
A=Lab(:,:,2)/100;
B=Lab(:,:,3)/100;
L = adapthisteq(L,'NumTiles',[2 2],'ClipLimit',0.02);
A = adapthisteq(A,'NumTiles',[2 2],'ClipLimit',0.01);
B = adapthisteq(B,'NumTiles',[2 2],'ClipLimit',0.01);
Lab(:,:,1)=L*100;
Lab(:,:,2)=A*100;
Lab(:,:,3)=B*100;
J = lab2rgb(Lab);
%histogram equalization
[out_img]=hist_equ(I,255);

figure
imshow(J);
%title('Original image(left)/CLAHE(right)')
%% linear stretch
image=imread('assignment.jpg');
ya=170;yb=200;xa=50;xb=80;maxL=255;
[dis_image] = linear_stretch(image,maxL,ya,yb,xa,xb);

