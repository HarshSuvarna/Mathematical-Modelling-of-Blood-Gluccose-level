gn = 2;
gd = [1 1 0];
g = tf(gn, gd);
rlocus(g);
gt = ss(tf(gn,gd));