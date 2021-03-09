function [G_J, c_J] = Jacobi_factorization(A, b)
  N_inv = diag(1./diag(A));
  P = diag(diag(A)) - A;
  G_J = N_inv * P;
  c_J = N_inv * b;
endfunction
