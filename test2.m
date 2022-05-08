t = 0:0.1:8;
s = -2;
T = -1/s;
y = T/T * exp(-1/T*t);
plot(t,y)