Lo1= Link('d',0,'a',0,'alpha',-pi/2);
Lo2=Link('d',-0.23,'a',0,'alpha',-pi/2);
Lo3=Link('d',0,'a',0.3,'alpha',pi/2);
Lo4=Link('d',0,'a',0,'alpha',pi/2);
Lo5=Link('d',-0.3,'a',0,'alpha',0);
rolds=SerialLink([Lo1,Lo2,Lo3,Lo4,Lo5],'name','olds');
thetas=[0*pi/180,0*pi/180,0*pi/180,0*pi/180,0*pi/180];