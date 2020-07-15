clear;
exp2 = importdata("C:\Users\asus\Documents\MATLAB\DNA\Table\Data\exp13122019.txt");
y = exp2.data(1:50,2:29);
%% Sigmoid Model
i=1;
for no = 6
    if y(50,no) > 0
  figure(1)
  hold on
  plot(exp2.data (:,1),y(:,no),'k'); 
  FnO(1,i) = no;
  FnO(2:51,i) = y(:,no);
  n = exp2.data (:,1);
  Y = y(:,no);
  Fmax = max(Y);
% beta = nlinfit(Fmax,Y,@Sigmoid,[0.01 0.01 0.038]);
beta = nlinfit(Fmax,Y,@tanhfitting,[0.01 0.01 0.25]);
% Fn = Fmax./(1+exp(beta(1)*(log(n)-log(beta(2))))).^beta(3);
Fn=Fmax.*((1/2+tanh(beta(1)*(log(beta(2))-log(n)))/2).^beta(3));
 Fn=real(Fn);
 FnF(1,i) = no;
 FnF(2:51,i) = Fn;
figure(1)
  hold on
  plot(n,Fn); 
  Rsq = 1 - sum((Y - Fn).^2)/sum((Y - mean(Y)).^2);
 para(i,1)= no;
 para(i,2)=beta(1);
 para(i,3)=beta(2);
 para(i,4)=beta(3);
 para(i,5)=Rsq;
 i=i+1;
    end
end
para = real(para);