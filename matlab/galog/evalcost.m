function sqr_err=evalcost(Param_real,Constants_);


%EVALCOST CIVKA, 3 promenne R, C, L

% C ... znamena ze C je zahrnuto

% L ... je nulove


global Constants;
ff=Constants{1};
Z_MEAS=Constants{2};

%R = 5;
%L = x(1);
%C = x(2);

%R = x(1);
%C = x(2);

R = Param_real(1);
C=  Param_real(2);
L=  Param_real(3);


%L=0;

Z_MODEL=Z_civky(ff,L,C,R);

cost_sqr_abs=sum(((imag(Z_MEAS) - imag(Z_MODEL)).^2) + ((real(Z_MEAS) - real(Z_MODEL)).^2));

Zdeg_delta=(angle(Z_MEAS)-angle(Z_MODEL))*180/pi;
cost_sqr_deg=sqrt(sum(Zdeg_delta.*Zdeg_delta));
k=10;

costi = cost_sqr_abs + k * cost_sqr_deg;

%costi= (x1-1)^2 + (x2-1)^2;
sqr_err=costi;