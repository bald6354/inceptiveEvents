
clear, clc

load('sampleData.mat')

%Needs to be in the same units as t, in this example t is in microseconds
multiTriggerWindow = 20e3; %20e3 = 20msec multiTriggerWindow (this may need to be adjusted to matcht the low-pass filter settings on the camera)

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

