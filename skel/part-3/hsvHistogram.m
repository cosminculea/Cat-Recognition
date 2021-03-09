function [sol] = hsvHistogram(path_to_image, count_bins)
  image = imread(path_to_image);
  image = RGBTOHSV(image); % se face conversia in HSV
  sol = zeros([1, 3 * count_bins]); % se merge pe acelasi principiu ca la HSV
  [l c dim] = size(image);
  
  edges = double([0:count_bins] * 101)/ (100 * count_bins);
  B = image(:,:,1);
  
  [h, edg] = histc(B(:), edges);
  B = image(:,:,2);
  [s, edg] = histc(B(:), edges);
  B = image(:,:,3);
  [v, edg] = histc(B(:), edges);
  
  sol = [h(1:count_bins,1); s(1:count_bins,1); v(1:count_bins,1)]';
endfunction