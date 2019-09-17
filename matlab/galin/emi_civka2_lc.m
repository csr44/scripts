function emi_civka2_lc

global Constants;
Constants=cell(1,2);
nvars = 2;    % Number of variables
%par1=R.. par2=Ls.. par3=c..


LB = [1e-12;1e-12];   % Line1 ... Lmin=1pH
                      % Line2 ... Cmin=1pF
UB = [1e-6;1e-6];     % 


%options = gaoptimset('PopulationSize',48,'PopInitRange',mxini,'Generations',2000,'Display','iter','PlotFcns',@gaplotbestindiv,'Mutation',@mutationadaptfeasible,'TolFun',1e-9,'StallGenLimit',500);

options = gaoptimset('PopulationSize',24*2*8,'Generations',500,'Display','iter','PlotFcns',@gaplotbestindiv,'Mutation',@mutationadaptfeasible,'TolFun',1e-9,'StallGenLimit',500,'StallTimeLimit',1e9);
%options = gaoptimset(options,'FitnessScalingFcn' ,@fitscalingprop);
%options = gaoptimset(options,'SelectionFcn' ,@selectionroulette);

%options = gaoptimset('TolFun',1e-9,'StallGenLimit',500);
%CIEVKA
Rs=5; 
Ls=22*1e-6;
Cp=46.06*1e-12;

R=Rs;

ff=linspace(0.1*1e6,100*1e6,9991);
Np=size(ff,2);
%Z_MEAS =1./1./((Rs+(j*2*pi*ff*Ls))+(0));%Cp odstranene
Z_MEAS = impd_civky(ff,Ls,Cp,Rs);

Z0=50;

S11_MEAS=Z_MEAS./(2*Z0+Z_MEAS);
S21_MEAS=2*Z0*ones(1,Np)./(2*Z0+Z_MEAS);



omg0_MEAS=1/sqrt(Ls*Cp);
Q_MEAS=omg0_MEAS*Ls/Rs;

%f0_MEAS=omg0/(2*pi);


Constants{1}=ff;
Constants{2}=S11_MEAS;
Constants{3}=S21_MEAS;
Constants{4}=Q_MEAS;
Constants{5}=omg0_MEAS;


%[x,fval] = genetic(@cost_civka2_lc,nvars,[],[],[],[],LB,UB,[],options);
[x,fval] = ga(@cost_civka2_lc,nvars,[],[],[],[],LB,UB,[],options);
x

%fprintf('Resistance is R=%g \n',x(1));
fprintf('Inductance is is L=%g [nH] \n',x(1)/1e-9);
fprintf('Capacitance is C=%g [pF] \n',x(2)/1e-12);


