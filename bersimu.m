%**************************************************************************
% BERSIMU - A simulator for Bergmans original minimal model. (coupled)
% Implemented by Esben Friis-Jensen, s042244, DTU
%
% It is used together with the file parameters, and the functions bermod1
% and bermod2.
%**************************************************************************
% The call
%**************************************************************************
% [SG,SI] = bersimu(parametertype,tspan)
%**************************************************************************
% Where the input are:
%**************************************************************************
%**************************************************************************
% PARAMETERTYPE:
% An integer. This is the choice of parameters. The parametergroups can be
% found in the parameters file, where you can change the values as you
% like.
%**************************************************************************
% TSPAN:
% Should be a vector containing [t min t max]
%**************************************************************************
function [pan2,GE,SI,RES,T] = bersimu(parametertype==1,tspan);
%**************************************************************************
% In the file parameters, all the parameters are setup
%**************************************************************************
parameters;
%**************************************************************************
% the values from parameters are loaded into the vectors p and b
%**************************************************************************
p = [p1 p2 p3 p4 p5 p6];
b = [Gb Ib];
GE = p(1);
SI = p(3)/p(2);
pan2 = p(6)*10^4
%**************************************************************************
% Here the initial values and options are chosen
%**************************************************************************
if size(tspan,2) ~= 2
display('---------------WARNING---------------------')
display('NO SIMULATION EXECUTED DUE TO THE FOLLOWING')
display('Your TSPAN vector should contain 2 elements')
display('-------------------------------------------')
return
end

tmin = tspan(1);
tmax = tspan(2);
startval = [G0 X0 I0]; % Initial values
options = odeset('Events',@bermodevent);
%**************************************************************************
% Basic simulation, without any disturbance
%**************************************************************************
tstart = tmin;
begin = 1;

while tstart < tmax
state2 = (bermodevent(tstart,startval,p,b) == 0);
if bermodevent(tstart,startval,p,b) > 0
[T1,RES1,Te,Ye,Ie]=ode15s(@bermod1,[tstart t max],startval,options,p,b);
else
[T1,RES1,Te,Ye,Ie]=ode15s(@bermod2,[tstart t max],startval,options,p,b);
end

if state2 == 1
startval = Ye(1,:);
tstart = Te(1,1);
T1 = [];
RES1 = [];
elseif ~isempty(Ie)
startval = Ye(1,:);
tstart = Te(1);
else
tstart = tmax;
end

Ye = [];
Ie = [];
Te = [];
theend = begin + (size(T1,1)-1);
RES(begin:theend,1:3) = RES1;
T(begin:theend,1) = T1;
begin = theend + 1;
end
%**************************************************************************
%**************************************************************************
% If you want the numbers in mmol/L instead of mg/dL for glucose
%**************************************************************************
% gi = gi./18;
% Gb = Gb./18;
% RES(:,1) = RES(:,1)./18;
%**************************************************************************
%**************************************************************************