%GAMBAR
image = imread('image.png');
figure(1); imshow(image)

%GAMABR KEABUAN
image_gray = (image(:,:,1) + image(:,:,2) + image(:,:,3)) / 3;
figure(2); imshow(image_gray)

%GAMBAR KEABUAN MENGGUNAKAN KONSTANTA
image_gray_const = image(:,:,1) * 0.4  + image(:,:,2) * 0.32 + image(:,:,3) * 0.28;
figure(3); imshow(image_gray_const)

%GAMBAR KEABUAN MENGGUNAKAN BINNER
value = 100;
[kolom, baris] = size(image_gray_const);
image_gray_biner = zeros(kolom, baris);

for x = 1 : kolom 
    for y = 1 : baris
        if(image_gray_const(x,y) > value)
            image_gray_biner(x,y) = 1;
        else
            image_gray_biner(x,y) = 0;
        end
    end
end

figure(4); imshow(image_gray_biner)

%GAMBAR BRIGHTNESS
image_brightness = image_gray_const + 50;
figure(5); imshow(image_brightness)

%GAMBAR CONTRAST
image_contrast = image_gray_const * 1.3;
figure(6); imshow(image_contrast)

