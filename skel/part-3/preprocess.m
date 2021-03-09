function [X, y] = preprocess(path_to_dataset, histogram, count_bins)
  path = strcat(path_to_dataset, "cats/");
  images = getImgNames(path); % se pastreaza toate imaginile cu pisici
  [nr_images c] = size(images);
  Xc = zeros([nr_images, 3 * count_bins]); % aici se creeaza sistemul pt pisici
  for count = 1:nr_images % se parcurg toate imaginile
    path_to_image = strcat(path,images(count, :));
    
    if histogram == "RGB" % se verifica daca e cu RGB sau HSV si se trimite
      sol = rgbHistogram(path_to_image,count_bins); % catre functia coresp
    endif
    
    if histogram == "HSV"
      sol = hsvHistogram(path_to_image,count_bins);
    endif
    
    Xc(count,:) = sol; % se creaza o ecuatie a sistemului
  endfor
    yc = ones([nr_images, 1]); % pentru pisici y va fi cu 1
  
  path = strcat(path_to_dataset, "not_cats/");
  images = getImgNames(path); % se pastreaza toate imaginile fara pisici
  [nr_images c] = size(images);
  Xnc = zeros([nr_images, 3 * count_bins]); % aici se creaza sistemul pt notcats
  for count = 1:nr_images
    path_to_image = strcat (path, images(count,:));
    
    if histogram == "RGB"
      sol = rgbHistogram (path_to_image,count_bins);
    endif
    
    if histogram == "HSV"
      sol = hsvHistogram (path_to_image,count_bins);
    endif
    
    Xnc(count, :) = sol; % se creaza o ecuatie a sistemului
  endfor
  
    ync = -ones([nr_images, 1]); % pentru not_cats y va fi -1
  
    X = [Xc; Xnc]; % se imbina cele 2 sisteme
    y = [yc; ync];
  
endfunction
