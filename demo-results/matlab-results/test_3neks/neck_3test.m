%% Pruebas con el cuello blando 25mm (2019-03-05)
% Script "softneck_test.ccp"
% Escalon de 20º incl y 90º orientacion
% Control PID por posicion en encoders de motores 
%      dts=0.01
%      PIDBlock external1(2,1,0.1,dts);
%      PIDBlock external2(2,3,0.1,dts);
%      PIDBlock external3(2,1,0.1,dts);

%dato:
%tiempo/pos1/encoder1/pos2/encoder2/pos3/encoder3/incl/incl_sensor/orient/
%orient_sensor

%lectura archivo

filename='puebas_resorte_masas';
filename2='puebas_softneck_masas.xlsx';
filename3='puebas_softneck_35mm_masas.xlsx';
savefile='C:\Users\Humasoft\Documents\MATLAB\softneck_test';
%concatena todas las hojas del archivo .xlsx en la matriz multidimensional
%% "test"
spring=cat(6,[xlsread(filename,1,'A1:K301')],[xlsread(filename,2,'A1:K301')],[xlsread(filename,3,'A1:K301')],[xlsread(filename,4,'A1:K301')],[xlsread(filename,5,'A1:K301')],[xlsread(filename,6,'A1:K301')]);
soft25=cat(6,[xlsread(filename2,1,'A1:K301')],[xlsread(filename2,2,'A1:K301')],[xlsread(filename2,3,'A1:K301')],[xlsread(filename2,4,'A1:K301')],[xlsread(filename2,5,'A1:K301')],[xlsread(filename2,6,'A1:K301')]);
soft35=cat(6,[xlsread(filename3,1,'A1:K301')],[xlsread(filename3,2,'A1:K301')],[xlsread(filename3,3,'A1:K301')],[xlsread(filename3,4,'A1:K301')],[xlsread(filename3,5,'A1:K301')],[xlsread(filename3,6,'A1:K301')]);

neck3=cat(3,[spring],[soft25],[soft35]);

%%
playload=[0 200 400 600 800 1000];
% consignas
time=neck3(:,1,1);
pos1=neck3(:,2,1);
pos2=neck3(:,4,1);
pos3=neck3(:,6,1);
incl=neck3(:,8,1);
orient=neck3(:,10,1);

%% Figures c/test
for i=1:1:length(playload)
h=figure(i);
txt=['Playload: ',num2str(playload(i)),'gr'];
fig=['Playload',num2str(playload(i)),'gr'];
sgtitle(txt);

subplot(2,6,[1,2]);
plot(time, pos1,'--k','LineWidth',1);
hold on
for j=1:1:3
plot(time,neck3(:,3,j,1,1,i));
hold on
end
title('Motor 1');
xlabel('time [s]');
ylabel('angle [deg]');
grid on
legend({'Target','Spring','Soft 25mm','Soft 35mm'},'location','southeast');

subplot(2,6,[3,4]);
plot(time, pos2,'--k','LineWidth',1);
hold on
for j=1:1:3
plot(time,neck3(:,5,j,1,1,i));
hold on
end
title('Motor 2');
xlabel('time [s]');
ylabel('angle [deg]');
grid on
legend('Target','Spring','Soft 25mm','Soft 35mm');

subplot(2,6,[5,6]);
plot(time, pos3,'--k','LineWidth',1);
hold on
for j=1:1:3
plot(time,neck3(:,7,j,1,1,i));
hold on
end
title('Motor 3');
xlabel('time [s]');
ylabel('angle [deg]');
grid on
legend('Target','Spring','Soft 25mm','Soft 35mm');

subplot(2,6,[8,9]);
plot(time, incl,'--k','LineWidth',1);
hold on
for j=1:1:3
plot(time,neck3(:,9,j,1,1,i));
hold on
end
title('Inclination');
xlabel('time [s]');
ylabel('angle [deg]');
grid on
legend({'Target','Spring','Soft 25mm','Soft 35mm'},'location','southeast');
%axis([0 3 0 25])

subplot(2,6,[10,11]);
plot(time, orient,'--k','LineWidth',1);
hold on
for j=1:1:3
plot(time,neck3(:,11,j,1,1,i));
hold on
end
title('Orientation');
xlabel('time [s]');
ylabel('angle [deg]');
grid on
legend('Target','Spring','Soft 25mm','Soft 35mm');

savefig(fig);

end

