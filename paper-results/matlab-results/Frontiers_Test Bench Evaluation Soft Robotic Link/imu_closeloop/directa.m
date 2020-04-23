function F=directa(x)
global L1 L2 L3 L0 a
%theta->x(1) phi->x(2) L0->x(3)
F(1)=L1-2*((x(3)/x(1))-a*cos((90*pi/180)-x(2)))*sin(x(1)/2);
F(2)=L2-2*((x(3)/x(1))-a*cos((210*pi/180)-x(2)))*sin(x(1)/2);
F(3)=L3-2*((x(3)/x(1))-a*cos((330*pi/180)-x(2)))*sin(x(1)/2);
