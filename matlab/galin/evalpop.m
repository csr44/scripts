function Costs=evalpop(M,N,N1,Population,Parameters,PreviousCosts);
% This function computes cost for every chromozome and stores these costs into Cost variable
% M ... number of chromozomes
% N ... number of genes (variables)
% N1 ... number of per gene
% Population = matrix in which rows there are genes
% Parameters
% PreviousCosts contains the cost values of previous population
% Only upper half of matrix PreviousCosts is valid because before we call evalpop we mate and mutate

figure(1);clf;axis([0 2 -1 1]);
str0='*** EVALUATING THE POPULATION ***';
title(str0);
str=' ';
for jj=1:N
  pstr=strcat(' Par#',int2str(jj));
  text(0.1+0.3*(jj-1),1.9,pstr);
 %str=strcat(str,pstr);  
end;
text(0.1+0.3*N,0.9,'Cost');

Costs=zeros(M,N+1);
if sum(abs(PreviousCosts))==0
   
for ii=1:M
Chromozome=Population(ii,:);
[cost_value,Param_real]=cost(Chromozome,N,N1,Parameters);
Costs(ii,1)=cost_value;

for jj=1:N  
  Costs(ii,jj+1)=Param_real(jj);
  text(0.1+0.3*(jj-1),0.9-0.1*ii,num2str(Param_real(jj)));
 end;
text(0.1+0.3*(N),0.9-0.1*ii,num2str(cost_value));
end;
   
   
else

for ii=1:M/2
cost_value=PreviousCosts(ii,1);
Param_real=PreviousCosts(ii,2:N+1);
Costs(ii,1)=cost_value;

for jj=1:N  
  Costs(ii,jj+1)=Param_real(jj);
  text(0.1+0.3*(jj-1),0.9-0.1*ii,num2str(Param_real(jj)));
 end;
text(0.1+0.3*(N),0.9-0.1*ii,num2str(cost_value));
end;


for ii=M/2+1:M
Chromozome=Population(ii,:);
[cost_value,Param_real]=cost(Chromozome,N,N1,Parameters);
Costs(ii,1)=cost_value;

for jj=1:N  
  Costs(ii,jj+1)=Param_real(jj);
  text(0.1+0.3*(jj-1),0.9-0.1*ii,num2str(Param_real(jj)));
 end;
text(0.1+0.3*(N),0.9-0.1*ii,num2str(cost_value));
end;

end;