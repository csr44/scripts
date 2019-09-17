function GA_sQ_DRUHE_VZORKOVANIE
global Constants;
Constants=cell(1,2);
nvars = 3;  
LB = [1e-2;1e-8;1e-12];                   
UB = [1e+2;1e-5;1e-8];      
options = gaoptimset('PopulationSize',48*4*8,'SelectionFcn' ,@selectionroulette,'Generations',800,'Display','iter','PlotFcns',@gaplotbestindiv,'Mutation',@mutationadaptfeasible,'TolFun',1e-9,'StallGenLimit',500,'StallTimeLimit',1e9);
Rs=5; 
Ls=22*1e-6;
Cp=46.06*1e-12;
ff=linspace(0.1,0.9,9)*1e6;	%0.1 to 1.0 MHz with 0.1MHz step
ff=[ff linspace(1,9,9)*1e6];	%1.0 to 9.0 MHz with 1.0MHz step
ff=[ff linspace(10,100,91)*1e6];	%1.0 to 9.0 MHz with 1.0MHz step
%Z_MEAS =1./( 1./(Rs+1i*2*pi*ff*Ls) + 1i*2*pi*ff*Cp );
Z_MEAS = impd_civky(ff,Ls,Cp,Rs);
omg0_MEAS=1/sqrt(Ls*Cp);
Q_MEAS=omg0_MEAS*Ls/Rs;
Constants{1}=ff;
Constants{2}=Z_MEAS;
Constants{3}=Q_MEAS;
Constants{4}=omg0_MEAS;
[x,fval,exitflag,output,population,scores] = ga(@cost_sQ,nvars,[],[],[],[],LB,UB,[],options);
fprintf(' R=%g [ohm]\n',x(1));
fprintf(' L=%g [nH] \n',x(2)/1e-9);
fprintf(' C=%g [pF] \n',x(2)/1e-12);