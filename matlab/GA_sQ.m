function GA_sQ
global Constants;
Constants=cell(1,2);
nvars = 3;  
LB = [1e-2;1e-8;1e-12];                   
UB = [1e+2;1e-5;1e-8];      
options = gaoptimset('PopulationSize',48*4*8,'SelectionFcn' ,...
@selectionroulette,'Generations',800,'Display','iter','PlotFcns',...
@gaplotbestindiv,'Mutation',@mutationadaptfeasible,...
'TolFun',1e-9,'StallGenLimit',500,'StallTimeLimit',1e9);
Rs=5; 
Ls=22*1e-6;
Cp=46.06*1e-12;
ff=linspace(0.1*1e6,100*1e6,9991);
Z_MEAS = impd_civky(ff,Ls,Cp,Rs);
omg0_MEAS=1/sqrt(Ls*Cp);
Q_MEAS=omg0_MEAS*Ls/Rs;
Constants{1}=ff;
Constants{2}=Z_MEAS;
Constants{3}=Q_MEAS;
Constants{4}=omg0_MEAS;
[x] = ga(@cost_sQ,nvars,[],[],[],[],LB,UB,[],options);
fprintf(' R=%g [ohm]\n',x(1));
fprintf(' L=%g [nH] \n',x(2)/1e-9);
fprintf(' C=%g [pF] \n',x(2)/1e-12);