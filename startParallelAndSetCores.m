% Start the parallel pool and set the pool size
%  pool size = nCPUCores
%  if nCPUCores==0, not use parallel
%  if nCPUCores<0 OR nCPUCores>ncores, use all cores
%  if 0<nCPUCores AND nCPUCores<=ncores, use nCPUCores cores
function startParallelAndSetCores(nCPUCores)
%--------------------------------------------------------------------------
% Find capabilities of computer so we can best utilize them.
% Find if gpu is present
ngpus=gpuDeviceCount;
disp([num2str(ngpus) ' GPUs found']);
if ngpus>0
    lgpu=1;
    disp('GPU found');
    useGPU='yes';
else
    lgpu=0;
    disp('No GPU found');
    useGPU='no';
end
% Find number of cores
ncores=feature('numCores');
disp([num2str(ncores) ' cores found']);
% Find number of cpus
import java.lang.*;
r=Runtime.getRuntime;
ncpus=r.availableProcessors;
disp([num2str(ncpus) ' cpus found']);
if ncpus>1
    useParallel='yes';
else
    useParallel='no';
end
[archstr,maxsize,endian]=computer;
disp([...
    'This is a ' archstr ...
    ' computer that can have up to ' num2str(maxsize) ...
    ' elements in a matlab array and uses ' endian ...
    ' byte ordering.'...
    ]);
% Set up the size of the parallel pool if necessary
if nCPUCores>0 && nCPUCores<=ncores
    npool=nCPUCores;
elseif nCPUCores==0
    useParallel='no';
    npool=0;
else
    npool=ncores;
end
% Opening parallel pool
CoreNum=npool; %CPUs to be used
if strcmp(useParallel,'yes')
    if verLessThan('matlab','8.1')
        % -- Code to run in MATLAB R2013a and earlier here --
        if matlabpool('size')<=0  %parallel pool Not init 
            matlabpool('open','local',CoreNum);
        else  %parallel pool init 
            disp('matlab parallel pool already started');
        end
    else
        % -- Code to run in MATLAB R2013b and later here --    
        poolobj = gcp('nocreate'); % If no pool, do not create new one.
        if isempty(poolobj)  %parallel pool Not init 
            parpool(CoreNum);
        else  %parallel pool init 
            disp('matlab parallel pool already started');
        end
    end
else
    if nCPUCores>0
        disp('MATLAB CPU=1, no parallel is created!');
    else
        disp('Parallel is not used!');
    end
end
end