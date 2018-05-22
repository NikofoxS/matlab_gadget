%服务机器人右臂
%tranimate%坐标变换动画
%jtraj(qr, qz, 100)%坐标变换轨迹
%clear;
L1 = Link('d', 0.08, 'a', 0, 'alpha', pi/2);%L1为连杆1，‘a'为连杆1长度，’d'为关节2相对1偏长，‘alpha'为关节2相对1的扭角，’theta’为关节1的转角
L2=Link('d',0,'a',0.3,'alpha',-pi/2);
L3=Link('d',0,'a',0,'alpha',pi/2);
L4=Link('d',0.17+0.07,'a',0,'alpha',pi/2);
L5=Link('d',0,'a',0.06,'alpha',0);
roldm=SerialLink([L1,L2,L3,L4,L5],'name','oldm');
roldm.links(1,3).offset=pi/2;%设定关节3初始角度
roldm.links(1,1).offset=-pi/2;%设定关节1初始角度
roldm.links(1,4).offset=pi/2;%设定关节5初始角度
roldm.links(1,5).offset=pi/2;%设定关节5初始角度
roldm.base=transl(0,-0.23,0)*trotx(pi/2);%设定关节1与基坐标系相对位置
%robot.display()%显示D-H参数
thetam=[0*pi/180, 0*pi/180, 0*pi/180, 0*pi/180, 0*pi/180];
%figure;
%robot.plot(theta1);
%robot.teach(theta1)