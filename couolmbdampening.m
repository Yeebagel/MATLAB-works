clear; clf; syms t;

k = 3000;
m = 10;
Fc = m*9.81*0.12;
x0 = 0.1;
wn = sqrt(k/m);

figure(1); hold on;
coeff = 1;
for(i=1:20)
    t1 = linspace((i-1)*pi/wn,i*pi/wn);
    if(mod(i,2) == 0) %moving left
        x(t) = (x0 - coeff*Fc/k) * cos(wn*t) - Fc/k;
        plot(t1,x(t1))
        coeff = coeff + 2;
    else %moving right
        x(t) = (x0 - coeff*Fc/k) * cos(wn*t) + Fc/k;
        plot(t1,x(t1));
        coeff = coeff + 2;
    end
    if(k*abs(x(i*pi/wn)) < Fc) %check if mass should be at rest now
        disp("Final Displacement: "+double(x(i*pi/wn)));
        disp("Time to Rest: "+double(i*pi/wn));
        disp("Cycles Observed: "+double( (i*pi/wn) / (2*pi/wn)))
        xline(i*pi/wn);
        break;
    end
end
