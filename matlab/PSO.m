function [x,fval,eflag,output]=emi_civka2_lc_imped_pso
global Constants;
Constants=cell(1,2);
nvars = 3;
%-------------------------------------
%CIEVKA
Rs=5; 
Ls=22*1e-6;
Cp=46.6*1e-12;
%-------------------------------------
%KONDENZATOR
%Rs=14.469; 
%Ls=4.606*1e-9;
%Cp=0.22*1e-6;
R=Rs;
Np=(100-0.1)*1e6/(0.01*1e6)+1;
ff=linspace(0.1*1e6,100*1e6,9991);
Z_MEAS = impd_cievky_zlozity_model(ff,Ls,Cp,Rs);
%Z_MEAS = impd_kon(ff,Ls,Cp,Rs);
Z0=50;
omg0_MEAS=1/sqrt(Ls*Cp);
Q_MEAS=omg0_MEAS*Ls/Rs;
Constants{1}=ff;
Constants{2}=Z_MEAS;
Constants{3}=Q_MEAS;
Constants{4}=omg0_MEAS;
LB = [1e-2;1e-12;1e-12]; 
UB = [1e+2;1e-6;1e-6];
options = optimoptions(@particleswarm,'PlotFcn','pswplotbestf','MaxStallIterations',100,'FunctionTolerance',1e-20)
[x,fval,eflag,output] = particleswarm(@cost_civka2_lc_impd_pso,nvars,LB,UB,options)
fprintf('Resistance is R = %g \n',x(1));
fprintf('Inductance is L = %g \n',x(2));
fprintf('Capacitance is C = %g \n',x(3));
