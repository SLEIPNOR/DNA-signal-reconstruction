clear;
exp2 = importdata("C:\Users\asus\Documents\MATLAB\DNA\Table\Data\exp13122019.txt");
exp3 = importdata("C:\Users\asus\Documents\MATLAB\DNA\Table\Data\fitting13.txt");
No = exp3(:,1);
k = exp3(:,2);
D1T = exp3(:,4);
Cy = exp3(:,5);
for j = 1 : length(k)
    D=0;
    D(1)=D1T(j);
for n = 2:Cy(j)
    
    D(n)=D(n-1)+k(j)*log(1+(D(n-1)/k(j)));
    
end
DT(1:max(Cy),j) = [ D' ; zeros(max(Cy)-length(D'),1)];
end
for i = 1:length(No)
   DO(1,i) = No(i);
   DO(2:max(Cy)+1,i) = [exp2.data(1:Cy(i),No(i)+1) ; zeros(max(Cy)-length(exp2.data(1:Cy(i),No(i)+1)),1)];
   DF(1,i) = No(i);
   DF(2:max(Cy)+1,i) = [DT(1:Cy(i),i) ; zeros(max(Cy)-length(DT(1:Cy(i),i)),1)];
end