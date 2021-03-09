function [A, b] = generate_probabilities_system(rows)
  a_n = 1;
  n = rows * (rows + 1) / 2;
  A = zeros(n);
  for i = 1:(rows-1)
    for j = 1:(i - 1)
      A(a_n + i, a_n) = -1;
      A(a_n, a_n + i) = -1;
      A(a_n + i + 1, a_n) = -1;
      A(a_n, a_n + i + 1) = -1;
      A(a_n + 1, a_n) = -1;
      A(a_n, a_n + 1) = -1;
      a_n = a_n + 1;
    endfor
    A(a_n + i, a_n) = -1;
    A(a_n, a_n + i) = -1;
    A(a_n + i + 1, a_n) = -1;
    A(a_n, a_n + i + 1) = -1;
    a_n = a_n + 1;
  endfor
  
  for j = 1:(rows - 1)
    A(a_n + 1, a_n) = -1;
    A(a_n, a_n + 1) = -1;
    a_n = a_n + 1;
  endfor
  
  A(1, 1) = 4;
  A(2, 2) = 5;
  A(3, 3) = 5;
  a_n = 4;
  for i = 3:(rows - 1)
    A(a_n, a_n) = 5;
    a_n = a_n + 1;
    for j = 2:(i - 1)
      A(a_n, a_n) = 6;
      a_n = a_n + 1;
    endfor
    A(a_n, a_n) = 5;
    a_n = a_n + 1;
  endfor
  
  A(a_n, a_n) = 4;
  a_n = a_n + 1;
  for j = 2:(rows - 1)
      A(a_n, a_n) = 5;
      a_n = a_n + 1;
  endfor
  A(a_n , a_n) = 4;
  b = [zeros([n - rows, 1]); ones([rows, 1])];
endfunction