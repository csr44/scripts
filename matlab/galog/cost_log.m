function [sqr_err,Param_real]=cost_log(Chromozome,N,N1,BoundaryVals,Constants,Params_type);

% chromozome is 1xN*N1 binary matrix
% Conversion: Bits in chromozome - > Parameters

% Params_type ... a row vectors ( 0 ... linear, 1 ... logaritmic )

Param=zeros(1,N); % vector in which the parameters are represented by integer numbers
for ii=1:N % go through the all genes in chromozomes
  pos=(ii-1)*N1+1;
  for jj=1:N1    
    Param(ii)=Param(ii)+(2^(N1-jj))*Chromozome(1,pos+jj-1);
  end;  
end;

% In the parameters there are stored bounds of dimensions so we can exctract them
% Structure of vector Dimensions : [param1_low param1_high .... ];

Param_real=zeros(1,N);
for ii=1:N % vector in which the parameters are represented by real numbers
  
  Param_low=BoundaryVals(2*(ii-1)+1);
  Param_high=BoundaryVals(2*(ii-1)+2);  
  
  if Params_type(ii)==0                     %Linear
   Nv=2^N1;   
   Param_real(ii)=(Param(ii)/(Nv-1))*(Param_high-Param_low)+Param_low;
  else                                      %Logaritmic
   Nv=2^N1;                                 %Number of integer values in N1 bit long binary number
   q=(Param_high/Param_low)^(1/(Nv-1));     %Quocient of a geometric series of values of the parameter
   Param_real(ii)=Param_low*q^Param(ii);    
  end;  
  
end;

sqr_err=evalcost(Param_real,Constants); 

% cost([1 1 1 0 0 1],2,3,[0 pi 0 pi])

