function [S f t] = spectrogram(signal, fs, window_size)
  [n, ~] = size(signal);
  window_nr = floor(n / window_size);
  S = zeros(window_size, window_nr);
  f = linspace(0, fs/2, window_size+1)';
  f = f(1:window_size);
  t = linspace(0, (window_nr - 1) * (window_size / fs), window_nr)';

  hann = hanning(window_size);
  for i = 1:window_nr
    start_index = (i - 1) * window_size + 1;
    end_index = start_index + window_size - 1;
    window = signal(start_index:end_index);

    window = window .* hann;
    window = fft(window, window_size * 2);
    window = window(1:window_size);
    S(:, i) = abs(window);
  endfor
endfunction

