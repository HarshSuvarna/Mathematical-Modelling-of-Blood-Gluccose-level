%**************************************************************************
% Original Minimal Model Matlab Implementation by Esben Friis-Jensen, s042244
% DTU. 2007
%**************************************************************************
% This function should be solved with a ODESOLVER, this could be one of the
% Matlab standard ODESOLVERS like ODE45 or ODE15s.
%**************************************************************************
% Besides the basic time t, and the res vector it should have 2 more inputs:
%**************************************************************************
% p is a vector of size (6,1), containing the 4 parameters p1, p2, p3 and
% p4,p5,p6
%**************************************************************************
% b is a vector of size (2,1) containing the 2 basal values Gb, Ib
%**************************************************************************
function [dres] = bermod1(t,res,p,b)
dres = zeros(3,1); % a column vector with 5 elements
%**************************************************************************
% The Minimal Model function 1
%
% res(1) = G
% res(2) = X
% res(3) = I
%**************************************************************************
%**************************************************************************
% The equations
%**************************************************************************
dG = -p(1)*(res(1)-b(1)) - res(2)*res(1);
dX = -p(2)*res(2)+ p(3)*(res(3)-b(2));
dI = p(6)*(res(1)-p(5))*t - p(4)*(res(3)-b(2));
dres(1) = dG;
dres(2) = dX;
dres(3) = dI;
%**************************************************************************