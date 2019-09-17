function Z = impd_civky(ff,L,C,R)
Z =1./( 1./(1i*2*pi*ff*L+R) + 1i*2*pi*ff*C );