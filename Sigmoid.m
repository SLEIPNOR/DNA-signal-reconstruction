function Fn = Sigmoid(beta,Fmax)
n = (1:50)';
Fn = Fmax./(1+exp(beta(1)*(log(n)-log(beta(2))))).^beta(3);


