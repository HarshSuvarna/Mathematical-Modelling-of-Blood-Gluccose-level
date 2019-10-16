function [pan2,RES,T] = inssim(parametertype,data)
parameters2
p = [p4 p5 p6];
b = [Ib];
startval = [I0];
options = odeset('Events',@bergmanpart2event);
tspan = Data(:,1);
tstart = Data(1,1);
tmax = Data(end,1);
begin = 1;

while tstart < tmax
state2 = (bergmanpart2event(tstart,startval,Data,p,b) == 0);
if bergmanpart2event(tstart,startval,Data,p,b) > 0
[T1,RES1,Te,Ye,Ie]= ode15s(@bergmanpart21,[tstart tmax],startval,options,Data,p,b);
else
[T1,RES1,Te,Ye,Ie]= ode15s(@bergmanpart22,[tstart tmax],startval,options,Data,p,b);
end

if state2 == 1
startval = Ye(1,:);
tstart = Te(1,1);
T1 = [];
RES1 = [];
else if ~isempty(Ie)
startval = Ye(end,:);
tstart = Te(1,1);
else
tstart = tmax;
end

Ye = [];
Ie = [];
Te = [];
theend = begin + (size(T1,1)-1);
RES(begin:theend,1) = RES1;
T(begin:theend,1) = T1;
begin = theend + 1;
end

pan2 = p6*10^4;