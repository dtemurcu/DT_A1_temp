function [Eeq, Zeq] = genthevenin(Y, Iint, id)
% Deniz Temurcu 261089503
% This function generates the generalized Thevenin equivalent of the network at selected buses

% Our inputs:
% Y is the bus admittance matrix (nbus x nbus)
% Iint is the vector of pre-fault internal current sources (nbus x 1)
% id is the vector of bus indices where the Thevenin equivalent is evaluated

% Our outputs:
% Eeq is the vector of open-circuit port voltages (same order as id)
% Zeq is the port impedance submatrix (length(id) x length(id))



nbus = size(Y,1); % get number of buses
n = length(id);

if any(id < 1) || any(id > nbus)
    error('Indices in id must be valid bus numbers.');
end
if length(unique(id)) ~= length(id)
    error('Indices in id must be unique.');
end

% get pre-fault open-circuit voltages 
Voc = Y \ Iint;

% initialize outputs
Eeq = Voc(id); % open-circuit voltages at the selected ports
Zeq = zeros(n, n);   % port impedance matrix

% fill Zeq by solving Y * zcol = e_port for each port in id
for a = 1:n
    e = zeros(nbus,1);
    e(id(a)) = 1;           % inject 1 at selected nodes
    zcol = Y \ e;           % get the corresponding column of Z 
    Zeq(:,a) = zcol(id);    % keep only rows at the selected ports
end
end
