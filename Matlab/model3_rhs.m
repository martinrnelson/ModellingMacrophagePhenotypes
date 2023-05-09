function f=model3_rhs(t,y,p)

ma=y(1);
mp=y(2);
c=y(3);
g=y(4);
n=y(5);
a=y(6);

f(1)=(c+p.cT)*(ma+mp)*(1-(ma+mp)/p.mMax)-p.alpha1*c*ma+p.alpha2*g*mp-p.gammaM*ma;
f(2)=p.alpha1*c*ma-p.alpha2*g*mp-p.gammaM*mp;
f(3)=p.kappaC*mp+p.kappaA*p.gammaA*a^2/(p.betaA^2+a^2)-c*g-c;
f(4)=ma-p.gammaG*g;
f(5)=c-p.nu*n;
f(6)=p.nu*n-p.phi*(ma+p.phi2*mp)*a-p.gammaA*a;

f=f';

end