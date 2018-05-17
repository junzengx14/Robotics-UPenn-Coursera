rho_Aluminum = 2.7*10^3;
E_Aluminum = 69*10^9;
Strength_Aluminum = 310*10^6;
rho_Plastic = 1.3*10^3;
E_Plastic = 2.2*10^9;
Strength_Plastic = 70*10^6;

d_Aluminum = sqrt(4*5000*10^3*0.1/pi/E_Aluminum);
d_Plastic = sqrt(4*5000*10^3*0.1/pi/E_Plastic);

m_Aluminum = 0.25*pi*d_Aluminum^2*0.1*rho_Aluminum;
m_Plastic = 0.25*pi*d_Plastic^2*0.1*rho_Plastic;