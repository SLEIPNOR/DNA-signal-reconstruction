clear;
x=(-50:50)';
q=-14.3353462304345 ;s=2.57103233070623 ;r=36.0781632227066 ;
y1=1/2+tanh(x/2)/2;
y2=1./(1+exp(-x));
y1=(1/2+tanh(x/2)/2);
y2=1./(1+exp(-x));
plot(x,y1);
hold on
plot(x,y2);