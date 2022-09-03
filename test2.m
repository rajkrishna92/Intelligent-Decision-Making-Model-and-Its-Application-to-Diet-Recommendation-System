function r=test2(U1,X)


U=U1';
U_max=max(max(U));


function p=uf(x,U_max)   
a=x(:,2);
b=unique(a);
for i=1:length(b)
ind{i}=find(a==b(i));

if length(ind{i})>=1
    m=X(ind{i});
    k=m(1);
    for j=1:length(m)-1
        k=k+m(j+1)-(k*m(j+1));
    end
end
 p(i,:)=[k,b(i)/max(b),min(k,b(i)/max(b)),b(i)];   
end
end

r=zeros(1,length(U(1,:)));

for z=1:length(U(1,:))
uff{z}=[X',U(:,z)];
d=uf(uff{z},U_max);
a=d(:,3);
r(z)=sum(a);
end

end