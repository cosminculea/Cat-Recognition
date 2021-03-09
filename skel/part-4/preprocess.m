function [X, y] = preprocess(path_to_dataset, histogram, count_bins)
  path = strcat(path_to_dataset, "cats/");
  images = getImgNames(path);
  [nr_images c] = size(images);
  Xc = zeros([nr_images, 3 * count_bins]);
  for count = 1:nr_images
    path_to_image = strcat(path, images(count, :));
    
    if histogram == "RGB"
      sol = rgbHistogram(path_to_image, count_bins);
    endif
    
    if histogram == "HSV"
      sol = hsvHistogram(path_to_image, count_bins);
    endif
    
    Xc(count, :) = sol;
  endfor
    yc = ones([nr_images, 1]);
  
  path = strcat(path_to_dataset, "not_cats/");
  images = getImgNames(path);
  [nr_images c] = size(images);
  Xnc = zeros([nr_images, 3 * count_bins]);
  for count = 1:nr_images
    path_to_image = strcat(path, images(count, :));
    
    if histogram == "RGB"
      sol = rgbHistogram(path_to_image, count_bins);
    endif
    
    if histogram == "HSV"
      sol = hsvHistogram(path_to_image, count_bins);
    endif
    
    Xnc(count, :) = sol;
  endfor
  
    ync = -ones([nr_images, 1]);
  
    X = [Xc; Xnc];
    y = [yc; ync];
  
endfunction
