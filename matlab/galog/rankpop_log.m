function [RankedPopulation,CostsRanked]=rankpop_log(M,N,N1,Population,Costs);

Cost=zeros(M,1);
for ii=1:M
 Cost(ii,1)=Costs(ii,1);
end;

[Cost,ind]=sort(Cost);

CostsRanked=Costs;
Population2=Population;
for ii=1:M
   Population(ii,:)=Population2(ind(ii,1),:);
   CostsRanked(ii,:)=Costs(ind(ii,1),:);
end;

RankedPopulation=Population;
