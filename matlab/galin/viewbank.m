function viewbank(index_of_population);
% This function enables the user view all the populations created during
% the optimization proccess

load genetic.mat Optimized_parametrs M N N1 Bank_of_Population Bank_of_Costs

sz=size(Bank_of_Population);
if length(sz)==2 sz(1,3)=1; end;
sprintf(strcat('Number of chromozomes in the population : ',int2str(M)))
sprintf(strcat('Number of parameters : ',int2str(N)))
sprintf(strcat('Number of bits per parameter : ',int2str(N1)))
sprintf(strcat('Number of populations : ',int2str(sz(1,3))))

Population=Bank_of_Population(:,:,index_of_population);
Costs=Bank_of_Costs(:,:,index_of_population);

showpop(M,N,N1,Population,Costs);
