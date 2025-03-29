function signal = low_pass(signal, fs, cutoff_freq)
  signal = fft(signal);
  [n, ~] = size(signal);
  f = linspace(0, fs, n+1)';
  f = f(1:n);
  mask = f < cutoff_freq;
  signal = signal .* mask;
  signal = ifft(signal);
  % Normalize
  signal = signal / max(abs(signal));
endfunction

