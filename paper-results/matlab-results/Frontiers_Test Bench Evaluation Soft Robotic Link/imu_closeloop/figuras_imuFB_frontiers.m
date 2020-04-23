

%%
%Figuras para : frontierstest.cpp
%datos: t, inc, incSensor, ori, oriSensor, ierror, cs1, cs2, cs3, pos1,
%pos2, pos3.
filename0='video000.csv';  %0gr
filename2='video200.csv';   %200gr
filename4='video400.csv';   %400gr
filename6='video600.csv';   %600gr
filename8='video800.csv';   %800gr
filename1='video1000.csv'; %1kg

data0=csvread(filename0,1);
data2=csvread(filename2,1);
data4=csvread(filename4,1);
data6=csvread(filename6,1);
data8=csvread(filename8,1);
data1=csvread(filename1,1);

%%
%data=cat(6,[csvread(filename0,1)],[csvread(filename2,1)],[csvread(filename4,1)],[csvread(filename6,1)],[csvread(filename8,1)],[csvread(filename1,1)]);
time=zeros(length(data0),1);
for i=2:1:length(data0)
    time(1)=0.02;
    time(i)=time(i-1)+0.02;   
end
incl=data0(:,2);
orient=(data0(:,4));%*(180/pi));

%%
%inclinacion
%
figure();
hold on
grid on
plot(time,data0(:,3))
plot(time,data2(:,3))
plot(time,data4(:,3))
plot(time,data6(:,3))
plot(time,data8(:,3))
plot(time,data1(:,3))
plot(time,incl,'k');
legend({'0gr','200gr','400gr','600gr','800gr','1000gr','Target'},'location','southeast');
%legend({'200gr','400gr','600gr','800gr','1000gr','Target'},'location','southeast');
xlabel('time (s)');
ylabel('pos (deg)');
title('Inclination - Sensor')

%%
% Orientacion

% eliminar los saltos entre 0-360
for i=1:1:length(data0)
    if data0(i,5)>=250
        data0(i,5)=0;
    else
        data0(i,5)=data0(i,5);
    end
end
for i=1:1:length(data2)
    if data2(i,5)>=250
        data2(i,5)=0;
    else
        data2(i,5)=data2(i,5);
    end
end
for i=1:1:length(data4)
    if data4(i,5)>=250
        data4(i,5)=0;
    else
        data4(i,5)=data4(i,5);
    end
end
for i=1:1:length(data6)
    if data6(i,5)>=250
        data6(i,5)=0;
    else
        data6(i,5)=data6(i,5);
    end
end
for i=1:1:length(data8)
    if data8(i,5)>=250
        data8(i,5)=0;
    else
        data8(i,5)=data8(i,5);
    end
end
for i=1:1:length(data1)
    if data1(i,5)>=250
        data1(i,5)=0;
    else
        data1(i,5)=data1(i,5);
    end
end
figure();
hold on
grid on
%plot(flipdim(time,1),ori_angle1)%orientacion desfasada
%plot(flipdim(time,1),ori_angle2)%orientacion desfasada

plot(time,data0(:,5))
plot(time,data2(:,5))
plot(time,data4(:,5))
plot(time,data6(:,5))
plot(time,data8(:,5))
plot(time,data1(:,5))
plot(time,orient,'k');
legend({'0gr','200gr','400gr','600gr','800gr','1000gr','Target'},'location','southeast');
%legend({'200gr','400gr','600gr','800gr','1000gr','Target'},'location','northeast');
xlabel('time (s)');
ylabel('pos (deg)');
title('Orientation - Sensor')

%% Señales de control
figure(); %
sgtitle('Control Signals')

% subplot(2,3,1)% 0gr Cs1, Cs2, Cs3
% hold on
% grid on
% plot(time,(data0(:,7)*(180/pi)))
% plot(time,(data0(:,8)*(180/pi)))
% plot(time,(data0(:,9)*(180/pi)))
% hleg=legend('Motor 1', 'Motor 2','Motor 3','location','southeast')
% htitle = get(hleg,'Title');
% set(htitle,'String','0gr payload')
% xlabel('time (s)');
% ylabel('pos (deg)');

subplot(2,3,1)% 100gr Cs1, Cs2, Cs3
hold on
grid on
plot(time,(data2(:,7)*(180/pi)))
plot(time,(data2(:,8)*(180/pi)))
plot(time,(data2(:,9)*(180/pi)))
hleg=legend('Motor 1', 'Motor 2','Motor 3','location','southeast')
htitle = get(hleg,'Title');
set(htitle,'String','200gr payload')
xlabel('time (s)');
ylabel('pos (deg)');

subplot(2,3,2)% 200gr Cs1, Cs2, Cs3
hold on
grid on
plot(time,(data4(:,7)*(180/pi)))
plot(time,(data4(:,8)*(180/pi)))
plot(time,(data4(:,9)*(180/pi)))
hleg=legend('Motor 1', 'Motor 2','Motor 3','location','southeast')
htitle = get(hleg,'Title');
set(htitle,'String','400gr payload')
xlabel('time (s)');
ylabel('pos (deg)');

subplot(2,3,3)% 300gr Cs1, Cs2, Cs3
hold on
grid on
plot(time,(data6(:,7)*(180/pi)))
plot(time,(data6(:,8)*(180/pi)))
plot(time,(data6(:,9)*(180/pi)))
hleg=legend('Motor 1', 'Motor 2','Motor 3','location','southeast')
htitle = get(hleg,'Title');
set(htitle,'String','600gr payload')
xlabel('time (s)');
ylabel('pos (deg)');

subplot(2,3,4)% 400gr Cs1, Cs2, Cs3
hold on
grid on
plot(time,(data8(:,7)*(180/pi)))
plot(time,(data8(:,8)*(180/pi)))
plot(time,(data8(:,9)*(180/pi)))
hleg=legend('Motor 1', 'Motor 2','Motor 3','location','southeast')
htitle = get(hleg,'Title');
set(htitle,'String','800gr payload')
xlabel('time (s)');
ylabel('pos (deg)');

subplot(2,3,5)% 500gr Cs1, Cs2, Cs3
hold on
grid on
plot(time,(data1(:,7)*(180/pi)))
plot(time,(data1(:,8)*(180/pi)))
plot(time,(data1(:,9)*(180/pi)))
hleg=legend('Motor 1', 'Motor 2','Motor 3','location','southeast')
htitle = get(hleg,'Title');
set(htitle,'String','1000gr payload')
xlabel('time (s)');
ylabel('pos (deg)');


%% error inclinacion
t=time(length(time));

figure();
hold on
grid on
%plot(time,(data0(:,6)))
plot(time,(data2(:,6)))
plot(time,(data4(:,6)))
plot(time,(data6(:,6)))
plot(time,(data8(:,6)))
plot(time,(data1(:,6)))
plot(time,incl,'--k');
%hleg=legend('0gr payload','200gr payload','400gr payload','600gr payload','800gr payload','1kg payload','Target','location','northeast')
hleg=legend('200gr payload','400gr payload','600gr payload','800gr payload','1kg payload','Target','location','northeast')
%htitle = get(hleg,'Title');
%set(htitle,'String','Inclination error')
title('Inclination Error');
xlabel('time (s)');
ylabel('(deg)');
axis([0 t -3.8 20.5]);

%% Encoders
%concat=cat(6,data0,data2,data4,data6,data8,data1);
concat=cat(5,data2,data4,data6,data8,data1);
global L1 L2 L3 L0 a
%t = xlsread('spring_test',3,'C1:G7000');
a=0.05;%m 
L0=0.1085;%m
radio=0.0075;%m radio acople giratorio 0.0075
n=5;%numero de puebas
k_inc=zeros(length(time),n);
k_ori=zeros(length(time),n);

for i=1:n 
    
for s = 1:length(time)
L1=L0-((concat(s,10,i)*radio));
L2=L0-((concat(s,11,i)*radio));
L3=L0-((concat(s,12,i)*radio));
options =optimoptions('fsolve','MaxFunctionEvaluations',1000000,'MaxIterations',1000000);
      fun = @directa;
      %x0 = [1 3 0.1];
      x0 = [0.01 0.01 0.1]; %condiciones iniciales [incli, orient, L0] rad
      x1(s,:)= rad2deg(fsolve(fun,x0,options)); 
      x1(s,3)=deg2rad(x1(s,3));
      k_inc(s,i)=x1(s,1);
      k_ori(s,i)=x1(s,2);
      %1era_columna    2da_columna    3era_columna
      %inclinacion     orientacio       L0
end
end
%% Encoders figure
figure(); %Inclinacion
hold on
grid on
plot(time,k_inc(:,1));
plot(time,k_inc(:,2));
plot(time,k_inc(:,3));
plot(time,k_inc(:,4));
plot(time,k_inc(:,5));
%plot(time,k_inc(:,6));
plot(time,incl,'k');
%legend({'0gr','200gr','400gr','600gr','800gr','1000gr','Target'},'location','southeast');
legend({'200gr','400gr','600gr','800gr','1000gr','Target'},'location','southeast');
xlabel('time (s)');
ylabel('pos (deg)');
title('Inclination - Kinematics')

figure(); %Orinetacion
hold on
grid on
plot(time,k_ori(:,1));
plot(time,k_ori(:,2));
plot(time,k_ori(:,3));
plot(time,k_ori(:,4));
plot(time,k_ori(:,5));
%plot(time,k_ori(:,6));
plot(time,orient,'k');
%legend({'0gr','200gr','400gr','600gr','800gr','1000gr','Target'},'location','southeast');
legend({'200gr','400gr','600gr','800gr','1000gr','Target'},'location','southeast');
xlabel('time (s)');
ylabel('pos (deg)');
title('Orientation - Kinematics')




