function x_scaled=rescaleANumber(x,i2, i1)
% starting interval i1=[a1,b1]
% ending   interval i2=[a2,b2]
a2 = min(i2(:));
b2 = max(i2(:));
try
    a1=min(i1(:));
    b1=max(i2(:));
catch
    a1=min(x(:));
    b1=max(x(:));
end
if b2-a2>0 && b1-a1 >0
    x_scaled = (x-a1)*(b2-a2)/(b1-a1) + a2;
else
    x_scaled=[];
end