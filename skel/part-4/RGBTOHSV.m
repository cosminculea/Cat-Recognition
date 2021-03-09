function [hsv] = RGBTOHSV(rgb)
  [l c dim] = size(rgb);
  rgb = double(rgb) / 255;
  cmin = min(rgb, [], 3);
  cmax = max(rgb, [], 3);
  delta = cmax - cmin;
  
  r = rgb(:, :, 1);
  g = rgb(:, :, 2);
  b = rgb(:, :, 3);
  
  ind_zero = find(~delta);
  delta(ind_zero) = ones(size(ind_zero));

  ind = find(cmax == r);
  r(ind) = 60 * mod((g(ind)-b(ind))./delta(ind), 6);
  
  ind = find(cmax == g);
  r(ind) = 60 * ((b(ind)-r(ind))./delta(ind) + 2);
  
  ind = find(cmax == b);
  r(ind) = 60 * ((r(ind) - g(ind))./delta(ind) + 4);
  
  r(ind_zero) = zeros(size(ind_zero));
  delta(ind_zero) = zeros(size(ind_zero));
  
  ind_zero = find(cmax == 0);
  ind = find(cmax);
  g(ind_zero) = zeros(size(ind_zero));
  g(ind) = delta(ind) ./ cmax(ind);
  r = r / 360;
  b = cmax;
  
  hsv(:, : ,1) = r;
  hsv(:, : ,2) = g;
  hsv(:, : ,3) = b;
  
endfunction