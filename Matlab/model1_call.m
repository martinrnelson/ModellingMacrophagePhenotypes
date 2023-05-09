function sol=model1_call

    % Parameters
    p.gammaG=0.2;
    p.kappaC=0.35;
    p.cT=0.01;
    p.mMax=25;
    p.gammaM=0.05;

    % Initial conditions
    m0=0.2;
    c0=0.1;
    g0=0;
    ICs=[m0,c0,g0];
    
    % Integration time
    tspan=[1e-10 1e4];
    
    % Call ODE solver
    sol=ode45(@(t,y)model1_rhs(t,y,p),tspan,ICs);
    
    % Plot settings
    xlims=[0 2500];
    
    % Plot results
    figure(7)
    plot(sol.x,sol.y(1,:),'g');
    box on
    xlim(xlims);
    ylim([-1 p.mMax+1]);
    figure(8);
    plot(sol.x,sol.y(2,:),'r');
    hold on
    plot(sol.x,sol.y(3,:),'g');
    box on
    xlim(xlims);
    ylim([0 10]);

end