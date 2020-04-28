%%
filename2='spring_test.xlsx';
frac=cat(6,[xlsread(filename2,1,'A1:W7000')],[xlsread(filename2,2,'A1:W7000')],[xlsread(filename2,3,'A1:W7000')]);
gr0=load('x1_0gr.mat');
gr600=load('x1_500gr.mat');
gr1000=load('x1_1000gr.mat');
time=frac(:,1,1);
incl=frac(:,8,1);
orient=frac(:,10,1);
%%
%inclinacion
figure();
hold on
grid on
plot(time,gr0.x1(:,1))
plot(time,gr600.x1(:,1))
plot(time,gr1000.x1(:,1))
plot(time,incl,'k');
legend({'0gr', '500gr','1000gr','consigna'},'location','southwest');
xlabel('tiempo [s]');
ylabel('pos [deg]');
title('Inclinacion - Cinematica')
%
figure();
hold on
grid on
plot(time,frac(:,9,1))
plot(time,frac(:,9,2))
plot(time,frac(:,9,3))
plot(time,incl,'k');
legend({'0gr', '500gr','1000gr','consigna'},'location','southwest');
xlabel('tiempo [s]');
ylabel('pos [deg]');
title('Inclinacion - Sensor')

%%
% Orientacion
figure();
hold on
grid on
plot(time,gr0.x1(:,2))
plot(time,gr600.x1(:,2))
plot(time,gr1000.x1(:,2))
plot(time,orient);
legend('0gr', '500gr','1000gr','consigna','location','southeast')
xlabel('tiempo [s]');
ylabel('pos [deg]');
title('Orientacion - Cinematica')
%
figure();
hold on
grid on
plot(time,frac(:,11,1))
plot(time,frac(:,11,2))
plot(time,frac(:,11,3))
plot(time,orient);
legend('0gr', '500gr','1000gr','consigna','location','southeast')
xlabel('tiempo [s]');
ylabel('pos [deg]');
title('Orientacion - Sensor')

%% Comparativas
% inclinacion
figure();
subplot(3,1,1)
hold on
grid on
plot(time,gr0.x1(:,1),'b')
plot(time,frac(:,9,1),'r')
plot(time,incl,'--k');
hleg=legend('kinematics','sensor','target','location','southwest')
htitle = get(hleg,'Title');
set(htitle,'String','0gr playload')
xlabel('time [s]');
ylabel('pos [deg]');

subplot(3,1,2)
hold on
grid on
plot(time,gr600.x1(:,1),'b')
plot(time,frac(:,9,2),'r')
plot(time,incl,'--k');
hleg=legend('kinematics','sensor','target','location','southwest')
htitle = get(hleg,'Title');
set(htitle,'String','500gr playload')
xlabel('time [s]');
ylabel('pos [deg]');

subplot(3,1,3)
hold on
grid on
plot(time,gr1000.x1(:,1),'b')
plot(time,frac(:,9,3),'r')
plot(time,incl,'--k');
hleg=legend('kinematics','sensor','target','location','southwest')
htitle = get(hleg,'Title');
set(htitle,'String','1000gr playload')
xlabel('time [s]');
ylabel('pos [deg]');

%% Orientacion

figure();
subplot(3,1,1)
hold on
grid on
plot(time,gr0.x1(:,2),'b')
plot(time,frac(:,11,1),'r')
plot(time,orient,'--k');
hleg=legend('kinematics','sensor','target','location','northwest')
htitle = get(hleg,'Title');
set(htitle,'String','0gr playload')
xlabel('time [s]');
ylabel('pos [deg]');

subplot(3,1,2)
hold on
grid on
plot(time,gr600.x1(:,2),'b')
plot(time,frac(:,11,2),'r')
plot(time,orient,'--k');
hleg=legend('kinematics','sensor','target','location','northwest')
htitle = get(hleg,'Title');
set(htitle,'String','500gr playload')
xlabel('time [s]');
ylabel('pos [deg]');

subplot(3,1,3)
hold on
grid on
plot(time,gr1000.x1(:,2),'b')
plot(time,frac(:,11,3),'r')
plot(time,orient,'--k');
hleg=legend('kinematics','sensor','target','location','northwest')
htitle = get(hleg,'Title');
set(htitle,'String','1000gr playload')
xlabel('time [s]');
ylabel('pos [deg]');

%% Consolidado
figure(); %inclinacion

subplot(1,3,1)%inclinacion 0gr
hold on
grid on
plot(time,gr0.x1(:,1),'b')
plot(time,frac(:,9,1),'r')
plot(time,incl,'--k');
hleg=legend('kinematics','sensor','target','location','southwest')
htitle = get(hleg,'Title');
set(htitle,'String','0gr playload')
xlabel('time [s]');
ylabel('pos [deg]');

subplot(1,3,2) %inclinacion 500gr
hold on
grid on
plot(time,gr600.x1(:,1),'b')
plot(time,frac(:,9,2),'r')
plot(time,incl,'--k');
hleg=legend('kinematics','sensor','target','location','southwest')
htitle = get(hleg,'Title');
set(htitle,'String','500gr playload')
xlabel('time [s]');
ylabel('pos [deg]');

subplot(1,3,3) %inclinacion 1000gr
hold on
grid on
plot(time,gr1000.x1(:,1),'b')
plot(time,frac(:,9,3),'r')
plot(time,incl,'--k');
hleg=legend('kinematics','sensor','target','location','southwest')
htitle = get(hleg,'Title');
set(htitle,'String','1000gr playload')
xlabel('time [s]');
ylabel('pos [deg]');

figure(); %orientacion

subplot(1,3,1) % orientacion 0gr
hold on
grid on
plot(time,gr0.x1(:,2),'b')
plot(time,frac(:,11,1),'r')
plot(time,orient,'--k');
hleg=legend('kinematics','sensor','target','location','southeast')
htitle = get(hleg,'Title');
set(htitle,'String','0gr playload')
xlabel('time [s]');
ylabel('pos [deg]');

subplot(1,3,2) %orientacion 500gr
hold on
grid on
plot(time,gr600.x1(:,2),'b')
plot(time,frac(:,11,2),'r')
plot(time,orient,'--k');
hleg=legend('kinematics','sensor','target','location','southeast')
htitle = get(hleg,'Title');
set(htitle,'String','500gr playload')
xlabel('time [s]');
ylabel('pos [deg]');

subplot(1,3,3) %orientacion 1000gr
hold on
grid on
plot(time,gr1000.x1(:,2),'b')
plot(time,frac(:,11,3),'r')
plot(time,orient,'--k');
hleg=legend('kinematics','sensor','target','location','southeast')
htitle = get(hleg,'Title');
set(htitle,'String','1000gr playload')
xlabel('time [s]');
ylabel('pos [deg]');

%% motores
% motor 1 para 0-500-1000gr

encoder1_0 = frac(:,3,1);
encoder1_500 = frac(:,3,2);
encoder1_1000 = frac(:,3,3);

pos1_0 = frac(:,2,1);
pos1_500 = frac(:,2,2);
pos1_1000 = frac(:,2,3);

figure();

subplot(1,3,1)
%title('Motor 1');
hold on
grid on
plot(time, pos1_0,'b');
plot(time,encoder1_0,'r');
hleg=legend('kinematics','encoder motor','location','southwest')
htitle = get(hleg,'Title');
set(htitle,'String','0gr playload')
xlabel('time [s]');
ylabel('pos [deg]');

subplot(1,3,2)
hold on
grid on
plot(time, pos1_500,'b');
plot(time,encoder1_500,'r');
hleg=legend('kinematics','encoder motor','location','southwest')
htitle = get(hleg,'Title');
set(htitle,'String','500gr playload')
xlabel('time [s]');
ylabel('pos [deg]');

subplot(1,3,3)
hold on
grid on
plot(time, pos1_1000,'b');
plot(time,encoder1_1000,'r');
hleg=legend('kinematics','encoder motor','location','southwest')
htitle = get(hleg,'Title');
set(htitle,'String','1000gr playload')
xlabel('time [s]');
ylabel('pos [deg]');
%%
figure();
hold on
grid on
plot(time, pos1_0,'k');
plot(time,encoder1_0);
plot(time,encoder1_500);
plot(time,encoder1_1000);
hleg=legend('kinematics','0gr','500gr','1000gr','location','southwest')
htitle = get(hleg,'Title');
set(htitle,'String','Motor 1')
xlabel('time [s]');
ylabel('pos [deg]');

%%  señal de control
%% cs1
%motor1 external control signal FRACC
%figure('Name','Motor1_CS_external','NumberTitle','off');
%sgtitle("External Control Signal ");
figure();
subplot(1,2,2)
for i=1:1:3
plot(time,frac(:,13,i));
hold on
end
%title('cs1 motor1');
xlabel('time [s]');
ylabel('vel [rpm]');
grid on
hleg=legend({'0gr','500gr','1000gr'},'location','southwest');
htitle = get(hleg,'Title');
set(htitle,'String','Motor 1 - cs');
% savefig('motor1_externalControl_frac.fig');
% saveas(gcf,'motor1_externalControl_frac','epsc')

%% EP1
%motor1 external control signal FRACC (ep1)
%figure('Name','Motor1_CS_external','NumberTitle','off');
%sgtitle("External Control Signal ");
%figure();
subplot(1,2,1)
for i=1:1:3
plot(time,frac(:,12,i));
hold on
end
%title('ep1 motor1');
xlabel('time [s]');
ylabel('pos [deg]');
grid on
hleg=legend({'0gr','500gr','1000gr'},'location','southwest');
htitle = get(hleg,'Title');
set(htitle,'String','Motor 1 - ep');
% savefig('motor1_externalControl_frac.fig');
% saveas(gcf,'motor1_externalControl_frac','epsc')
%% ev1
figure();
subplot(1,2,1)
for i=1:1:3
plot(time,frac(:,14,i));
hold on
end
%title('ev1 motor1');
xlabel('time [s]');
ylabel('vel [rpm]');
grid on
hleg=legend({'0gr','500gr','1000gr'},'location','southwest');
htitle = get(hleg,'Title');
set(htitle,'String','Motor 1 - ev');
% savefig('motor1_externalControl_frac.fig');
% saveas(gcf,'motor1_externalControl_frac','epsc')
%% tcs1
%figure();
subplot(1,2,2)
for i=1:1:3
plot(time,frac(:,15,i));
hold on
end
%title('tcs motor1');
xlabel('time [s]');
ylabel('torq [%o]');
grid on
hleg=legend({'0gr','500gr','1000gr'},'location','southwest');
htitle = get(hleg,'Title');
set(htitle,'String','Motor 1 - Tcs');
% savefig('motor1_externalControl_frac.fig');
% saveas(gcf,'motor1_externalControl_frac','epsc')
