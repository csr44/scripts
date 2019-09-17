function costi = cost_civka2_lc(x)

global Constants;
ff=Constants{1};
S11_MEAS=Constants{2};
S21_MEAS=Constants{3};
Q_MEAS=Constants{4};
omg0_MEAS=Constants{5};


R = 50;
L = x(1);
C = x(2);

Np=size(ff,2);

Z_MODEL=impd_civky(ff,L,C,R);

Z0=50;

S11_MODEL=Z_MODEL./(2*Z0+Z_MODEL);
S21_MODEL=2*Z0*ones(1,Np)./(2*Z0+Z_MODEL);


cost_sqr_abs_S11=sum(((imag(S11_MEAS) - imag(S11_MODEL)).^2) + ((real(S11_MEAS) - real(S11_MODEL)).^2));
cost_sqr_abs_S21=sum(((imag(S21_MEAS) - imag(S21_MODEL)).^2) + ((real(S21_MEAS) - real(S21_MODEL)).^2));


%Zm_MODEL=max(abs(Z_MODEL));             % OK ... rychly zpusob vypoctu 
%Q_MODEL=sqrt(Zm_MODEL/R);               % OK ... rychly zpusob vypoctu

omg0_MODEL=1/sqrt(L*C);
Q_MODEL=omg0_MODEL*L/R;

cost_Q=(Q_MEAS-Q_MODEL)^2;              

%27.4 ->vyradenie cost_omg0
%cost_omg0=(omg0_MODEL-omg0_MEAS)^2;
cost_omg0=0
k_omg0=0.001;
kQ=1e7; % Pro pripad, kdy Q_MODEL=sqrt(Zm_MODEL/R);  


%Informace o faci Z moc nepomahala
costi = cost_sqr_abs_S11+ cost_sqr_abs_S21 + 1*cost_Q*kQ + k_omg0*cost_omg0;



