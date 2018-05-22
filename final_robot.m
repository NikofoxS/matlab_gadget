L1=Link('d', 0, 'a', 0, 'alpha', pi/2);%L1为连杆1，‘a'为连杆1长度，’d'为关节2相对1偏长，‘alpha'为关节2相对1的扭角，’theta’为关节1的转角

L2=Link('d',0.3,'a',0,'alpha',pi/2);
L3=Link('d',0.43,'a',0,'alpha',pi/2);
L4=Link('d',0.15005,'a',0.023,'alpha',-pi/2);
L5=Link('d',0.4318,'a',0,'alpha',pi/2);
L6=Link('d',0,'a',0,'alpha',-pi/2);
L7=Link('d',0,'a',0,'alpha',pi/2);
finalrobot=SerialLink([L1,L2,L3,L4,L5,L6,L7],'name','finalrobot');
finalrobot.links(1,1).offset=pi;%设定关节3初始位置
%finalrobot.base=transl(0,-0.23,0)*trotx(pi/2);%设定关节1与基坐标系相对位置