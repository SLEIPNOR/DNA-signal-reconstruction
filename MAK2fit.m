function D=MAK2fit(beta,nmax)
 k=beta(2);
 s=beta(3);
 r=beta(4);
  D(1)=beta(1);
  for i=2:nmax
    D(i)=D(i-1)+(k*log(1+(D(i-1)/k)))^exp(s/r);
%       D(i)=D(i-1)+k*log(1+(D(i-1)/k))+log(1+(D(i-1)))^exp(s);
  end
  D=D';
  