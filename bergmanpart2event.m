function [rese,isterminal,direction]= bergmanpart2event(t,res,input,p,b)
G = interp1(input(:,1),input(:,2),t);
rese = G-p(2);
isterminal = 1;
direction = 0;