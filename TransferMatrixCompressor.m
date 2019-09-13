%Transfer matrix of a grating
A=@(theta,phi,alpha) [-cos(phi)/cos(theta) 0   0;-sin(alpha)*(sin(phi)+sin(theta))/cos(theta)   1   0;cos(alpha)*(sin(theta)+sin(phi))/cos(theta)    0   1;];
B=@(theta,phi,alpha) zeros(3);
C=@(theta,phi,alpha) zeros(3);
D=@(theta,phi,alpha) [-cos(theta)/cos(phi)  -sin(alpha)*(sin(phi)+sin(theta))/cos(phi)   cos(alpha)*(sin(theta)+sin(phi))/cos(phi);0    1   0;0    0   1;];
G=@(theta,phi,alpha) [A(theta,phi,alpha),B(theta,phi,alpha);C(theta,phi,alpha),D(theta,phi,alpha)];
%Transfer matrix of the free space propagation
B_l=@(l)[l 0 0;0 l 0;0 0 0];
F=@(l)[eye(3),B_l(l);zeros(3),eye(3)];
%Transfer matrix of a compressor
syms phi theta alpha b b2 L phi2 theta2
M=G(-phi2,-theta2,alpha)*F(b2)*G(-theta2,-phi2,alpha)*F(L)*G(phi,theta,alpha)*F(b)*G(theta,phi,alpha);
M=simplify(M)
A_m=M(1:3,1:3)
B_m=M(1:3,4:6)
C_m=M(4:6,1:3)
D_m=M(4:6,4:6)
