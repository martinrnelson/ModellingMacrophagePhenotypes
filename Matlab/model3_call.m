function sol=model3_call

    % Parameters
    p.gammaG=0.2;
    p.kappaC=0.35;
    p.cT=0.01;
    p.mMax=25;
    p.gammaM=0.05;
    p.alpha1=1; 
    p.alpha2=0.01;
    p.nu=0.1;
    p.phi=0.1;
    p.phi2=0.01;
    p.gammaA=1;
    p.betaA=0.5;
    p.kappaA=2;

    % Initial conditions (severe inflammation; n large)
    ma0=1;
    mp0=10;
    c0=10;
    g0=0;
    n0=1;
    a0=0;
    ICs=[ma0,mp0,c0,g0,n0,a0];

%     % Initial conditions (low-level inflammation)
%     ma0=0.56;
%     mp0=0.15;
%     c0=0.015;
%     g0=2.83;
%     n0=0.15;
%     a0=0.01;
%     ICs=[ma0,mp0,c0,g0,n0,a0];
    
    % Integration time
    tspan=[1e-10 1e4];
    
    % Call ODE solver
    sol=ode45(@(t,y)model3_rhs(t,y,p),tspan,ICs);
    
    % Plot settings
    xlims=[0 2500];
    
    % Plot results
    figure(7)
    plot(sol.x,sol.y(1,:),'g');
    hold on
    plot(sol.x,sol.y(2,:),'r');
    box on
    xlim(xlims);
    ylim([-1 p.mMax+1]);
    figure(8);
    plot(sol.x,sol.y(3,:),'r');
    hold on
    plot(sol.x,sol.y(4,:),'g');
    box on
    xlim(xlims);
    ylim([0 10]);
    figure(9);
    plot(sol.x,sol.y(5,:),'k');
    hold on
    plot(sol.x,sol.y(6,:),'k--');
    box on
    xlim(xlims); 
    ylim([0 70]);

end