 function [percentage] = evaluate(path_to_testset, w, histogram, count_bins)
  [X y] = preprocess(path_to_testset, histogram, count_bins);
  [nr_images c] = size(X);
  X = (X - repmat(mean(X), nr_images, 1)) ./ repmat(std(X), nr_images, 1);
  sum = 0; % pe acelasi principu ca in problema 3
  for i = 1:nr_images
    verify = w' * [X(i, :) 1]';
    
    if (verify >= 0) && (y(i) == 1)
      sum = sum + 1;
    endif
    
    if (verify < 0 ) && (y(i) == -1)
      sum = sum + 1;
    endif
   
  endfor
 percentage = sum / nr_images;
endfunction