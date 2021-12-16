function S = kanai_tajimi(w)
    
alpha = 5;
wg = 10;
zeta = 0.25;

S = 100*(1+alpha*w.^2)./((wg^2-w.^2).^2+(2*zeta*w.*wg^2).^2);


end