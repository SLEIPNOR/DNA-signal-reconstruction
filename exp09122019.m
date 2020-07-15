
clear;
exp2 = importdata("C:\Users\asus\Documents\MATLAB\DNA\Table\Data\exp09122019.txt");
%% 清除临时变量
clear opts
%% PLot
i=1;
y = exp2.data(1:45,2:97);
%% LOOP 1
for No = 41:41
%% MAK2 Model
 if y(45,No) >= 1
     Cy=35;
     figure(1)
  hold on
  plot(exp2.data (1:Cy,1),exp2.data(1:Cy,No+1),'k');
  X=0.0000000005;
  Y=y(1:Cy,No);
  beta=0.05;
 beta=nlinfit(X,Y,'MAK2fit',beta);
%% MAK2 plotting
D(1)=5.0E-10 ; k=real(beta);
for n=2:Cy
    
    D(n)=D(n-1)+k*log(1+(D(n-1)/k));
    
end
 hold on
  Xaxis=(1:n);
  plot(Xaxis(:),D(:),'r');
   xlabel('cycle');  ylabel('Dn');  title('MAK2');
 Rsq = 1 - sum((Y - D').^2)/sum((Y - mean(Y)).^2);
 para(i,1)=No;
 para(i,2)=beta;
 para(i,3)=Rsq;
 para(i,4)=D(1);
 para(i,5)=Cy;
 i=i+1;
% figure(2)
%   plot(Y,Y);
% hold on
% scatter(Y,D,5,'filled');
%   r=corrcoef(Y,D');
%   r=r(1,2);
 end
end

% %% LOOP 2
% for No = 1:28
% %% MAK2 Model
%  if y(35,No) >= 1.5
%      Cy=35;
%      figure(1)
%   hold on
%   plot(exp2.data (1:Cy,1),exp2.data(1:Cy,No+1),'k');
%   X=0.000000001;
%   Y=y(1:Cy,No);
%   beta=0.05;
%  beta=nlinfit(X,Y,'MAK2fit',beta);
% %% MAK2 plotting
% D(1)=0.1*10^-8; k=real(beta);
% for n=2:Cy
%     
%     D(n)=D(n-1)+k*log(1+(D(n-1)/k));
%     
% end
%  hold on
%   Xaxis=(1:n);
%   plot(Xaxis(:),D(:),'r');
%  Rsq = 1 - sum((Y - D').^2)/sum((Y - mean(Y)).^2);
%  para(i,1)=No;
%  para(i,2)=beta;
%  para(i,3)=Rsq;
%  para(i,4)=D(1);
%  para(i,5)=Cy;
%  i=i+1;
% % figure(2)
% %   plot(Y,Y);
% % hold on
% % scatter(Y,D,5,'filled');
% %   r=corrcoef(Y,D');
% %   r=r(1,2);
%  end
% end
% %% LOOP 3
% for No = 1:84
% %% MAK2 Model
%  if y(40,No) >= 0.9523 && y(40,No) <= 1.177
%      Cy=35;
%      figure(1)
%   hold on
%   plot(exp2.data (1:Cy,1),exp2.data(1:Cy,No+1),'k');
%   X=0.0000000001;
%   Y=y(1:Cy,No);
%   beta=0.05;
%  beta=nlinfit(X,Y,'MAK2fit',beta);
% %% MAK2 plotting
% D(1)=0.1*10^-9; k=real(beta);
% for n=2:Cy
%     
%     D(n)=D(n-1)+k*log(1+(D(n-1)/k));
%     
% end
%  hold on
%   Xaxis=(1:n);
%   plot(Xaxis(:),D(:),'r');
%  Rsq = 1 - sum((Y - D').^2)/sum((Y - mean(Y)).^2);
%  para(i,1)=No;
%  para(i,2)=beta;
%  para(i,3)=Rsq;
%  para(i,4)=D(1);
%  para(i,5)=Cy;
%  i=i+1;
% % figure(2)
% %   plot(Y,Y);
% % hold on
% % scatter(Y,D,5,'filled');
% %   r=corrcoef(Y,D');
% %   r=r(1,2);
%  end
% end