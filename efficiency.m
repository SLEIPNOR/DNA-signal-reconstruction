clear;
%% MAK2 1
D(1)=1e-2;k=0.5;
for n=2:15
    
    D(n)=D(n-1)+k*log(1+(D(n-1)/k));
    
end

%% efficiency
for n=2:16
    
   E(n)=(k*log(1+(D(n-1)/k)))/D(n-1);
    
end
  figure(1)
  plot(D(:),E(2:n));
 
  