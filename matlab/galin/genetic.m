function Optimized_parametrs=genetic(M,N,N1,~,Pmutate,Parameters,Brakes)
%Paraboloid v pocatku
%genetic(12,2,8,1,0.05,[0 pi 0 pi],[0.01 100 10])
%Napetovy delic naprazdno
%genetic(12,2,8,1,0.05,[100 500 100 500],[0.01 100 10])
%FSSRECTG with rectangular patches
%fssrectg(f,theta,fi,ai,bi,aai,bbi,Mi,Ni,Pi,Qi,epsi1,epsi2,mi1,mi2,d,sw);
%                       
%            [amin amax bmin bmax  bbmin  bbmax ]
% Dimensions=[0.01 0.03 0.005 0.01 0.0005 0.002]
%           [  d      f1     f0     f2   M N P Q er  sw]
% Constants=[0.0015 11*1e9 12*1e9 13*1e9 5 5 2 2 2.2 1 ];
%																sqr_err max_num_of_populations  hours
% genetic(12,3,8,1,0.05,[Dimensions Constants],[0.01    10                      1])



%   M ... number of chromozomes (NUMBER OF INDIVIDUALS IN A GIVEN
%   GENERATION)
%   N ... number genes in chromozome (NUMBER OF VARIABLES)
%   N1 ... bit length of one gene
%   Cost counts cost function of a certain chromozone.
%   Reference to this chromozome is given in pointer p.
%   PCross ... probability of crossing two chromozomes
%   Pmutate ... probability of mutation
%   PCross should be close to 1 and Pmutate should be close to zero
%   e.g. PCross = 0.99 and Pmutate = 0.01
% In the variable Parameters there are stored constants and dimensions of FSS
% All specific is stored in the variable calles Parameters and with these specific variables only operates
% cost function cost(Chromozome,N,N1,Parameters). 
% The body of the function cost contains the the calling sequence: evalcost(Param_real,Constants)
% Only the function evalcost be rewritten when we change the shape of an metalic patch or when we change
% the method (either MoM or MoM-MKP)

% Structure of parameters
% At the begining of Parameters there are put the dimensions with it limits then follows the constants
% E.G. MoM method: fssrectg(f,theta,fi,ai,bi,aai,bbi,Mi,Ni,Pi,Qi,epsi1,epsi2,mi1,mi2,d,sw)
% dimensions = [ai bi aai bbi d] 
% constants = [f theta fi Mi Ni Pi Qi epsi1 epsi2 mi1 mi2 sw]
% Parameters = [boundary_values_of_dimensions constants]

% Brakes = [MASE MNOP MTOO]
% MASE ... maximal_allowed_square_error
% MNOP ... maximal_number_of_populations
% MTOO ... maximal_time_of_optimization_in_hours


scrsz=get(0,'ScreenSize');DefUIBgColor = get(0,'DefaultUIControlBackgroundColor');
Err_histogram=figure(...
   'Color',DefUIBgColor, ...  	% dark grey background
   'Numbertitle','off', ...
   'Name','Error norm', ...
   'Position',[1 (scrsz(4)-145) 300 125], ...
   'IntegerHandle','off',...
   'Resize','off', ...
   'IntegerHandle','off', ...
   'NumberTitle','off', ...
   'Renderer','zbuffer',...
   'Interruptible','on','MenuBar','none', ...
   'Tag','Step_hist');

MASE=Brakes(1);
MNOP=Brakes(2);
MTOO=Brakes(3);

Err_v=zeros(1,MNOP);drawnow;figure(Err_histogram);plot(1:MNOP,Err_v);
Err_axes=get(Err_histogram,'CurrentAxes');
set(Err_axes,'Color',DefUIBgColor);
set(Err_axes,'Position',[0.2 0.25 0.6 0.55]);
set(Err_axes,'FontSize',9);
ylabel('Error Norm');xlabel('Iteration');axis([1 MNOP 0 1]);


iop=0; % index of population

Bank_of_Population=zeros(M,N*N1,1);
Bank_of_Costs=zeros(M,N+1,1);

Population=round(rand(M,N*N1));

% At the begining it is generated the random population

%showpop(2,2,3,round(rand(2,6)),[0 pi 0 pi])
%showpop(10,2,8,round(rand(10,16)),[0 pi 0 pi])

% In costs there are stored costs for each chromozome and corresponding dimensions

Costs=zeros(M,N+1);PreviousCosts=Costs;

Costs=evalpop(M,N,N1,Population,Parameters,PreviousCosts);

[Population,Costs]=rankpop(M,N,N1,Population,Parameters,Costs);

showpop(M,N,N1,Population,Costs);

cost_best=Costs(1,1);

tic;

tm=toc;
tm_hour=tm/3600;

while ((cost_best>MASE) & (iop<MNOP) & (tm_hour<MTOO))

showpop(M,N,N1,Population,Costs);

% During the mating we only accept the best chromozomes from the population
% Usually we accept half of ranked population

Population=mate(M,N,N1,Population);iop=iop+1;

Population=mutate(M,N,N1,Population,Pmutate);

PreviousCosts=Costs;
Costs=evalpop(M,N,N1,Population,Parameters,PreviousCosts);

[Population,Costs]=rankpop(M,N,N1,Population,Parameters,Costs);

Bank_of_Population(:,:,iop)=Population;
Bank_of_Costs(:,:,iop)=Costs;

cost_best=Costs(1,1);

iop;
cost_best;

Err_v(iop)=cost_best;
figure(Err_histogram);
drawnow;%refresh(Step_histogram);
plot(1:MNOP,Err_v);
set(Err_axes,'Color',DefUIBgColor);
ylabel('Step Norm');xlabel('Iteration');

tm=toc;
tm_hour=tm/3600;

Optimized_parametrs=Costs(1,2:N+1);
save genetic.mat Optimized_parametrs M N N1 Bank_of_Population Bank_of_Costs

end;

showpop(M,N,N1,Population,Costs);

cost_best=Costs(1,1);
Optimized_parametrs=Costs(1,2:N+1);
save genetic.mat Optimized_parametrs M N N1 Bank_of_Population Bank_of_Costs

close(Err_histogram);