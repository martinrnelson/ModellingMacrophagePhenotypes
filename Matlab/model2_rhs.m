function f=model2_rhs(t,y,p)

ma=y(1);
mp=y(2);
c=y(3);
g=y(4);

f(1)=(c+p.cT)*(ma+mp)*(1-(ma+mp)/p.mMax)-p.alpha1*c*ma+p.alpha2*g*mp-p.gammaM*ma;
f(2)=p.alpha1*c*ma-p.alpha2*g*mp-p.gammaM*mp;
f(3)=p.kappaC*mp-c*g-c;
f(4)=ma-p.gammaG*g;

f=f';

end