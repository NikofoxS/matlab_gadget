%�����󱣴�Ϊtxt��ʽ�ڹ����ļ����¡�
function  savetxt(matrix)
fid=fopen('thedata.txt','wt');
[m,n]=size(matrix);
for i=1:1:m
    for j=1:1:n
        if j==n
            fprintf(fid,'%f\n',matrix(i,j));
        else
            fprintf(fid,'%f\t',matrix(i,j));
        end
    end
end
fclose(fid);