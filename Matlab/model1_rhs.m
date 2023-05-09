function f=model1_rhs(t,y,p)

m=y(1);
c=y(2);
g=y(3);

f(1)=(c+p.cT)*m*(1-m/p.mMax)-p.gammaM*m;
f(2)=p.kappaC*m-c*g-c;
f(3)=m-p.gammaG*g;

f=f';

end