clear;
    clc;
    A =[5.9418398977142772e+002 0 3.1950000000000000e+002;
        0    5.941839897714e+002 2.3950000000000000e+002;
        0 0 1];
    D = [6.7442695842244271e-002 2.4180872220967919e-001 0 0 -3.3970575589699975e-001];
    fx = A(1,1);
    fy = A(2,2);
    cx = A(1,3);
    cy = A(2,3);
    k1 = D(1);
    k2 = D(2);
    k3 = D(5);
    p1 = D(3);
    p2 = D(4);

    K = A;
    I_d = imread('chessboard.png');
    I_d = rgb2gray(I_d);
    I_d = im2double(I_d);

    I_r = zeros(size(I_d));

    %ͼ������ϵ�;���ı�ʾ���෴��
    %[row,col] = find(X)�����갴���е�˳�����У������ú�reshape()ƥ�����Ӧ��ͼ�����
    [v, u] = find(~isnan(I_r));

    % XYZc ���������ϵ��ֵ�������Ѿ���һ���ˣ���Ϊû�г˱�������
    %��ʽ s[u v 1]' = A*[Xc Yc Zc]' ������sΪ�������ӣ����ӱ������ӣ�Zc��Ϊ1�����Դ�ʱ��Xc�����( Xc/Zc )
    XYZc= inv(A)*[u v ones(length(u),1)]';

    % ��ʱ��x��y��û�л����
    r2 = XYZc(1,:).^2+XYZc(2,:).^2;
    x = XYZc(1,:);
    y = XYZc(2,:);

    % x��y���л����
    x = x.*(1+k1*r2 + k2*r2.^2) + 2*p1.*x.*y + p2*(r2 + 2*x.^2);
    y = y.*(1+k1*r2 + k2*r2.^2) + 2*p2.*x.*y + p1*(r2 + 2*y.^2);

    % (u, v) ��Ӧ�Ļ������� (u_d, v_d)
    u_d = reshape(fx*x + cx,size(I_r));
    v_d = reshape(fy*y + cy,size(I_r));

    % ���Բ�ֵ���ǻ����ͼ��
    I_r = interp2(I_d, u_d, v_d);
    %�Ա�ͼ��
    subplot(121);     
        imagesc(I_d);
        title('����ԭͼ��');
    subplot(122);
        imagesc(I_r);
        title('У����ͼ��');