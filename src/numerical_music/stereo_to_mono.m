function mono = stereo_to_mono(stereo)
  [n, m] = size(stereo);
  if (n == 1)
    mono = stereo';
  elseif (m == 1)
    mono = stereo;
  else
    mono = mean(stereo');
    mono = mono';
  endif
  % Normalize
  mono = mono / max(abs(mono));
endfunction

