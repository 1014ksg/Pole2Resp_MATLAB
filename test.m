t = 0:0.05:8;

a = -1+1j;
b = -1-1j;
r = -1;
i = 1;

omega = (i^2+1/4*(a+b)^2)^(1/2);
zeta = -1/(2*omega)*(a+b);
fai = atan(((1-zeta^2)^(1/2))/zeta);

y  = 1-1/((1-zeta^2)^(1/2))*exp(r*t).*sin(i*t+fai);