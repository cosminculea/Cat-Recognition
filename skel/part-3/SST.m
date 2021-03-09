function [x] = SST(A, b)
  [n m] = size(A); % se calculeaza sistemul superior triunghiular
  x = zeros([m, 1]);
  x(m) = b(m) / A(m, m);
  for j =(m - 1):-1:1
    x(j) = (b(j) - A(j,j+1:m) * x(j+1:m)) / A(j,j);
  endfor
 endfunction