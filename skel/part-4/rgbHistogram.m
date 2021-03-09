function [sol] = rgbHistogram(path_to_image, count_bins)
  image = imread(path_to_image);
  sol = zeros([1, 3 * count_bins]);
  [l c dim] = size(image);
  edges = double([0:count_bins] * 256 )/ count_bins;
  B = image(:, : ,1);
  [r, edg] = histc(B(:), edges);
  B = image(:, : ,2);
  [g, edg] = histc(B(:), edges);
  B = image(:, : ,3);
  [b, edg] = histc(B(:), edges);
  
  sol = [r(1:count_bins, 1);g(1:count_bins, 1);b(1:count_bins, 1)]';
  
endfunction