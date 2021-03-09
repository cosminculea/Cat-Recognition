function [values, colind, rowptr] = matrix_to_csr(A)
  [l c] = size(A);
  nz = 0;
  rowptr(1) = 1;
  for i = 1:l
    for j = 1:c
      if A(i, j) ~= 0
        nz = nz + 1;
        values(nz) = A(i, j);
        colind(nz) = j;
      endif
    endfor
    rowptr(i + 1) = nz + 1;
  endfor
      
endfunction