function errorbar_datetime(X,Y,S,arg1,arg2)
% S=3*S;
hold on;
for i=1:length(X)
    plot([X(i),X(i)],[Y(i)-S(i),Y(i)+S(i)],'linewidth',1,arg1,arg2);
%     plot([X(i),X(i)],[Y(i)-S(i),Y(i)+S(i)],'+','linewidth',1,arg1,arg2);
%     text(X(i),Y(i)-S(i),'-')
%     l1=line([X(i) X(i)],[Y(i)-S(i), Y(i)+S(i)]);
%     hold on;
    errx=nanmean(abs(diff(X)));
    sf=0.3;
    line([X(i)-sf*errx, X(i)+sf*errx],[Y(i)-S(i) Y(i)-S(i)],arg1,arg2);
    line([X(i)-sf*errx, X(i)+sf*errx],[Y(i)+S(i) Y(i)+S(i)],arg1,arg2);
end
