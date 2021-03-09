function [Q, R] = Householder(A)
  [n m] = size(A);
  Q = eye(n);
  min = min(n-1,m);
  for j = 1:min
    vj = A(j,j) + sign(A(j,j)) * norm(A(j:n,j));
    v = [zeros(j-1,1); vj; A((j+1):n,j)];
    Hj = eye(n) - 2 * ((v * (v')) / ((v') *v));
    A = Hj * A;
    Q = Q * (Hj');
  endfor
  R = A;
endfunction