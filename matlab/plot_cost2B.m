function plot_cost2B

global Constants;
Constants=cell(1,2);

Np=(100-0.1)*1e6/(0.01*1e6)+1;
ff=linspace(0.1*1e6,100*1e6,Np);

Rs=5; 
Ls=22*1e-6;
Cp=46.06*1e-12;
Ls_nom=Ls;
Cp_nom=Cp;

Z_MEAS = impd_civky2B(ff,Ls_nom,Cp_nom,Rs);

Constants{1}=ff;
Constants{2}=Z_MEAS;


meshgrid(-2:.2:2, -2:.2:2);
[xx,yy]=meshgrid(Ls_nom/2:Ls_nom/40:Ls_nom*2,Cp_nom/2:Cp_nom/40:Cp_nom*2);

Nr=size(xx,1);
Nc=size(xx,2);



for ii=1:Nr
 for jj=1:Nc
     
  x=[xx(ii,jj) yy(ii,jj)];
  costi = optima2B(x);
  mxc(ii,jj)=costi;
  
 end;
 fprintf('Line ii= %g calculated \n',ii);
 
end;

figure(1);
clf;
surf(xx,yy,mxc);


figure(2);
clf;
contour(xx,yy,mxc,20);
xlabel('x co-cordinate');
ylabel('y co-cordinate');



