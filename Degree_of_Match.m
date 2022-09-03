clear all

x=[0.5000, 0.7231, 0.5783]
L=@(x)sigmf(x,[-15,0.3])
M=@(x)gaussmf(x,[0.15,0.5])
H=@(x)sigmf(x,[15,0.7])

R{1}=@(x)max([min(2.*[L(x(1)),L(x(2)),L(x(3))]-1),min(2.*[L(x(1)),L(x(2)),M(x(3))]-1),min(2.*[L(x(1)),L(x(2)),H(x(3))]-1)]);
R{2}=@(x)max([min(2.*[L(x(1)),L(x(2)),L(x(3))]-1),min(2.*[L(x(1)),M(x(2)),L(x(3))]-1),min(2.*[L(x(1)),H(x(2)),L(x(3))]-1)]);
R{3}=@(x)max([min(2.*[L(x(1)),L(x(2)),L(x(3))]-1),min(2.*[M(x(1)),L(x(2)),L(x(3))]-1),min(2.*[H(x(1)),L(x(2)),L(x(3))]-1)]);

R{4}=@(x)max([min(2.*[H(x(1)),H(x(2)),H(x(3))]-1),min(2.*[H(x(1)),H(x(2)),M(x(3))]-1),min(2.*[H(x(1)),H(x(2)),L(x(3))]-1)]);
R{5}=@(x)max([min(2.*[H(x(1)),H(x(2)),H(x(3))]-1),min(2.*[H(x(1)),M(x(2)),H(x(3))]-1),min(2.*[H(x(1)),L(x(2)),H(x(3))]-1)]);
R{6}=@(x)max([min(2.*[H(x(1)),H(x(2)),H(x(3))]-1),min(2.*[M(x(1)),H(x(2)),H(x(3))]-1),min(2.*[L(x(1)),H(x(2)),H(x(3))]-1)]);

R{7}=@(x)max([min(2.*[M(x(1)),M(x(2)),M(x(3))]-1),min(2.*[M(x(1)),M(x(2)),H(x(3))]-1),min(2.*[M(x(1)),M(x(2)),L(x(3))]-1)]);
R{8}=@(x)max([min(2.*[M(x(1)),M(x(2)),M(x(3))]-1),min(2.*[M(x(1)),H(x(2)),M(x(3))]-1),min(2.*[M(x(1)),L(x(2)),M(x(3))]-1)]);
R{9}=@(x)max([min(2.*[M(x(1)),M(x(2)),M(x(3))]-1),min(2.*[H(x(1)),M(x(2)),M(x(3))]-1),min(2.*[L(x(1)),M(x(2)),M(x(3))]-1)]);

R{10}=@(x)max([min(2.*[L(x(1)),M(x(2)),H(x(3))]-1),min(2.*[L(x(1)),H(x(2)),M(x(3))]-1)]);
R{11}=@(x)max([min(2.*[M(x(1)),L(x(2)),H(x(3))]-1),min(2.*[H(x(1)),L(x(2)),M(x(3))]-1)]);
R{12}=@(x)max([min(2.*[M(x(1)),H(x(2)),L(x(3))]-1),min(2.*[H(x(1)),M(x(2)),L(x(3))]-1)]);


for i=1:length(R)
    a(i)=R{i}(x);
end
a
[~,ind]=max(a)
find(a==a(ind))