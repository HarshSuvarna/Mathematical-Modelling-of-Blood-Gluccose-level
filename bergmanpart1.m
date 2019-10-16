%**************************************************************************
% Minimal Model part 1 (glucose)
% Matlab Implementation by Esben Friis?Jensen, s042244
% DTU. 2007
%**************************************************************************
% This function should be solved with a ODESOLVER, this could be one of the
% Matlab standard ODESOLVERS like ODE45 or ODE15s.
%**************************************************************************
% Besides the basic time t, and the res vector it should have 2 more inputs:
%**************************************************************************
% p is a vector of size (3,1), containing the 3 parameters p1, p2 and p3
%**************************************************************************
% b is a vector of size (2,1) containing the basal values Gb and Ib
%**************************************************************************
function [dres] = bergmanpart1(t,res,input,p,b)
dres = zeros(2,1); % a column vector with 7 elements
if size(input,1) > 1 || size(input,2) > 1
I = interp1(input(:,1),input(:,3),t);
else
I = input;
end
%**************************************************************************
% The equations
%**************************************************************************
dG = -p(1)*(res(1)-b(1)) - res(2)*res(1);
dX = -p(2)*res(2)+ p(3)*(I-b(2));
dres(1) = dG;
dres(2) = dX;
%**************************************************************************