function [IT, VNF] = genfault(YN, YF, IintN, IintF, idN, idF)
% Deniz Temurcu 261089503
% This function performs generalized fault calculations between a healthy and a fault network

% Our inputs:
% YN is the admittance matrix of the healthy network
% YF is the admittance matrix of the fault network
% IintN is the vector of pre-fault internal current sources in the healthy network
% IintF is the vector of pre-fault internal current sources in the fault network
% idN is the vector of node indices in the healthy network that are being
% connected
% idF is the vector of node indices in the fault network that are being
% connected

% Our outputs:
% IT is the vector of tie line currents leaving the healthy network at idN 
% VNF is the vector of node voltages in the healthy network with the fault network connected



% sizes
nN = size(YN,1);
nF = size(YF,1);
np = length(idN);
if length(idF) ~= np
    error('idN and idF must have the same length');
end

% size checks
if size(YN,1) ~= size(YN,2) || size(YF,1) ~= size(YF,2)
    error('YN and YF must be square.');
end
if size(YN,1) ~= numel(IintN) || size(YF,1) ~= numel(IintF)
    error('IintN/IintF size must match YN/YF.');
end
if any(idN<1) || any(idN>nN) || any(idF<1) || any(idF>nF)
    error('idN/idF contain invalid bus indices.');
end
if numel(unique(idN))~=np || numel(unique(idF))~=np
    error('idN and idF must have unique indices.');
end


% pre-fault open-circuit voltages
VocN = YN \ IintN;
VocF = YF \ IintF;

% build selection matrices for the ports
EN = zeros(nN, np);
EF = zeros(nF, np);
for k = 1:np
    EN(idN(k),k) = 1; % port k in healthy network
    EF(idF(k),k) = 1; % port k in fault network
end

% columns of Z we need
QN = YN \ EN; % nN x np
QF = YF \ EF; % nF x np

% port open-circuit voltages and port impedance submatrices
EeqN = VocN(idN);
EeqF = VocF(idF);
ZeqN = QN(idN,:); % np x np
ZeqF = QF(idF,:); % np x np

% solve for tie currents: (ZeqN + ZeqF) * IT = EeqN - EeqF
IT = (ZeqN + ZeqF) \ (EeqN - EeqF);

% healthy-network voltages with the fault network connected
VNF = VocN - QN * IT;
end
