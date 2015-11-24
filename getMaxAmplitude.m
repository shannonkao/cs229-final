function [max_ampl] = getMaxAmplitude(data)
    max_ampl = norm(max(data(3),[],2) - min(data(3),[],2));
end