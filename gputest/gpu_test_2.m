function gpu_test_2(testcpu,testgpu,TYPE)
% Test cpu and gpu (testcpu [0|1], testgpu [0|1], TYPE={'single'|'double'})
% on a power and sum task done 1000 times on 1000x1000 random matrix
if nargin<3, TYPE='single'; end
if nargin<2, testgpu=1; end
if nargin<1, testcpu=1; end

sz=1000;

if testgpu
  disp('GPU test');
  gpudev=parallel.gpu.GPUDevice.current()
  tic;
  X=gpuArray(rand(sz,TYPE));
  Z=X;    % init Z in GPU
  for i=1:sz 
    Z(:,i)=sum(X.^i); 
  end;
  toc
end
% GForce GT650M 2GB 
% single, sz=1000;
% lin,ml2012a, Time= 1.7 sec.
% lin,ml2013a, Time= 1.8 sec.
% lin,ml2013a, Time= 1.6 sec.
% double, sz=1000;
% lin,ml2013a, Time=10.5 sec

if testcpu
 disp('CPU test');
 tic; 
 X=rand(sz,TYPE);
 Z=X; % init Z in CPU
 for i=1:sz 
   Z(:,i)=sum(X.^i); 
 end;
 toc
end
% i7-3610QM, 2.3GHz, RAM 8GB-1600MHz 
% single, sz=1000;
% lin,ml2012a, Time 27.1 sec.
% lin,ml2013a, Time 27.5 sec.
% double, sz=1000;
% lin,ml2013a, Time 27.8 sec.
% lin,ml2013a, Time 27.5 sec.


%   parallel.gpu.CUDADevice handle
%   Package: parallel.gpu
% 
%   Properties:
%                       Name: 'GeForce GT 650M'
%                      Index: 1
%          ComputeCapability: '3.0'
%             SupportsDouble: 1
%              DriverVersion: 5
%         MaxThreadsPerBlock: 1024
%           MaxShmemPerBlock: 49152
%         MaxThreadBlockSize: [1024 1024 64]
%                MaxGridSize: [2.1475e+09 65535]
%                  SIMDWidth: 32
%                TotalMemory: 2.1473e+09
%                 FreeMemory: 2.0902e+09
%        MultiprocessorCount: 2
%               ClockRateKHz: 950000
%                ComputeMode: 'Default'
%       GPUOverlapsTransfers: 1
%     KernelExecutionTimeout: 1
%           CanMapHostMemory: 1
%            DeviceSupported: 1
%             DeviceSelected: 1
