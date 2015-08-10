function [x] = mapWaveformToFeatures(waveform)

sampleRate = 44100;

[cep, aspectrum, pspectrum] = melfcc(waveform, sampleRate, ...
    'wintime', 0.5, ...
    'hoptime', 0.2, ...
    'numcep', 13);
    
x = cep(:);

end
