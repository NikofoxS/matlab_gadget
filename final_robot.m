L1=Link('d', 0, 'a', 0, 'alpha', pi/2);%L1Ϊ����1����a'Ϊ����1���ȣ���d'Ϊ�ؽ�2���1ƫ������alpha'Ϊ�ؽ�2���1��Ť�ǣ���theta��Ϊ�ؽ�1��ת��

L2=Link('d',0.3,'a',0,'alpha',pi/2);
L3=Link('d',0.43,'a',0,'alpha',pi/2);
L4=Link('d',0.15005,'a',0.023,'alpha',-pi/2);
L5=Link('d',0.4318,'a',0,'alpha',pi/2);
L6=Link('d',0,'a',0,'alpha',-pi/2);
L7=Link('d',0,'a',0,'alpha',pi/2);
finalrobot=SerialLink([L1,L2,L3,L4,L5,L6,L7],'name','finalrobot');
finalrobot.links(1,1).offset=pi;%�趨�ؽ�3��ʼλ��
%finalrobot.base=transl(0,-0.23,0)*trotx(pi/2);%�趨�ؽ�1�������ϵ���λ��