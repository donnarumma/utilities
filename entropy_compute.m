function Entropy = entropy_compute(p)
% function Entropy = entropy_compute(p)
% Entropy = -sum(p .* log2(p));

Entropy = - sum (p .* log2(p));
return