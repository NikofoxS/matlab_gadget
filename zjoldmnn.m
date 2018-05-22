na=input('input joint:');
nb=input('input endmost:');
mdzb=zeros(3,1);
mdzb(1,1)=input('input axis x:');
mdzb(2,1)=input('input axis y:');
mdzb(3,1)=input('input axis z:');
jo=na(:,1:3);
en=nb(:,1:3);
nj=dist(en,mdzb);
bpz=input('input bias:');%50
chang=length(a);
jx=1;
uj=zeros(chang,1);
for jx=1:chang
    uj(jx,1)=exp(-(nj(jx,1)*bpz)^2);
end
scc=zeros(chang,3);
for jx2=1:chang
    scc(jx2,1)=uj(jx2,1)*jo(jx2,1);
    scc(jx2,2)=uj(jx2,1)*jo(jx2,2);
    scc(jx2,3)=uj(jx2,1)*jo(jx2,3);
end
nc=(sum(scc))/(sum(uj));
display(nc);