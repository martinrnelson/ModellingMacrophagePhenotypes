function sol=model2_call

    % Parameters
    p.gammaG=0.2;
    p.kappaC=0.35;
    p.cT=0.01;
    p.mMax=25;
    p.gammaM=0.05;
    p.alpha1=1; 
    p.alpha2=0.01;

    % Initial conditions
    ma0=0.56;
    mp0=0.15;
    c0=0.015;
    g0=2.83;
    ICs=[ma0,mp0,c0,g0];
    
    % Integration time
    tspan=[1e-10 1e4];
    
    % Call ODE solver
    sol=ode45(@(t,y)model2_rhs(t,y,p),tspan,ICs);
    
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

end