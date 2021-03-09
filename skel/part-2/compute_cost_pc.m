function [cost] = compute_cost_pc(points, centroids)
  [nr_points dim] = size(points);
  [NC dim] = size(centroids);
  cost = 0;
   for i = 1:nr_points
      for j = 1:NC % se calculeaza distanta eucl de la fiecare punct la toti
        V = centroids(j, :) - points(i, :); % centroizii
        distances(j) = sqrt(V * V');
      endfor
    
      cost = cost + min(distances); % se aduna distanta minima gasita
    endfor
endfunction

