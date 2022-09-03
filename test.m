function test

U =[2 2 3 1 7;7 8 1 7 6;3 4 5 6 8];

X=[0.4 0.8 1 0.7 0.3];

size_U=size(U);
utility_associate=cell(size(U));

for i=1:size_U(1)
    for j=1:size_U(2)
     utility_associate{i,j}=[X(j),U(i,j)];    
    end
uf{i}=utility_associate(i,:);
end
c=[0.2  0.5  0.7   0.9    0.4    0.2   0.4   0.1   1     0.8];
a=[1     1     2     3     4     4     6     1     4     3];
b=unique(a);

for i=1
%for i=1:length(b)
ind{i}=find(a==b(i));

if length(ind{i})>1
    m=c(ind{i});
    k=m(1);
    for j=1:length(m)-1
        k=k+m(j+1)-(k*m(j+1));
    end
end
end
c(ind{1})
if length(ind{1})>1
    m=c(ind{1})
    k=m(1);
    for j=1:length(m)-1
        k=k+m(j+1)-(k*m(j+1));
    end
end

end