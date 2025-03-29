function x = oscillator(freq, fs, dur, A, D, S, R)
  n = round(dur * fs);
  t = linspace(0, dur, n + 1)';
  t = t(1:n);
  sin_wave = sin(2*pi*freq*t);

  attack_nr = floor(A * fs);
  decay_nr = floor(D * fs);
  sustain_nr = floor(S * fs);
  release_nr = floor(R * fs);

  attack = linspace(0, 1, attack_nr);
  decay = linspace(1, S, decay_nr);
  sustain = S * ones(1, sustain_nr);
  release = linspace(S, 0, release_nr);

  e = zeros(1, n);
  envelope = [attack, decay, sustain, release, e];
  envelope = envelope(1:n)';

  x = sin_wave .* envelope;
endfunction

