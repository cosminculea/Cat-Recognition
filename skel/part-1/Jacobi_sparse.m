function [x] = Jacobi_sparse(G_values, G_colind, G_rowptr, c, tol)
  n = length(c);
  x_prev = zeros(n);
  x_curr = zeros(n);
  while (1)
    x_curr = csr_multiplication(G_values, G_colind, G_rowptr, x_prev) + c;
    if norm(x_curr - x_prev) < tol
      break;
    endif
    x_prev = x_curr;
  endwhile
 x = x_curr;
endfunction