function costi = cost_sQ(x)
global Constants;
ff=Constants{1};
Z_MEAS=Constants{2};
Q_MEAS=Constants{3};
omg0_MEAS=Constants{4};
R = x(1);
L = x(2);
C = x(3);
Z_MODEL=impd_civky(ff,L,C,R);
cost_sqr_abs=sum(((imag(Z_MEAS) - imag(Z_MODEL)).^2) + ((real(Z_MEAS) - real(Z_MODEL)).^2));
Q_MODEL=omg0_MEAS*L/R;
cost_Q=(Q_MEAS-Q_MODEL)^2;              
kQ=1e6;
costi = cost_sqr_abs + cost_Q*kQ;



