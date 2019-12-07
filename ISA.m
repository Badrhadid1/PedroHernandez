%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% International Standard Atmosphere
%                                         
% Measurment of Temperature, Pressure, and Density in the Atmosphere using
% standard equations
% Last modified:   07/12/2019   B. Hadidoine
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Input Altitude from user
Rqs='Enter altitude en km: ';
Altitude= input(Rqs);
if Altitude<0 && Altitude>50
    Rqs='Enter altitude en km: ';
    Altitude= input(Rqs);
else
H=0:0.5:50;
T=ones(1,101);
P=ones(1,101);
RHO=ones(1,101);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Iniitial values
P_0=101325;% Pressure at sea level [Pa]
rho_0=1.225;% Density at sea level [kg/m^3]
T_0= 288.15;% Temperature at sea level [K]
g=9.80665;% Gravity Constant
R=287;% Gas Constant
a_0=-0.0065;% For altitudes from 0km to 11km [K/m]
a_1=0.001; % For altitudes from 20km to 32km [K/m]
a_2=0.0028;% For altitudes from 32km to 47km [K/m]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Initial conditions at every level
T_11km=T_0-6.5*11;
P_11km=P_0*(T_11km/T_0)^(-g/(a_0*R));
rho_11km=rho_0*(T_11km/T_0)^(-g/(a_0*R)-1);
T_20km=T_11km;
P_20km=P_11km*exp((-g/(R*T_20km))*9000);
rho_20km=rho_11km*exp((-g/(R*T_20km))*9000);
T_32km=T_20km+12;
P_32km=P_20km*(T_32km/T_20km)^(-g/(a_1*R));
rho_32km=rho_20km*(T_32km/T_20km)^((-g/(a_1*R))-1);
T_47km=T_32km+15*2.8;
P_47km=P_32km*(T_47km/T_32km)^(-g/(a_2*R));
rho_47km=rho_32km*(T_47km/T_32km)^((-g/(a_2*R))-1);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Calculations made from 0km to 11km
if Altitude>0 && Altitude<=11
    T_Alt=T_0-6.5*Altitude;
    P_Alt=P_0*(T_Alt/T_0)^(-g/(a_0*R));
    rho_Alt=rho_0*(T_Alt/T_0)^(-g/(a_0*R)-1);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Calculations made from 11km to 20km
if Altitude>11 && Altitude<=20
   T_Alt=T_11km;
   P_Alt=P_11km*exp((-g/(R*T_Alt))*((Altitude-11)*1000));
   rho_Alt=rho_11km*exp((-g/(R*T_Alt))*((Altitude-11)*1000));
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Calculations made from 20km to 32km
if Altitude>20 && Altitude<=32
   T_Alt=T_20km+(Altitude-20);
   P_Alt=P_20km*(T_Alt/T_20km)^(-g/(a_1*R));
   rho_Alt=rho_20km*(T_Alt/T_20km)^((-g/(a_1*R))-1);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Calculations made from 32km to 47km
if Altitude>32 && Altitude<=47
   T_Alt=T_32km+2.8*(Altitude-32);
   P_Alt=P_32km*(T_Alt/T_32km)^(-g/(a_2*R));
   rho_Alt=rho_32km*(T_Alt/T_32km)^((-g/(a_2*R))-1);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Calculations made from 47km to 50km
if Altitude>47 && Altitude<=50
   T_Alt=T_47km;
   P_Alt=P_47km*exp((-g/(R*T_Alt))*((Altitude-47)*1000));
   rho_Alt=rho_47km*exp((-g/(R*T_Alt))*((Altitude-47)*1000));
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fprintf (' ________________________________________________________________\n')
fprintf ('|                                                                |\n')
fprintf ('|  The Temperature at %.3fkm is %.5f°K (%.5f°C)      |\n', Altitude,T_Alt,T_Alt-273.15)
fprintf ('|  The pressure at %.3fkm is %.5f Pa (%.5f Bar)        |\n', Altitude,P_Alt,P_Alt/100000)
fprintf ('|  The density at %.3fkm is %.5f kg/m^3 (%.5f g/m^3)    |\n', Altitude,rho_Alt,rho_Alt*1000)
fprintf ('|  See the Plots for more info...                                |\n')
fprintf ('|                                                                |\n')
fprintf (' ________________________________________________________________\n')
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Plotting the changes
for n=1:1:23
%Calculations made from 0km to 11km for plotting
    T(1,n)=T_0-6.5*H(1,n);
    P(1,n)=P_0*(T(1,n)/T_0)^(-g/(a_0*R));
    RHO(1,n)=rho_0*(T(1,n)/T_0)^(-g/(a_0*R)-1);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Calculations made from 11km to 20km for plotting
for n=24:1:41
   T(1,n)=T_11km;
   P(1,n)=P_11km*exp((-g/(R*T_11km))*((H(1,n)-11)*1000));
   RHO(1,n)=rho_11km*exp((-g/(R*T_11km))*((H(1,n)-11)*1000));
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Calculations made from 20km to 32km for plotting
for n=42:1:65
   T(1,n)=T_20km+(H(1,n)-20);
   P(1,n)=P_20km*(T(1,n)/T_20km)^(-g/(a_1*R));
   RHO(1,n)=rho_20km*(T(1,n)/T_20km)^((-g/(a_1*R))-1);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Calculations made from 32km to 47km for plotting
for n=66:1:95
   T(1,n)=T_32km+2.8*(H(1,n)-32);
   P(1,n)=P_32km*(T(1,n)/T_32km)^(-g/(a_2*R));
   RHO(1,n)=rho_32km*(T(1,n)/T_32km)^((-g/(a_2*R))-1);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Calculations made from 47km to 50km for plotting
for n=96:1:101
   T(1,n)=T_47km;
   P(1,n)=P_47km*exp((-g/(R*T_47km))*((H(1,n)-47)*1000));
   RHO(1,n)=rho_47km*exp((-g/(R*T_47km))*((H(1,n)-47)*1000));
end
T=T-273.15;
RHO=RHO*1000;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Plot Layout
%Plotting Temperature
subplot(2,2,1)
plot(T,H)
title('Temperature changes with height')
xlabel('Temperature in °C')
ylabel('Height in km')
% Plotting Pressure
subplot(2,2,2)
plot(H,P,'r')
title('Pressure changes with height')
ylabel('Pressure in Pa')
xlabel ('Height in km')
% Plotting Density
subplot(2,2,3)
plot(H,RHO,'m')
title('Density changes with height')
ylabel('Density in g/m^3')
xlabel ('Height in km')