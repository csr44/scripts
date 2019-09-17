function costi = cost_fdec2(x)
global Constants;
ff_MEAS=Constants{1};
Z_MEAS=Constants{2};
Q_MEAS=Constants{3};
omg0_MEAS=Constants{4};
ff_MEAS_corse=Constants{5};     %hruby frekvencny interval
Z_MEAS_corse=Constants{6}; 
R = x(1);
L = x(2);
C = x(3);
Q_MODEL=omg0_MEAS*L/R;
omg0_MODEL=1/sqrt(L*C);
f0_MODEL=omg0_MODEL/(2*pi);
B_MODEL=f0_MODEL/Q_MODEL;
ff_MODEL=[f0_MODEL-(1.5*B_MODEL) f0_MODEL-(0.5*B_MODEL)  f0_MODEL f0_MODEL+(0.5*B_MODEL) f0_MODEL+(1.5*B_MODEL)];
if ((f0_MODEL-(1.5*B_MODEL))<0.1*1e6) & ((f0_MODEL+(1.5*B_MODEL))<100*1e6)
% PRILIS NIZKE Q, ZNAMENA, ZE BOD NEJVIAC VLAVO JE MENSIE AKO 0.1 MHz
fstep=(f0_MODEL-0.1*1e6)/2;
ff_MODEL=[f0_MODEL-2*fstep f0_MODEL-1*fstep f0_MODEL f0_MODEL+1*fstep f0_MODEL+2*fstep];       
end
if ((f0_MODEL+(1.5*B_MODEL))>100*1e6) & ((f0_MODEL-(1.5*B_MODEL))>0.1*1e6)
fstep=(100*1e6-f0_MODEL)/2;
ff_MODEL=[f0_MODEL-2*fstep f0_MODEL-1*fstep f0_MODEL f0_MODEL+1*fstep f0_MODEL+2*fstep];       
end
ff=[ff_MEAS_corse ff_MODEL 100*1e6];
Z_MODEL_corse2=impd_civky(ff,L,C,R);   
for ii=1:length(ff_MODEL)
 ffmdl=ff_MODEL(ii);   
 Zcalc=interp1(ff_MEAS,Z_MEAS,ffmdl);
 Z_MEAS2(ii)=Zcalc;
end;
Z_MEAS2_end=interp1(ff_MEAS,Z_MEAS,100*1e6);
Z_MEAS2=[Z_MEAS2 Z_MEAS2_end];
Z_MEAS_corse2=[Z_MEAS_corse Z_MEAS2];            
cost_sqr_abs=sum(((imag(Z_MEAS_corse2) - imag(Z_MODEL_corse2)).^2) + ((real(Z_MEAS_corse2) - real(Z_MODEL_corse2)).^2));
cost_Q=(Q_MEAS-Q_MODEL)^2;              
kQ=1e6;
costi = 1*cost_sqr_abs + cost_Q*kQ;