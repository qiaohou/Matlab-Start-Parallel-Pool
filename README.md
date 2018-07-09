# Matlab-Start-Parallel-Pool
 Start the parallel pool and set the pool size in MATLAB. 
 The script operates in 2 steps:
 1. Check the CPU cores available
 2. Set the parallel pool according to the user settings
 
 The two scripts below has different functionality as described. Choose one in your convenience!

## File startParallelAndSetCores.m
<pre><code> function startParallelAndSetCores(nCPUCores)
</code></pre>

*  pool size = nCPUCores
*  if nCPUCores==0, not use parallel
*  if nCPUCores<0 OR nCPUCores>ncores, use all cores
*  if 0<nCPUCores AND nCPUCores<=ncores, use nCPUCores cores

## File startParallel.m
<pre><code> function startParallel(npart)
</code></pre>

*  pool size = (CPU number) / npart
