global L1 L2 L3 L0 a
t = xlsread('spring_test',3,'C1:G7000');
a=0.05;%m 
L0=0.107;%m
radio=0.01;%m radio acople giratorio
for s = 1:7000
L1=L0-(deg2rad(t(s,1))*radio);
L2=L0-(deg2rad(t(s,3))*radio);
L3=L0-(deg2rad(t(s,5))*radio);
options =optimoptions('fsolve','MaxFunctionEvaluations',1000000,'MaxIterations',1000000);
      fun = @directa;
      x0 = [1 3 0.1];
      x1(s,:)= rad2deg(fsolve(fun,x0,options)); 
      x1(s,3)=deg2rad(x1(s,3));
      %1era_columna    2da_columna    3era_columna
      %inclinacion     orientacio       L0
end