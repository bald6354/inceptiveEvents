function [ie] = FindTE(idx, ts, multiTriggerWindow, p)

%Ensure time order
[idx] = sort(idx);

%Positive Intensity
idxp = find(p(idx)>0);

%Negative Intensity
idxn = find(p(idx)<=0);

if ~isempty(idxp)
    %Find IE by looking at time deltas
    multiEventp = cat(1,diff(ts(idx(idxp))),Inf)<=multiTriggerWindow;
    ieIdxp = abs(sum(cat(2,multiEventp,diff(cat(1,0,multiEventp))),2))==1;
    idxp = idxp(ieIdxp);
end

if ~isempty(idxn)
    %Find IE by looking at time deltas
    multiEventn = cat(1,diff(ts(idx(idxn))),Inf)<=multiTriggerWindow;
    ieIdxn = abs(sum(cat(2,multiEventn,diff(cat(1,0,multiEventn))),2))==1;
    idxn = idxn(ieIdxn);
end

ie = {[idx(idxp)',idx(idxn)']};

end

