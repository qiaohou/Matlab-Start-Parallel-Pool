# Matlab-Start-Parallel-Pool
 Start the parallel pool and set the pool size

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
