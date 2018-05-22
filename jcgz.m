p=[-0.5 -0.5 0.3 -0.1 -0.8; -0.5 0.5 -0.5 1 0];
T=[1 1 0 0 0];
plotpv(p,T);
net=newp([-4 1;-1 5],1);
 hold on
 linehandle=plotpc(net.IW{1},net.b{1});
 net.adaptParam.passes=3;
 linehandle=plotpc(net.IW{1},net.b{1});
 for a=1:25
     [net,Y,E]=adapt(net,p,T);
     linehandle=plotpc(net.IW{1},net.b{1},linehandle);
    drawnow;
 end;