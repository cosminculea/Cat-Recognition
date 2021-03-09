function [w] = learn(X, y)
  [l, c] = size(X);
  Xx = [X, ones([l 1])];
  [Q R] = Householder(Xx);
  y = Q' * y;
  w = SST(R,y);
end
