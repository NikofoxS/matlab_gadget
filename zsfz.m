L1 = Link('d', 0, 'a', 0, 'alpha', -pi/2);
L2=Link('d',-0.23,'a',0,'alpha',-pi/2);
L3=Link('d',0,'a',0.3,'alpha',pi/2);
L4=Link('d',0,'a',0,'alpha',pi/2);
L5=Link('d',-0.3,'a',0,'alpha',0);
robot=SerialLink([L1,L2,L3,L4,L5],'name','old');
theta1=[0*pi/180, 0*pi/180, 0*pi/180, 0*pi/180, 0*pi/180];
cy=input('input fs:');
bl1=pi/cy;
bl2=(pi/2)/cy;
bl3=pi/cy;
bl4=pi/cy;
tht1=0-bl1;
tht2=(-pi/2)-bl2;
tht3=(-pi)-bl3;
tht4=(-pi/2)-bl4;
lx=1;
a=zeros((cy+1)^3,5);
b=zeros((cy+1)^3,3);
md=zeros(4,4);
for th1=0:cy
    tht1=tht1+bl1;
    for th2=0:cy
        tht2=tht2+bl2;
        for th3=0:cy
            tht3=tht3+bl3;
             a((lx+1),1)=tht1;
             a((lx+1),2)=tht2;
             a((lx+1),3)=tht3;
             md=robot.fkine([tht1,tht2,tht3,0,0]);
             b((lx+1),1)=md.t(1,1);
             b((lx+1),2)=md.t(2,1);
             b((lx+1),3)=md.t(3,1);
             lx=lx+1;
           % for th4=0:cy
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
%scatter3(b(:,1),b(:,2),b(:,3),'.')