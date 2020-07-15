function Fn = tanhfitting(beta,Fmax)
n = (1:45)';
Fn=Fmax.*(1/2+tanh(beta(1)*(log(beta(2))-log(n)))/2).^beta(3);
