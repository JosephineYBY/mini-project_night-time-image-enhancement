function [output_img] =hist_equ(input_img,maxL)
%input_img: a grayscale image
%maxL:the maximum value in the range of input_img

n=size(input_img,1)*size(input_img,2);
L=maxL-1;
count_num=imhist(input_img);
p_rk=count_num/n;
s=L*cumsum(p_rk);
s=round(s);
output_img=uint8(zeros(size(input_img)));
for i=1:size(s,1)
    output_img(input_img==i-1)=s(i);
end
output_img = grs2rgb(output_img,hot);
%imshowpair(output_img,input_img,'montage');
imshow(output_img);
%title ' After histogram equalization(left)/original image(right)'

end

