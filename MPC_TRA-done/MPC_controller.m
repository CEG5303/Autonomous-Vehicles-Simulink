function y  =  MPC_controller(x)
    global Ty M Izz lf lr dt xx vx N X
    %%%%%%%  input variables
    vy = x(1);                  % lateral velocity£¬ m/s
    vx = x(2);                  % longitudinal velocity, m/s
    fy = x(3);                  % Yaw angle£¬rad
    wr = x(4);                  % Yaw rate rad/s
    Y = x(5);                   % Y position£¬m
    X = x(6);                   % X position£¬m
    t = x(7);                   % Time, s
    % intalization
    dt = 0.05;                  % Discrete timestep, s
    Nx = 4;                     % number of state variable
    % vehicle parameters
    M = 1270;                   % vehicle mass, kg
    Izz = 1536.7;               % moment of inertia of the vehicle
    lf = 1.015;                 % distance from the center of gravity to the front axles, m
    lr = 1.895;                 % distance from the center of gravity to the front axles, m
    % before 2s lane-keeping with fix predictive horizon(1s), after 2s change lane
    % in 3s with receding predictive horizon, after 5s lane-keeping with fix predictive horizon (1s)
    T_lane_keep = 1;
    if t < 2
        tf = T_lane_keep;
        Ty = 0;
    elseif t < 5
        tf = 5 - t;
        Ty = 4;
    else
        tf = T_lane_keep;
        Ty = 4;
    end
    
    N = max(round(tf/dt),round(T_lane_keep/dt)); % predictive horizon points
    xx = zeros(Nx,2);
    xx(1,1) = Y; xx(2,1) = fy; xx(3,1) = vy; xx(4,1) =  wr;
    xx(1,2) = Y; xx(2,2) = fy; xx(3,2) = vy; xx(4,2) =  wr;
    %-----------------------------------------simulation start
    u = ones(N,2)*0;                 % control variable--delta_f
    options = optimset('Algorithm','interior-point','TolFun',1e-4,'LargeScale','on','MaxFunEvals',1e10, 'MaxIter',1e10);
    [uu,fval,exitflag] = fmincon(@myobj1,u,[],[],[],[],[],[],@mycon1,options);
    y(1) = uu(1); % use the first variable in the control horizon
    y(2) = uu(2); % use the first variable in the control horizon
end


%%

function [c,ceq] = mycon1(u)
    global N 
    u_lim = 0.2;
    c = ones(2*N,2); % for inequality constraints
    for k = 1:N
        c(k,1) = u(k,1) - u_lim;
        c(k+N,1) = -u(k,1) - u_lim;

        c(k,2) = u(k,2) - u_lim;
        c(k+N,2) = -u(k,2) - u_lim;
    end
    ceq = zeros(4,1); % for equality constraints
end

function f = myobj1(u)
    global Ty M Izz lf lr dt xx vx N X
    k1 = 0.2; k2 = 0.002; k3 = 0.2;
    f = k1*u(1)^2;
    
    for i = 1:N-1
        f = f + k1*u(i + 1)^2 + k3*(u(i + 1) - u(i))^2;
    end
    shape = 10; dx1 = 50; dx2 = 4;
    dy1 = Ty;
    Xs1 = 2.3*vx;
    
    vy0 = xx(3,1);  wr0 = xx(4,1);  fy_0 = xx(2,1);  s_y0 = xx(1,1); X_predict = X;
    
    for i = 1:N
        X_DOT = vx*cos(fy_0) - vy0*sin(fy_0); 
        X_predict = X_predict + X_DOT*dt;
        z1 = shape/dx1*(X_predict - Xs1) - shape/dx2;
        Y_ref = dy1/2*(1 + tanh(z1));
        alpha1 = -((vy0 + lf*wr0)/vx - u(i))*180/pi;
        alpha2 = -(vy0 - lr*wr0)/vx*180/pi;
        Fy1 = alpha1*1250;
        Fy2 = alpha2*755;
        vy = vy0 + (2*Fy2/M + 2*Fy1/M - vx*wr0)*dt;
        wr = wr0 + (lf*2*Fy1/Izz - lr*2*Fy2/Izz)*dt;
        fy = fy_0 + wr0*dt;
        sy = s_y0 + vy0*cos(fy_0)*dt + vx*sin(fy_0)*dt;
        vy0 = vy;  wr0 = wr;  fy_0 = fy;  s_y0 = sy;
        f = f + k2*(sy - Y_ref)^2;
    end
end



