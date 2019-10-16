%**************************************************************************
% Minimal Model part 2 (Insulin). state 1
% Matlab Implementation by Esben Friis?Jensen, s042244
% DTU. 2007
%**************************************************************************
% This function should be solved with a ODESOLVER, this could be one of the
% Matlab standard ODESOLVERS like ODE45 or ODE15s.
%**************************************************************************
% Besides the basic time t, and the res vector it should have 2 more inputs:
%**************************************************************************
% p is a vector of size (2,1), containing the 3 parameters p4, p5 and p6
%**************************************************************************
% b is a vector of size (1,1) containing the basal value Ib
%**************************************************************************
function [dres] = bergmanpart22(t,res,input,p,b)
global G
dres = zeros(1,1); % a column vector
G = interp1(input(:,1),input(:,2),t);
%**************************************************************************
% The equations
%**************************************************************************
dI = - p(1)*(res(1)-b(1));
dres(1) = dI;
%**************************************************************************