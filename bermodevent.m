function [rese,isterminal,direction]= bermodevent(t,res,p,b)
rese = res(1)-p(5);
isterminal = 1;
direction = 0;