function z = impd_civky(ff,L,C,R)
z =1./(1./((R+(j*2*pi*ff*L))+(j*2*pi*ff*C)));