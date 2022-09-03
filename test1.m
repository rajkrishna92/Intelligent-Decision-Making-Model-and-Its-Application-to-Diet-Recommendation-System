function test1
U =[2 2 3 1 7;7 8 1 7 6;3 4 5 6 8];
X=[0.4 0.8 1 0.7 0.3];
U_size=size(U);

for i=1:U_size(1)

U=[1     1     2     3     4     4     6     1     4     3];
X=[0.2  0.5  0.7   0.9    0.4    0.2   0.4   0.1   1     0.8];
a=U1;
b=unique(U1);
%for i=1
for i=1:length(b)
ind{i}=find(a==b(i));

if length(ind{i})>=1
    m=X(ind{i});
    k=m(1);
    for j=1:length(m)-1
        k=k+m(j+1)-(k*m(j+1));
    end
end

Uf1{i}=[k,b(i)];
end



end