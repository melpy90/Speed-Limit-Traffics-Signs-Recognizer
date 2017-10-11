clc;    % Clear the command window.
close all;  % Close all figures (except those of imtool.)
imtool close all;  % Close all imtool figures.
clear;  % Erase all existing variables.


% Converts rgb image to a grey scaled image.

% positive match 30-3, 70-2

%
RGB = imread('70-2.jpg');
imshow(RGB);
I = rgb2gray(RGB);
figure
imshow(I);

%EDGE DETECTOR
%BW = edge(I,'prewitt');
%figure
%imshow(BW);

BW = edge(I,'Canny');
%figure 
imshow(BW);

%HOUGH TRANSFORM FOR CIRCLES EXTRACTION

% TROVO TUTTI I CERCHI CON RAGGIO TRA C E B PIXEL

C= 10;
B= 300;
[centers, radii, metric] = imfindcircles(I,[C B]);
% ottengo il primo  cerchio con le caratteristiche definite
centersStrong2 = centers(1:1,:);
radiiStrong2 = radii(1:1);
metricStrong2 = metric(1:1);

%disegno i 2 risultati
figure 
viscircles(centersStrong2, radiiStrong2,'EdgeColor','b');

%% Estrazione dell immagine contenete il segnale


[nrows, ncols, dim] = size(RGB);


% iterate over each pixel and determine if it is outside the circle or not
for x=1:ncols
    for y=1:nrows
       % includo il cerchio rosso attorno il segnale
         if (x-centersStrong2(1,1))^2 + (y-centersStrong2(1,2))^2 > 1.5*radiiStrong2^2
        % escludo il cerchio rosso attorno il segnale
       % if (x-centersStrong2(1,1))^2 + (y-centersStrong2(1,2))^2 > radiiStrong2^2
           
            % pixel is outside of the circle, so colour it white
           RGB(y,x,:) = [255 255 255]; 
        end
    end
end
% display the image
image(RGB);

axis equal

%%ritaglio il quadrato con il segnale
%imageCrop= imcrop(RGB,[centersStrong2(1,1)-radiiStrong2 + 1.5*radiiStrong2,centersStrong2(1,2)-radiiStrong2 + 1.5*radiiStrong2,centersStrong2(1,1)+radiiStrong2 + 1.5*radiiStrong2,centersStrong2(1,2)+radiiStrong2 + 1.5*radiiStrong2 ]);
%imageCrop= imcrop(RGB, [centersStrong2(1,1)-2.5*radiiStrong2  ,centersStrong2(1,2)-2.5*radiiStrong2, centersStrong2(1,1)+2.5*radiiStrong2 , centersStrong2(1,2)+2.5*radiiStrong2]);


% includo il cerchio rosso attorno il segnale
D= 1.1;
imageCrop = imcrop(RGB, [centersStrong2(1,1)-D*radiiStrong2  ,centersStrong2(1,2)-D*radiiStrong2, centersStrong2(1,1)+D*radiiStrong2 , centersStrong2(1,2)+D*radiiStrong2]);

 % escludo il cerchio rosso attorno il segnale
%imageCrop = imcrop(RGB, [centersStrong2(1,1)-radiiStrong2  ,centersStrong2(1,2)-radiiStrong2, centersStrong2(1,1)+radiiStrong2 , centersStrong2(1,2)+radiiStrong2]);


%figure
%image(imageCrop);
%axis equal

%J = histeq(imageCrop,1);
%imshowpair(imageCrop,J,'montage')
%axis off

%MASCHERA BINARIA ripulisco il cartello da eventuali ombre

[nrows, ncols, dim] = size(imageCrop);
for x=1:ncols
    for y=1:nrows
        
        if imageCrop(y,x,:)<= 225 
            imageCrop(y,x,:) = [0 0 0];
        else
          imageCrop(y,x,:) = [255 255 255];
        end  
    end
end
I = rgb2gray(imageCrop);
%level = graythresh(I);
%BW= im2bw(I, level);
%imshow (BW);


searchImg = I;
%% Correlazione con immagini nel database

%%c1= normxcorr2(searchImg, searchImg);
%%max(c1(:))

test10 = imread('1.jpg');
test20 = imread('2.jpg');
test30 = imread('3.jpg');
test40 = imread('4.jpg');
test50 = imread('5.jpg');
test60 = imread('6.jpg');
test70 = imread('7.jpg');
test80 = imread('8.jpg');
test90 = imread('9.jpg');
test100 = imread('10.jpg');
test110 = imread('11.jpg');
test120 = imread('12.jpg');
test130 = imread('13.jpg');


testImgRgb1 = rgb2gray(test10);
c1 = normxcorr2(searchImg,testImgRgb1);
b1 = max(c1(:));


testImgRgb2 = rgb2gray(test20);
c2 = normxcorr2(searchImg,testImgRgb2);
b2 = max(c2(:));

testImgRgb3 = rgb2gray(test30);
c3 = normxcorr2(searchImg,testImgRgb3);
b3 = max(c3(:));

testImgRgb4 = rgb2gray(test40);
c4 = normxcorr2(searchImg,testImgRgb4);
b4 = max(c4(:));

testImgRgb5 = rgb2gray(test50);
c5 = normxcorr2(searchImg,testImgRgb5);
b5 = max(c5(:));

testImgRgb6 = rgb2gray(test60);
c6 = normxcorr2(searchImg,testImgRgb6);
b6 = max(c6(:));

testImgRgb7 = rgb2gray(test70);
c7 = normxcorr2(searchImg,testImgRgb7);
b7 = max(c7(:));

testImgRgb8 = rgb2gray(test80);
c8 = normxcorr2(searchImg,testImgRgb8);
b8 = max(c8(:));

testImgRgb9 = rgb2gray(test90);
c9 = normxcorr2(searchImg,testImgRgb9);
b9 = max(c9(:));

testImgRgb10 = rgb2gray(test100);
c10 = normxcorr2(searchImg,testImgRgb10);
b10 = max(c10(:));

testImgRgb11 = rgb2gray(test110);
c11 = normxcorr2(searchImg,testImgRgb11);
b11 = max(c11(:));

testImgRgb12 = rgb2gray(test120);
c12 = normxcorr2(searchImg,testImgRgb12);
b12 = max(c12(:));

testImgRgb13 = rgb2gray(test130);
c13 = normxcorr2(searchImg,testImgRgb13);
b13 = max(c13(:));





%% matrice dei risultati della correlazione e display del risultato

A = [10 b1; 20 b2; 30 b3;
    40 b4; 50 b5; 60 b6;
70 b7; 80 b8; 90 b9;
100 b10; 110 b11; 120 b12; 130 b13];

% A(:,2)

[M, In] = max(A(:,2));

figure 
image(imageCrop);
axis equal
figure


if In == 1
imshow('1w.jpg');
figure
surf(c1) , shading flat

end

if In == 2
imshow('2w.jpg');
figure
surf(c2) , shading flat

end

if In == 3
imshow('3w.jpg');
figure
surf(c3) , shading flat

end

if In == 4
imshow('4w.jpg');
figure
surf(c4) , shading flat
end



if In == 5
imshow('5w.jpg');
figure
surf(c5) , shading flat

end

if In == 6
imshow('6w.jpg');
figure
surf(c6) , shading flat

end

if In == 7
imshow('7w.jpg');
figure
surf(c7) , shading flat

end

if In == 8
imshow('8w.jpg');
figure
surf(c8) , shading flat

end

if In == 9
imshow('9w.jpg');
figure
surf(c9) , shading flat

end

if In == 10
imshow('10w.jpg');
figure
surf(c10) , shading flat

end

if In == 11
imshow('11w.jpg');
figure
surf(c11) , shading flat

end

if In == 12
imshow('12w.jpg');
figure
surf(c12) , shading flat

end
if In == 13
imshow('13w.jpg');
figure
surf(c13) , shading flat

end

