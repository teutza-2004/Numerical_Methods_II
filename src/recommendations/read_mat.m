function mat = read_mat(path)
  data = csvread(path);
  mat = data(2:end, 2:end);
end
