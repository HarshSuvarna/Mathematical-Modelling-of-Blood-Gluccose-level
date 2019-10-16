function [GE,SI,RES,T] = glusim(parametertype,data)
parameters1
p = [p1 p2 p3];
b = [Gb Ib];
startval = [G0 X0];
GE = p1;
SI = p3/p2;
tmin = Data(1,1);
tmax = Data(end,1);
tmin = 0;
tmax = 182;
tspan = [tmin tmax];
[T,RES] = ode15s(@bergmanpart1,tspan,startval,[],Data,p,b);
% Gbvec = Gbones(size(T));
% figure
% plot(T,RES(:,1),’?b’,’linewidth’,3)
% hold on
% plot(T,Gbvec,’??black’,’linewidth’,3)
% plot(Data(:,1),Data(:,2),’black’)
% V = axis; axis([0 182 V(3) V(4)]);
% title(’BLOOD GLUCOSE LEVEL,SIMULATED WITH GLUSIM’,’fontsize’,16)
% xlabel(’TIME [MIN]’,’fontsize’,14)
% ylabel(’GLUCOSE LEVEL [mg/dL]’,’fontsize’,14)
% legend(’Glucose level’,’Baseline Gb’,’Measured data’)
% figure
% plot(T,RES(:,2),’?b’,’linewidth’,3)
% title(’ACTIVE INSULIN EFFECT,SIMULATED WITH GLUSIM’,’fontsize’,16)
% xlabel(’TIME [MIN]’,’fontsize’,14)
% ylabel(’ACTIVE INSULIN EFFECT [1/MIN]’,’fontsize’,14)
% V = axis; axis([0 182 V(3) V(4)]);
% figure
% plot(Data(:,1),Data(:,3),’oblack’,’linewidth’,3)
% title(’MEASURED INSULIN DATA’,’fontsize’,16)
% xlabel(’TIME [MIN]’,’fontsize’,14)
% ylabel(’BLOOD INSULIN LEVEL’,’fontsize’,14)