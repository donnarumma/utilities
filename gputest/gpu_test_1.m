TYPE='single'; 
%TYPE='double';

% Dati in pc
x=randn(500,1000,TYPE);
y=rand(500,1000,TYPE);

% -- CPU --
tic; 
for i=1:1e3, 
  z=x*y'; 
  z=z>rand(size(z),TYPE); 
end; 
fprintf('CPU-time: %.2f\n',toc)

% i7-3610QM 2.3GHz 8GB RAM @ 1600MHz: Time=6.7s

% -- GPU --
tic; 
% 1) Spostamo i dati nella RAM della gpu (una cosa lenta e bisogna farla poco spesso!!)
x_gpu=gpuArray(x);
y_gpu=gpuArray(y);
% 2) Calcoli nella gpu
for i=1:1e3, 
  z_gpu=x_gpu*y_gpu'; 
  z_gpu=z_gpu>rand(size(z_gpu),TYPE); 
end;
% 3) Prendere risultato nella cpu, per salvarlo o altro.
z=gather(z_gpu);
fprintf('GPU-time: %.2f\n',toc)

% nVidia GT650M 2GB RAM DDR3: Time=3.2s
