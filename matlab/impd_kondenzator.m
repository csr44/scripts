function Z = Z_kondenzatora(f,L,C,R)
Z=1./(1./(1i*2*pi*f*L + 1./(1i*2*pi*f*C))+1./(R));