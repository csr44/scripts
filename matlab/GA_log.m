function GA_log
global Constants;     
Constants=cell(1,2);   
Rs=5;               
Ls=22*1e-6;         
Cp=46.06*1e-12;     
ff=linspace(0.1*1e6,100*1e6,9991); 
Z_MEAS = impd_civky(ff,Ls,Cp,Rs); 
Constants{1}=ff;
Constants{2}=Z_MEAS;
M=24*2*8; % pocet jedincov
N=3;    % pocet neznamych
N1=20;  % pcoet bitov na 1 promennu (na jeden gen)
        % odporuca se mat na promennu aspon 24 jedincov
PCross=1;
Pmutate=0.05;
Dimensions=[1e-2 1e+2 1e-6 1e-3 1e-12 1e-6];
Constants_=[];
Brakes=[1 700 10];
Params_type=[1 1 1];
BoundaryVals=Dimensions;
x=genetic_log(M,N,N1,PCross,Pmutate,Params_type,BoundaryVals,Constants_,...
Brakes);
fprintf('First parameter x1 =%g [-] \n',x(1));
fprintf('Second parameter x2 =%g [-] \n',x(2));
fprintf('Third parameter x3 =%g [-] \n',x(3));
