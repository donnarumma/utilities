function s=generateRandomString(N)
% mix numbers and characters -> use characters
STRING_SET = char(['A':'Z' 'a':'z' '0':'9']) ;
NUM_SET = length(STRING_SET) ;
try
    N;
catch
    N = 20 ; % pick N numbers
end    
%i = ceil(NUM_SET*rand(1,N)) ; % with repeat
i = randi(NUM_SET,1,N);
s = STRING_SET(i) ;