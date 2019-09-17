function NewPopulation=mate(M,N,N1,Population);

% In the variable Top_of_Population there are only the most successful chromozomes
% The total number of chromozomes is M

TheBestParents=Population(1:M/2,:);

Cross_column=ceil((N*N1-1)*rand(M/4,1));
ii=1;
for ic=1:2:M/2  
  Population(M/2+ic,1:Cross_column(ii,1))=Population(ic,1:Cross_column(ii,1));
  Population(M/2+ic,Cross_column(ii,1)+1:N*N1)=Population(ic+1,Cross_column(ii,1)+1:N*N1);
  Population(M/2+ic+1,1:Cross_column(ii,1))=Population(ic+1,1:Cross_column(ii,1));
  Population(M/2+ic+1,Cross_column(ii,1)+1:N*N1)=Population(ic,Cross_column(ii,1)+1:N*N1);
  ii=ii+1;
end;

NewPopulation=Population;  