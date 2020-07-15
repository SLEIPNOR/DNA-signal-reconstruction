clear;
%% MAK2 1
D(1)=1e-2;k=0.5;
for n=2:15
    
    D(n)=D(n-1)+k*log(1+(D(n-1)/k));
    
end
  figure(1)
  Xaxis=(0:n-1);
  plot(Xaxis(:),D(:));
 %% MAK2 2
D(1)=1e-3;k=0.5;
for n=2:15
    
    D(n)=D(n-1)+k*log(1+(D(n-1)/k));
    
end
  hold on;
  plot(Xaxis(:),D(:));
 %% MAK2 3
% D(1)=1e-4;k=0.5;
% for n=2:15
%     
%     D(n)=D(n-1)+k*log(1+(D(n-1)/k));
%     
% end
%   hold on;
%   plot(Xaxis(:),D(:));
  %% MAK2 4
% D(1)=1e-3;k=0.05;
% for n=2:15
%     
%     D(n)=D(n-1)+k*log(1+(D(n-1)/k));
%     
% end
%   hold on;
%   plot(Xaxis(:),D(:));
   %% MAK2 5
% D(1)=1e-3;k=0.005;
% for n=2:15
%     
%     D(n)=D(n-1)+k*log(1+(D(n-1)/k));
%     
% end
%   hold on;
%   plot(Xaxis(:),D(:));
%    axis([0, n-1, 0, 1]);
%   xlabel('cycle');  ylabel('Dn');  title('MAK2');