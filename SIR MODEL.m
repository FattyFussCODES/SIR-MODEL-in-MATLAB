%initial values
beta =0.39;
gamma = 0.1;
R0=0;
I0=574;
N=1.1e7;
S0=N - 574;
Tmax =100;
H=0.1;
%Vector Creataion
V= [0:H:Tmax];
Z=length(V);
% null Vector allocation
S=zeros(1,Z);
R=zeros(1,Z);
I=zeros(1,Z);
%indexing
S(1)=S0;
R(1)=R0;
I(1)=I0;
%loop for Ds DI DR
for n = 1:Z-1
    dS = -beta * S(n) * I(n) / N;
    dI = beta * S(n) * I(n) / N - gamma * I(n);
    dR = gamma * I(n);
 %Euler value loop
    S(n+1) = S(n) + dS * H;
    I(n+1) = I(n) + dI * H;
    R(n+1) = R(n) + dR * H;
end
%displat reultss 
disp(I)
disp(S)
disp(R)
%plot
plot(V, S,"o--") ;
hold on;
plot(V, I, "--");
plot(V, R , "-");
grid on;
xlabel('Time (days)');
ylabel('Number of Individuals');
title('SIR Model solved with Euler Method');
legend('Susceptible', 'Infected', 'Recovered');
grid on;
hold off;