%�����������ұ����⣬����4��5�ؽ��ݶ�����.�õ�����aΪ�ؽڽǶ��󣬾���bΪĩ��λ����
%tranimate%����任����
%jtraj(qr, qz, 100)%����任�켣
%clear;
L1=Link('d', 0.08, 'a', 0, 'alpha', pi/2);%L1Ϊ����1����a'Ϊ����1���ȣ���d'Ϊ�ؽ�2���1ƫ������alpha'Ϊ�ؽ�2���1��Ť�ǣ���theta��Ϊ�ؽ�1��ת��
L2=Link('d',0,'a',0.3,'alpha',-pi/2);
L3=Link('d',0,'a',0,'alpha',pi/2);
L4=Link('d',0.17+0.07,'a',0,'alpha',pi/2);
L5=Link('d',0,'a',0.06,'alpha',0);
roldm=SerialLink([L1,L2,L3,L4,L5],'name','oldm');
roldm.links(1,3).offset=pi/2;%�趨�ؽ�3��ʼλ��
roldm.links(1,1).offset=-pi/2;%�趨�ؽ�1��ʼλ��
roldm.links(1,4).offset=pi/2;%�趨�ؽ�5��ʼλ��
roldm.links(1,5).offset=pi/2;%�趨�ؽ�5��ʼλ��
roldm.base=transl(0,-0.23,0)*trotx(pi/2);%�趨�ؽ�1�������ϵ���λ��
%roldm.display()%��ʾD-H����
thetam=[0*pi/180, 0*pi/180, 0*pi/180, 0*pi/180, 0*pi/180];
cy=input('input fs:');%������ؽڲ�����
bl1=(pi/2)/cy;%�ؽ�1�������0�ȵ�90�ȣ�
bl2=(pi/2)/cy;%�ؽ�2���������0�ȵ�90�ȣ�
bl3=(3*pi/2)/cy;%�ؽ�3���������-135�ȵ�135�ȣ�
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
           % for th4=0:cy %��ؽڲ�Ӱ��ĩ��λ��
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