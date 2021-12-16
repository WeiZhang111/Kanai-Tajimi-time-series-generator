function S = nons_kanai_tajimi(w,t)

alpha = 5;
wg = 10;
zeta = 0.25;
wg2 = 35;
c = .8;
b = 4;

S = b*(exp(-1*c*t)-exp(-2*c*t)).^2*100*((1+alpha*w.^2)./((wg^2-w.^2).^2+(2*zeta*w.*wg^2).^2)+(1+alpha*w.^2)./((wg2^2-w.^2).^2+(2*zeta*w.*wg2^2).^2));



end