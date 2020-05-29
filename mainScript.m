
clear, clc

load('sampleData.mat')

multiTriggerWindow = 20e3; %20msec

sensorDim = [260 346];

[isIE, isTE] = IE(x, y, t, p, sensorDim, multiTriggerWindow);

isNoise = ~isIE & ~isTE;

%Make a plot
figure
clf
hold on
scatter3(x(isIE),y(isIE),t(isIE),4,'b','.')
scatter3(x(isTE),y(isTE),t(isTE),4,'g','.')
scatter3(x(isNoise),y(isNoise),t(isNoise),4,'r','.')
view(-15,80)
legend('Inceptive','Trailing','Noise')

