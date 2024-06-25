clc; clear; close;

load('simulationData.mat');
load('fuelConsumptionLP.mat');
load('fuelConsumptionICE.mat');
load('fuelConsumptionB.mat');
load('SoCLP.mat');

time = data.velocity.Time;
velocity = data.velocity.Data;
TrqCmd = data.TrqCmd.Data;
E_Torque_Demand = data.E_Torque_Demand.Data;
SoCB = data.SoC.Data;

%fuelConsumptionB = data.fuel_consumption_in_l.Data;
%fuelFlow = data.FuelVolFlw.Data;

figure(1)
yyaxis left
plot(time,velocity,'LineWidth',1.8)
ylabel('Geschwindigkeit in km/h')
ylim([0 max(velocity)])
hold on

% plot Diesel Torque over rpm
yyaxis right
plot(time,fuelConsumptionICE,'LineWidth',1.8)
hold on
plot(time,fuelConsumptionLP,'LineWidth',1.8)
hold on
plot(time,fuelConsumptionB,'LineWidth',1.8)
ylabel('eingesetzte Kraftstoffmenge in l')
xlabel('Zeit in s')
ylim([0 max(fuelConsumptionICE)])
legend('Geschwindigkeit WLTP Class 3', 'Konventioneller Antrieb', 'Lastpunktanhebung + Boost', 'Nur Boost','Location','northwest')
grid on
title('Kumulierter Kraftstoffverbrauch bei unterschiedlichen Betriebsstrategien');

% figure(2)
% yyaxis right
% plot(time,SoCB,'LineWidth',1.8)
% hold on
% plot(time,SoCLP,'LineWidth',1.8)
% ylabel('Batterieladezustand')
% 
% yyaxis left
% plot(time,velocity,'LineWidth',1.8)
% ylabel('Geschwindigkeit in km/h')
% xlabel('Zeit in s')
% legend('Geschwindigkeit WLTP Class 3','Batterieladezustand nur Boost','Batterieladezustand Lastpunktanhebung + Boost')
% title('Batteriezustand bei unterschiedlichen Betriebsstrategien');
% grid on



% Set the paper size and position for landscape orientation
width = 11; % Width in inches
height = 6; % Height in inches
set(gcf, 'PaperUnits', 'inches');
set(gcf, 'PaperPosition', [0 0 width height]);
set(gcf, 'PaperSize', [width height]);

% Save the plot as a PDF with 300 dpi resolution
print('myPlot', '-dpdf', '-r300');