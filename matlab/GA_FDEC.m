function GA_FDEC
global Constants;
Constants=cell(1,2);
nvars = 3;  
LB = [1e-2;1e-8;1e-12];                   
UB = [1e+2;1e-5;1e-8];
options = gaoptimset('PopulationSize',48*4*8,'SelectionFcn' ,@selectionroulette,'Generations',800,'Display','iter','PlotFcns',...
@gaplotbestindiv,'Mutation',@mutationadaptfeasible,'TolFun',1e-9,'StallGenLimit',500,'StallTimeLimit',1e9);
Rs=5; 
Ls=22*1e-6;
Cp=46.06*1e-12;
ff=linspace(0.1*1e6,100*1e6,9991);
omg0_MEAS=1/sqrt(Ls*Cp);
Q_MEAS=omg0_MEAS*Ls/Rs;
f0_MEAS=omg0_MEAS/(2*pi);
B_MEAS=f0_MEAS/Q_MEAS;
ff_MEAS_corse=[0.1*1e6 f0_MEAS-(1.5*B_MEAS) f0_MEAS-(0.5*B_MEAS)  f0_MEAS f0_MEAS+(0.5*B_MEAS) f0_MEAS+(1.5*B_MEAS)];
if ((f0_MEAS-(1.5*B_MEAS))<0.1*1e6) && ((f0_MEAS+(1.5*B_MEAS))<100*1e6)
fstep=(f0_MEAS-0.1*1e6)/2;
ff_MEAS_corse=[0.1*1e6 f0_MEAS-2*fstep f0_MEAS-1*fstep f0_MEAS f0_MEAS+1*fstep f0_MEAS+2*fstep];       
end
if ((f0_MEAS+(1.5*B_MEAS))>100*1e6) && ((f0_MEAS-(1.5*B_MEAS))>0.1*1e6)
fstep=(100*1e6-f0_MEAS)/2;
ff_MEAS_corse=[0.1*1e6 f0_MEAS-2*fstep f0_MEAS-1*fstep f0_MEAS f0_MEAS+1*fstep f0_MEAS+2*fstep];       
end
Z_MEAS_corse=impd_civky(ff_MEAS_corse,Ls,Cp,Rs);
Z_MEAS = impd_civky(ff,Ls,Cp,Rs);
omg0_MEAS=1/sqrt(Ls*Cp);
Q_MEAS=omg0_MEAS*Ls/Rs;
Constants{1}=ff; %povodny fr. interval           
Constants{2}=Z_MEAS;     
Constants{3}=Q_MEAS;
Constants{4}=omg0_MEAS;
Constants{5}=ff_MEAS_corse;     %hruby frekvencny interval
Constants{6}=Z_MEAS_corse;    
[x] = ga(@cost_fdec2,nvars,[],[],[],[],LB,UB,[],options);