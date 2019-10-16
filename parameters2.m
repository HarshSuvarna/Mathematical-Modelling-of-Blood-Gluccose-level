%*************************************************************************
% Parameters for the Minimal Model
% Implemented by Esben Friis?Jensen, DTU. To be used together with the
% program BERSIMU
%*************************************************************************
% Parameters for the p?vector
%**************************************************************************
% p0 ? Theoretical glucose level at time zero above baseline.
% p1 ? Glucose effectiveness (Insulin independent).
% p2 ? Rate of the spontaneous decrease of tissue glucose uptake ability.
% p3 ? increase in uptake ability per unit of insulin conc. over baseline
% (insulin dependent).
% p4 ? first order decay rate contant for insulin (n).
% p5 ? Target glucose level
% p6 ? Rate of pancreatic release of insulin after glucose bolus pr. min.
% pr. mg/dL above target glycemia
%**************************************************************************
% Parameters for the b?vector
%**************************************************************************
% Gb ? Baseline glycemia.
% Ib ? Baseline insulemnia.V I ? Volume of insulin compartment in liters.
% Rutln ? Baseline for the glucose level in the subcutaneuos layer.
% Gbsc ? Rate of utilization
% drate ? Decay rate for meals, also known as alpha.
%**************************************************************************
Data = data;
%**************************************************************************
% Here the parameters are setup
%**************************************************************************
if parametertype == 1 % Parameter group 1
%**********************************************************************
% p?values
%**********************************************************************
p4 = 0.3; p5 = 89.5; p6 = 0.003349;
%**********************************************************************
% b?values
%**********************************************************************
Ib = 7.3;
%**********************************************************************
% Initial values
%**********************************************************************
I0 = Ib+396;
end