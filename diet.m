function out=diet(x)

[dinner_menu,list,~] = xlsread('Experiment1_GuruMann.xlsx',3);
% %dinner_menu(:,index)=[];
 U1=dinner_menu;
 Y=x;
 X=[Y(1),Y(2),Y(3),Y(4)];
% %X=[.31,.31,.37]
% %---------------Desicion Function---------------------------------
 result1=test2(U1,X);
 out=result1/max(result1);
 
end