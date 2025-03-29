function [x, y] = parse_data(filename)
  file = fopen(filename, 'r');
  if file == -1
      error('Unable to open file: %s', filename);
  end

  n = fscanf(file, '%d', 1);
  n = n + 1;
  x = fscanf(file, '%f', [n, 1]);
  y = fscanf(file, '%f', [n, 1]);

  fclose(file);
end
