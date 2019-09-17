function showpop(M,N,~,~,Costs)
% This function gives the statistic of Population
% M ... number of chromozomes
% N ... number of genes (variables)
% N1 ... number of per gene
% Population = matrix in which rows there are genes
% Parameters

figure(1);clf;axis([0 2 -1 1]);
str0='*** STATISTIC OF THE POPULATION ***';
title(str0);
str=' ';
for jj=1:N
  pstr=strcat(' Par#',int2str(jj));
  text(0.1+0.3*(jj-1),1.9,pstr);
 %str=strcat(str,pstr);  
end;
text(1.5,0.9,'Cost'); %DOCASNE Xpos=1.5

%text(0.1+0.3*N,0.9,'Cost'); %OLD

for ii=1:M
cost_value=Costs(ii,1);
Param_real=Costs(ii,2:N+1);

 for jj=1:N  
  text(0.1+0.3*(jj-1),0.9-0.1*ii,num2str(Param_real(jj)));
 end;
%text(0.1+0.3*(N),0.9-0.1*ii,num2str(cost_value)); %OLD
text(1.5,0.9-0.1*ii,num2str(cost_value)); %DOCASNE Xpos=1.5


end;
