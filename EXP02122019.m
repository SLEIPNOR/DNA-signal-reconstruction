%% 从文本文件中导入数据
% 用于从以下文本文件中导入数据的脚本:
%
%    filename: D:\PG study material\DNA detection\Data\exp02122019.txt
%
% 由 MATLAB 于 2020-02-18 23:50:30 自动生成

%% 设置导入选项并导入数据
clear;
opts = delimitedTextImportOptions("NumVariables", 97);

% 指定范围和分隔符
opts.DataLines = [2, Inf];
opts.Delimiter = "\t";

% 指定列名称和类型
opts.VariableNames = ["CycleFluorescence", "A1SYBRGreenI", "A2SYBRGreenI", "A3SYBRGreenI", "A4SYBRGreenI", "A5SYBRGreenI", "A6SYBRGreenI", "A7SYBRGreenI", "A8SYBRGreenI", "A9SYBRGreenI", "A10SYBRGreenI", "A11SYBRGreenI", "A12SYBRGreenI", "B1SYBRGreenI", "B2SYBRGreenI", "B3SYBRGreenI", "B4SYBRGreenI", "B5SYBRGreenI", "B6SYBRGreenI", "B7SYBRGreenI", "B8SYBRGreenI", "B9SYBRGreenI", "B10SYBRGreenI", "B11SYBRGreenI", "B12SYBRGreenI", "C1SYBRGreenI", "C2SYBRGreenI", "C3SYBRGreenI", "C4SYBRGreenI", "C5SYBRGreenI", "C6SYBRGreenI", "C7SYBRGreenI", "C8SYBRGreenI", "C9SYBRGreenI", "C10SYBRGreenI", "C11SYBRGreenI", "C12SYBRGreenI", "D1SYBRGreenI", "D2SYBRGreenI", "D3SYBRGreenI", "D4SYBRGreenI", "D5SYBRGreenI", "D6SYBRGreenI", "D7SYBRGreenI", "D8SYBRGreenI", "D9SYBRGreenI", "D10SYBRGreenI", "D11SYBRGreenI", "D12SYBRGreenI", "E1SYBRGreenI", "E2SYBRGreenI", "E3SYBRGreenI", "E4SYBRGreenI", "E5SYBRGreenI", "E6SYBRGreenI", "E7SYBRGreenI", "E8SYBRGreenI", "E9SYBRGreenI", "E10SYBRGreenI", "E11SYBRGreenI", "E12SYBRGreenI", "F1SYBRGreenI", "F2SYBRGreenI", "F3SYBRGreenI", "F4SYBRGreenI", "F5SYBRGreenI", "F6SYBRGreenI", "F7SYBRGreenI", "F8SYBRGreenI", "F9SYBRGreenI", "F10SYBRGreenI", "F11SYBRGreenI", "F12SYBRGreenI", "G1SYBRGreenI", "G2SYBRGreenI", "G3SYBRGreenI", "G4SYBRGreenI", "G5SYBRGreenI", "G6SYBRGreenI", "G7SYBRGreenI", "G8SYBRGreenI", "G9SYBRGreenI", "G10SYBRGreenI", "G11SYBRGreenI", "G12SYBRGreenI", "H1SYBRGreenI", "H2SYBRGreenI", "H3SYBRGreenI", "H4SYBRGreenI", "H5SYBRGreenI", "H6SYBRGreenI", "H7SYBRGreenI", "H8SYBRGreenI", "H9SYBRGreenI", "H10SYBRGreenI", "H11SYBRGreenI", "H12SYBRGreenI"];
opts.VariableTypes = ["double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double"];

% 指定文件级属性
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";

% 导入数据
exp02122019 = readtable("D:\PG study material\DNA detection\Data\exp02122019.txt", opts);

%% 转换为输出类型
exp02122019 = table2array(exp02122019);

%% 清除临时变量
clear opts
%% PLot

  No=1;
  i=20;
  figure(1)
  plot(exp02122019 (1:i,1),exp02122019 (1:i,No+1),'k');
%% MAK2 Model
nmax=15;
y = exp02122019(1:i,1:No+1);
Y=y(:,No+1);
%   beta=[0.00004 0.391];
%  beta=nlinfit(n,Y,'MAK2fit',beta);
beta0=[0.1 0.1 0.1 0.5];
beta = lsqcurvefit(@MAK2fit, beta0 , nmax , Y(1:nmax));
%% MAK2 plotting
D(1)=beta(1); k=beta(2);
s=beta(3);
r=beta(4);
for n=2:i
%     
    D(n)=D(n-1)+(k*log(1+(D(n-1)/k)))^exp(s/r);
% D(n)=D(n-1)+k*log(1+(D(n-1)/k))+(log(1+(D(n-1))))^exp(s);
    
end
 hold on
  Xaxis=(1:n);
  plot(Xaxis(:),D(:),'r');
  D=D';
 Rsq = 1 - sum((Y - D).^2)/sum((Y - mean(Y)).^2);
 para(1)= No;
 para(2)=beta(1);
 para(3)=beta(2);
 para(4)=beta(3);
 para(5)=beta(4);
 para(6)=Rsq;
% figure(2)
%   plot(Y,Y);
% hold on
% scatter(Y,D,5,'filled');
%   r=corrcoef(Y,D');
%   r=r(1,2);
Rsq


