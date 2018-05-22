%求服务机器人右臂正解，其中4和5关节暂定不动.得到矩阵a为关节角度阵，矩阵b为末端位置阵
%tranimate%坐标变换动画
%jtraj(qr, qz, 100)%坐标变换轨迹
%clear;
L1=Link('d', 0.08, 'a', 0, 'alpha', pi/2);%L1为连杆1，‘a'为连杆1长度，’d'为关节2相对1偏长，‘alpha'为关节2相对1的扭角，’theta’为关节1的转角
L2=Link('d',0,'a',0.3,'alpha',-pi/2);
L3=Link('d',0,'a',0,'alpha',pi/2);
L4=Link('d',0.17+0.07,'a',0,'alpha',pi/2);
L5=Link('d',0,'a',0.06,'alpha',0);
roldm=SerialLink([L1,L2,L3,L4,L5],'name','oldm');
roldm.links(1,3).offset=pi/2;%设定关节3初始位置
roldm.links(1,1).offset=-pi/2;%设定关节1初始位置
roldm.links(1,4).offset=pi/2;%设定关节5初始位置
roldm.links(1,5).offset=pi/2;%设定关节5初始位置
roldm.base=transl(0,-0.23,0)*trotx(pi/2);%设定关节1与基坐标系相对位置
%roldm.display()%显示D-H参数
thetam=[0*pi/180, 0*pi/180, 0*pi/180, 0*pi/180, 0*pi/180];
cy=input('input fs:');%输入各关节采样率
bl1=(pi/2)/cy;%关节1活动变量（0度到90度）
bl2=(pi/2)/cy;%关节2活动变量：（0度到90度）
bl3=(3*pi/2)/cy;%关节3活动变量：（-135度到135度）
%bl4=pi/cy;
tht1=0-bl1;
tht2=0-bl2;
tht3=(-3*pi/4)-bl3;
%tht4=(-pi/2)-bl4;
lx=1;
a=zeros((cy+1)^3,5);
b=zeros((cy+1)^3,5);
md=zeros(4,4);
for gj1=0:cy
    tht1=tht1+bl1;
    if (gj1==cy)
        tht1=0-bl1;
    end
    for gj2=0:cy
        tht2=tht2+bl2;
        if (gj2==cy)
            tht2=0-bl2;
        end
        for gj3=0:cy
            tht3=tht3+bl3;
             a(lx,1)=tht1;
             a(lx,2)=tht2;
             a(lx,3)=tht3;
             md=roldm.fkine([tht1,tht2,tht3,0,0]);
             b(lx,1)=md.t(1,1);
             b(lx,2)=md.t(2,1);
             b(lx,3)=md.t(3,1);
             lx=lx+1;
             if (gj3==cy)
                 tht3=(-3*pi/4)-bl3;
             end
           % for th4=0:cy %这关节不影响末端位置
            %    tht4=tht4+bl4;
             %   a((lx+1),1)=tht1;
              %  a((lx+1),2)=tht2;
               % a((lx+1),3)=tht3;
                %a((lx+1),4)=tht4;
                %lx=lx+1;
            %end
        end
    end
end
a(:,4)=0;
a(:,5)=0;
b(:,4)=0;
b(:,5)=0;
%scatter3(b(:,1),b(:,2),b(:,3),'k','.')