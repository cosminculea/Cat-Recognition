function [percentage] = evaluate(path_to_testset, w, histogram, count_bins)
  [X y] = preprocess(path_to_testset, histogram, count_bins);
  [nr_images c] = size(X); % se preproceseaza X si y pt a determina sistemul
  sum = 0;
  for i = 1:nr_images % pt fiecare imagine
    verify = w' * [X(i, :) 1]'; % se verifica linia coresp imaginii din sistem
    
    if (verify >= 0) && (y(i) == 1)
      sum = sum + 1; % se aduna imaginea daca ea s-a gasit a fi cu pisici
    endif % si conform sistemului ea chiar era cu pisici(verificare y)
    
    if (verify < 0 ) && (y(i) == -1)
      sum = sum + 1; % se aduna imaginea daca ea s-a gasit a fi fara pisici
    endif % si conform sistemului ea chiar era cu  fara pisici(verificare y)

   
  endfor
  
 percentage = sum / nr_images; % se calc procentajul impartind la numarul total
                               % de pisici
endfunction