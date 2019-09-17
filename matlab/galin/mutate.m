function NewPopulation=mutate(M,N,N1,Population,PMutate)

for ic=1:M
 rnum=rand;
 if rnum<=PMutate    
   iy=ceil(N*N1*rand);
   if Population(ic,iy)<0.5 
     Population(ic,iy)=1;
   else Population(ic,iy)=0; end
   Population(ic,iy);
 end
end

NewPopulation=Population;