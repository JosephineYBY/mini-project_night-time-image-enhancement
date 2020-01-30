function [dis_image] = linear_stretch(image,maxL,ya,yb,xa,xb)
input_img=rgb2gray(image);
[a,b]=size(input_img);
dis_image=uint8(zeros(a,b));
src_img=double(input_img);
%slope coefficient
k1=ya/xa;
k2=(yb-ya)/(xb-xa);
k3=(maxL-yb)/(maxL-xb);
for i=1:a
    for j=1:b
        if src_img(i,j)<=xa
            dis_image(i,j)=k1*src_img(i,j);
        elseif (src_img(i,j)>xa) && (src_img(i,j)<=xb)
                dis_image(i,j)=k2*(src_img(i,j)-xa)+ya;
            else
                dis_image(i,j)=k3*(src_img(i,j)-xb)+yb;
        end
    end
end
dis_image = grs2rgb(dis_image,hot);
%imshowpair(dis_image,image,'montage');
%title 'Piecewise linear stretching(left)/original image(right)'
imshow(dis_image);
end

