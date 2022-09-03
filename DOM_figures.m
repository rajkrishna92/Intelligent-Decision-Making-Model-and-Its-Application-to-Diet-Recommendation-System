L=@(x)sigmf(x,[-15,0.3])
M=@(x)gaussmf(x,[0.15,0.5])
H=@(x)sigmf(x,[15,0.7])
x=[0.5000, 0.7231, 0.5783]
subplot(1,3,1)
fplot(L)
hold on
fplot(M)
fplot(H)
axis([0 1 0 0.06])
title('Conjunction Part (L L L)')
plot(x(1),L(x(1)),'*r')

plot(x(2),L(x(2)),'or')

plot(x(3),L(x(3)),'pr')

legend('Low','Medium','High','Carb','Prot','Fat')
for i=1:length(x)
    text(x(i),L(x(i)),[' ',num2str(L(x(i))),'\rightarrow',num2str(2*L(x(i))-1)])
end
subplot(1,3,2)

fplot(L)
hold on
fplot(M)
fplot(H)
axis([0 1 0 1])
title('Conjunction Part (M L L)')
plot(x(1),M(x(1)),'*r')
text(x(1),M(x(1)),[' ',num2str(M(x(1))),'\rightarrow',num2str(2*M(x(1))-1)])
plot(x(2),L(x(2)),'or')

plot(x(3),L(x(3)),'pr')

legend('Low','Medium','High','Carb','Prot','Fat')
for i=2:length(x)
    text(x(i),L(x(i)),[' ',num2str(L(x(i))),'\rightarrow',num2str(2*L(x(i))-1)])
end

subplot(1,3,3)

fplot(L)
hold on
fplot(M)
fplot(H)
axis([0 1 0 0.06])
title('Conjunction Part (H L L)')
plot(x(1),H(x(1)),'*r')
text(x(1),H(x(1)),[' ',num2str(H(x(1))),'\rightarrow',num2str(2*H(x(1))-1)])
plot(x(2),L(x(2)),'or')

plot(x(3),L(x(3)),'pr')

legend('Low','Medium','High','Carb','Prot','Fat')
for i=2:length(x)
    text(x(i),L(x(i)),[' ',num2str(L(x(i))),'\rightarrow',num2str(2*L(x(i))-1)])
end
