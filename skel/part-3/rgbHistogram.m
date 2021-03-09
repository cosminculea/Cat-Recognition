function [sol] = rgbHistogram(path_to_image, count_bins)
  image = imread(path_to_image); % se citeste imaginea
  sol = zeros([1, 3 * count_bins]); % se initializeaza cu 0
  [l c dim] = size(image); % pastrez dimensiunile matricei
  edges = double([0:count_bins] * 256 ) / count_bins; % pastrez limitele interv.
  B = image(:,:,1); % iau doar matricea bidimensionala cu rosu
  [r, edg] = histc(B(:), edges); % se creaza histograma rosu in functie de edges
  B = image(:,:,2);
  [g, edg] = histc(B(:), edges); % se creaza hist verde in functie de edges
  B = image(:,:,3);
  [b, edg] = histc(B(:), edges); % se creaza hist albastru in functie de edges
  
  sol = [r(1:count_bins,1); g(1:count_bins,1); b(1:count_bins,1)]';
  % solutia va fi imbinarea celor 3 vectori
endfunction