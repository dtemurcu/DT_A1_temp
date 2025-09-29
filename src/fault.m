function [If, Vf] = fault(Y, Iint, idfault, Zf)
% Deniz Temurcu 261089503
% This function computes fault current and bus voltages for a 3-phase fault 
% at a specified bus
%
% Our inputs:
% Y is the bus admittance matrix
% Iint is the vector of pre-fault internal current sources (nbus x 1)
% idfault is the faulted bus index (scalar)
% Zf is the fault impedance (scalar, optional; use 0 for bolted fault)
%
% Our output:
% If is the fault current injected at bus idfault (scalar, complex)
% Vf is the vector of bus voltages during the fault

% some size
nbus = size(Y,1);
if size(Y,1) ~= size(Y,2)
    error('Y must be a square matrix.');
end
if numel(Iint) ~= nbus
    error('Dimension mismatch: Y and Iint must have the same size.');
end
if idfault < 1 || idfault > nbus
    error('idfaut must be a valid bus index.');
end

if nargin < 4
    Zf = 0; % default to bolted fault
end

% compute open-circuit voltages prior to fault
Voc = Y \ Iint;

% get Thevenin column at bus where fault occurs
e = zeros(nbus,1); 
e(idfault) = 1;                   % unit injection at fault bus
Z_column = Y \ e;                  % column of Z we need

% calculate fauls current and voltage
Zkk = Z_column(idfault);          % self Thevenin impedance at fault bus
If = Voc(idfault) / (Zkk + Zf);   % fault current
Vf = Voc - Z_column * If;         % post-fault bus voltages
end
