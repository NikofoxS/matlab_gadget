%����������ұ�
%tranimate%����任����
%jtraj(qr, qz, 100)%����任�켣
%clear;
L1 = Link('d', 0.08, 'a', 0, 'alpha', pi/2);%L1Ϊ����1����a'Ϊ����1���ȣ���d'Ϊ�ؽ�2���1ƫ������alpha'Ϊ�ؽ�2���1��Ť�ǣ���theta��Ϊ�ؽ�1��ת��
L2=Link('d',0,'a',0.3,'alpha',-pi/2);
L3=Link('d',0,'a',0,'alpha',pi/2);
L4=Link('d',0.17+0.07,'a',0,'alpha',pi/2);
L5=Link('d',0,'a',0.06,'alpha',0);
roldm=SerialLink([L1,L2,L3,L4,L5],'name','oldm');
roldm.links(1,3).offset=pi/2;%�趨�ؽ�3��ʼ�Ƕ�
roldm.links(1,1).offset=-pi/2;%�趨�ؽ�1��ʼ�Ƕ�
roldm.links(1,4).offset=pi/2;%�趨�ؽ�5��ʼ�Ƕ�
roldm.links(1,5).offset=pi/2;%�趨�ؽ�5��ʼ�Ƕ�
roldm.base=transl(0,-0.23,0)*trotx(pi/2);%�趨�ؽ�1�������ϵ���λ��
%robot.display()%��ʾD-H����
thetam=[0*pi/180, 0*pi/180, 0*pi/180, 0*pi/180, 0*pi/180];
%figure;
%robot.plot(theta1);
%robot.teach(theta1)