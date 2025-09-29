function Z = impedance(nfrom, nto, r, x, b)
% Deniz Temurcu 261089503
% This function computes the bus impedance matrix (Z-bus) of a power system 
% given line parameters, without using inv()

% Our inputs:
% nfrom is the vector of sending-end bus indices
% nto is the vector of receiving-end bus indices
% r is the vector of line resistances 
% x is the vector of line reactances 
% b is the vector of line susceptances 

% Our output:
% Z is the bus impedance matrix of size nbus (square matrix)

% check input sizes
if ~( length(nfrom)==length(nto) && length(nto)==length(r) && ...
      length(r)==length(x) && length(x)==length(b) )
    error('Input vectors nfrom, nto, r, x, and b must all be the same length.');
end

Y = admittance(nfrom, nto, r, x, b);   % build bus admittance matrix
nbus = size(Y,1);                      % get the number of buses
I = eye(nbus);                         % identity matrix
Z = Y \ I;                             % solve Y * Z = I without inv()
end
