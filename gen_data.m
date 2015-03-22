%Code by RR Iyer, Supriya N, Priyadarshini S, NITK Surathkal

%Find bounding boxes around cars using edge detection of processed image

clear all;
close all;
counter=1;
for j=30:34
I1=imread(strcat('Z:\Rishee\College\Computer Vision\CarData\TestImages_Scale\test-',num2str(j),'.pgm'));

%Histogram equalisation
I = histeq(I1);

%Filter using Imopen
background = imopen(I,strel('disk',1));
I2 = I - background;

%bw of image
bw = im2bw(I2, graythresh(I2));

%Egdes
edges = edge(bw,'canny');

%Draw bounding boxes;
se = strel('square', 5);
im_close = imclose(edges, se);
s = regionprops(im_close, 'BoundingBox');
bb = round(reshape([s.BoundingBox], 4, []).');
a=find(bb(:,3)>30);
s=s(a);
temp=bb(a,:);
b=find(temp(:,4)>30);
temp=temp(b,:);
s=s(b);
bb=temp;
%imshow(I1);
for i=1:size(bb,1)
    %figure,imshow(I1((bb(i,2):bb(i,2)+bb(i,4)-1),(bb(i,1):bb(i,1)+bb(i,3)-1)))
    imwrite(I1((bb(i,2):bb(i,2)+bb(i,4)-1),(bb(i,1):bb(i,1)+bb(i,3)-1)),strcat('Z:\Rishee\College\Computer Vision\CarData\Testdata\spr_',num2str(counter),'.pgm'));
    dlmwrite(strcat('Z:\Rishee\College\Computer Vision\CarData\Testdata\bbvalue_',num2str(counter),'.txt'),bb);
    dlmwrite(strcat('Z:\Rishee\College\Computer Vision\CarData\Testdata\image_',num2str(counter),'.txt'),j);
    counter=counter+1; 
end
% for idx = 1 : numel(s)
%     rectangle('Position', bb(idx,:), 'edgecolor', 'red');
% end
end;

simple_gui
