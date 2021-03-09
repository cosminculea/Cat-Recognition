function [hsv] = RGBTOHSV(rgb)
  [l c dim] = size(rgb);
  rgb = double(rgb) / 255;
  cmin = min(rgb,[],3); % se pastreaza minimul din fiecare pixel intre r g b
  cmax = max(rgb,[],3); % se pastreaza maximul din fiecare pixel intre r g b
  delta = cmax - cmin;
  
  r = rgb(:,:,1); % pastram intr o matrice doar rosul
  g = rgb(:,:,2); % pastram intr o matrice doar verdele
  b = rgb(:,:,3); % pastram intr o matrice doar albastrul
  
  ind_zero = find(~delta); % se pastreaza indexurile elementelor nule
  delta(ind_zero) = ones(size(ind_zero)); % si se pune 1 pt a se putea imparti

  ind = find(cmax == r); % se cauta indexurile cu cmax == r
  r(ind) = 60 * mod((g(ind)-b(ind))./delta(ind), 6); % se calc conform formulei
  
  ind = find(cmax == g); % se cauta indexurile cu cmax == g
  r(ind) = 60 * ((b(ind)-r(ind))./delta(ind) + 2); % se calc conform formulei
  
  ind = find(cmax == b); % se cauta indexurile cu cmax == b
  r(ind) = 60 * ((r(ind) - g(ind))./delta(ind) + 4); % se calc conform formulei
  
  r(ind_zero) = zeros(size(ind_zero)); % se pune iar 0 pe locurile din ind_zero
  delta(ind_zero) = zeros(size(ind_zero));
  
  ind_zero = find(cmax == 0);
  ind = find(cmax);
  g(ind_zero) = zeros(size(ind_zero)); % in locurile cu cmax == 0 se pune 0 in g
  g(ind) = delta(ind) ./ cmax(ind); % altfel formula
  r = r / 360;
  b = cmax;
  
  hsv(:,:,1) = r; % se creaza matricea tridimensionala
  hsv(:,:,2) = g;
  hsv(:,:,3) = b;
  
endfunction