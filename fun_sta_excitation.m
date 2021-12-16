function [tn,fn] = fun_sta_excitation(t_terminal,h)

% tn and fn are of length t_terminial/h + 1

% Kanai-Tajimi spectrum is used.

% compute upper cut-off frequency wu
% - on Python: it is 635
wu = 635;

% define parameters for the cosine series formula:
N = 500; % the number of frequency points
dw = wu/N; % frequency interval
T0 = t_terminal; %round(2*pi/dw); % minimal period
dt = .001; % time interval n  
n1 = round(T0/dt); % number of time points

% generate time seties:
t = 0:dt:T0; % corresponding to smaller dt.
% 0, 0.001, 0.002, 0.003, etc.
phi_list = 2*pi*rand(N,1);

f = zeros(n1+1,1);

for i =1:(n1+1)
    
    for j = 1:N
        f(i) = f(i)+ 2*(kanai_tajimi(j*dw)*dw)^0.5*cos(j*dw*(i-1)*dt+phi_list(j));
    end

end

tn = zeros((t_terminal/h + 1),1);
fn = tn;

for i = 1:length(tn)
    tn(i) = t((h/dt)*(i-1)+1);
    fn(i) = f((h/dt)*(i-1)+1);
end


end