# Matlab-Start-Parallel-Pool
 Start the parallel pool and set the pool size

% startParallelAndSetCores.m
function startParallelAndSetCores(nCPUCores)
%  pool size = nCPUCores
%  if nCPUCores==0, not use parallel
%  if nCPUCores<0 OR nCPUCores>ncores, use all cores
%  if 0<nCPUCores AND nCPUCores<=ncores, use nCPUCores cores

% startParallel.m
function startParallel(npart)
%  pool size = (CPU number) / npart
