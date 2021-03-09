function [centroids] = clustering_pc(points, NC)
  [nr_points dim] = size(points);
  verify_index = zeros(NC); % pastreaza cate elem se gasesc in fiecare cluster
  for i = 1:NC % se parcurg primele NC puncte
    for j = 1:dim
    centroids(i, j) = points(i, j);
  endfor
  verify_index(i) = verify_index(i) + 1;
endfor

  for i = (NC + 1):nr_points % se parcurg restul punctelor
    if mod(i, NC) == 0
      poz = NC;
    else
      poz = mod(i, NC);
    endif
    
    for j = 1:dim % se face suma pt fiecare coordonata
      centroids(poz, j) = centroids(poz, j) + points(i, j);
    endfor
    verify_index(poz) = verify_index(poz) + 1;
  endfor
  
  for j = 1:NC % se parcurg clusterele pt a face media aritmetica impartind la
    if verify_index(j) > 1 % numarul de elem pastrate in verify_index
      for k = 1:dim
        centroids(j, k) = centroids(j, k) / verify_index(j);
      endfor
    endif
  endfor
  
  centroid_prev = centroids;
  
  while 1 % se vor repeta cat timp centroid_prev != centroids
    verify_index = zeros(NC);
    centroids = zeros([NC dim]);
    for i = 1:nr_points
      for j = 1:NC % se calculeaza distantele euclidiene pt fiecare punct
        V = centroid_prev(j, :) - points(i, :); % la toti centroizii
        distances(j) = sqrt(V * V');
      endfor
      
      [mininum index] = min(distances); % se det distanta minima
      
      if verify_index(index) == 0
        centroids(index, :) = points(i, :);
      else
        for j = 1:dim % se face suma pt fiecare coordonata
          centroids(index, j) = centroids(index, j) + points(i, j);
        endfor
      endif
      verify_index(index) = verify_index(index) + 1;
    endfor
    
    for j = 1:NC
      if verify_index(j) > 1
        for k = 1:dim % se imparte pt a face media aritmetica
          centroids(j, k) = centroids(j, k) / verify_index(j);
        endfor
      endif
    endfor
 
    
    if centroids == centroid_prev
      break;
    endif
    centroid_prev = centroids;
  endwhile
endfunction
