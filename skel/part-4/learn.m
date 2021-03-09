function [w] = learn(X, y, lr, epochs)
  [rows cols] = size(X);
  X = (X - repmat (mean (X), rows, 1)) ./ repmat (std (X), rows, 1);
  X = [X ones([rows 1])]; % am scalat X conform formulei ++ o coloana de 1
  [rows cols] = size(X);
  w = (-0.1 + 0.2 * rand(cols, 1)); % am folosit o formula pt a-mi genera numere
  for i = 1:epochs                  % random intre -1 si 1
    random = randi([1, rows], 1, 64); % am pastrat linii random din X
    X_batch = X(random, :);
    y_batch = y(random);
    
    x = sum ( repmat(X_batch * w - y_batch, 1, cols) .* X_batch);
    w = w - lr * x' / rows; % am rezolvat conform formulelor din enunt
  endfor
  
  
endfunction
