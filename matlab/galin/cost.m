function [sqr_err,Param_real]=cost(Chromozome,N,N1,Parameters);

% chromozome is 1xN*N1 binary matrix
% Conversion: Bits in chromozome - > Parameters

Param=zeros(1,N); % vector in which the parameters are represented by integer numbers
for ii=1:N % go through the all genes in chromozomes
  pos=(ii-1)*N1+1;
  for jj=1:N1    
    Param(ii)=Param(ii)+(2^(N1-jj))*Chromozome(1,pos+jj-1);
  end;  
end;

% In the parameters there are stored bounds of dimensions so we can exctract them
% Structure of vector Dimensions : [param1_low param1_high .... ];

Dimensions=Parameters(1:2*N);
Constants=Parameters(2*N+1:length(Parameters));

Param_real=zeros(1,N);
for ii=1:N % vector in which the parameters are represented by real numbers
  Param_low=Dimensions(2*(ii-1)+1);
  Param_high=Dimensions(2*(ii-1)+2);
  Param_real(ii)=(Param(ii)/(2^N1-1))*(Param_high-Param_low)+Param_low;
end;

sqr_err=evalcost(Param_real,Constants); 

% cost([1 1 1 0 0 1],2,3,[0 pi 0 pi])

