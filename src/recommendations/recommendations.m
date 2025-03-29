function recoms = recommendations(path, liked_theme, num_recoms, min_reviews, num_features)
  mat = read_mat(path);
  mat = preprocess(mat, min_reviews);
  [U, S, V] = svds(mat, num_features);
  liked = V(liked_theme, :);
  [n, ~] = size(V);
  for i = 1:n
    if i == liked_theme
        similarity(i) = -Inf;
    else
        similarity(i) = cosine_similarity(liked, V(i, :));
    endif
  endfor
  [~, recoms] = sort(similarity, 'descend');
  recoms = recoms(1:num_recoms);
endfunction
