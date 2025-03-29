function reduced_mat = preprocess(mat, min_reviews)
  [n, m] = size(mat);
  n2 = 1;
  for i = 1:n
    num = nnz(mat(i, :));
    if num >= min_reviews
        reduced_mat(n2, :) = mat(i, :);
        n2 = n2 + 1;
    endif
  endfor
end
