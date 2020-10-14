function [isIE, isTE] = IE(x, y, ts, p, sensorDim, multiTriggerWindow)

%x = location of event in x (1xN)
%y = location of event in y (1xN)
%ts = time of event (1xN)
%p = polarity of event (1xN)
%sensorDim = size of sensor (1x2)
%multiTriggerWindow = temporal window for inceptive event

numEvents = numel(x);

hasDataIdx = sub2ind(double(sensorDim), y, x);
N = 1:numEvents;

%Inceptive Events
ie = zeros(1,numEvents);
ie = accumarray(hasDataIdx,N',size(ie'),@(x) FindIE(x,ts,multiTriggerWindow,p));
ie = ie(~cellfun('isempty',ie));

isIE = false(1,numEvents);
for i=1:numel(ie) 
    isIE(double(ie{i})) = true;  
end

isIE = isIE';

%Trailing Events
ie = zeros(1,numEvents);
ie = accumarray(hasDataIdx,N',size(ie'),@(x) FindTE(x,ts,multiTriggerWindow,p));
ie = ie(~cellfun('isempty',ie));

isTE = false(1,numEvents);
for i=1:numel(ie) 
    isTE(double(ie{i})) = true;  
end

isTE = isTE';
