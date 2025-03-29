function similarity = cosine_similarity(A, B)
  A = A / abs(max(A));
  B = B / abs(max(B));

  similarity = dot(A, B) / (norm(A) * norm(B));
end
