SELECT  
'mssqlserver' as dbtype,
@@SERVERNAME as hostname,
left(@@VERSION,200) as Version,
CONVERT(VARCHAR,SERVERPROPERTY('productversion')) AS ProductVersion,
CONVERT(VARCHAR,SERVERPROPERTY('productlevel')) AS ProductLevel,
CONVERT(VARCHAR(100),SERVERPROPERTY('edition'))AS Edition,
CONVERT(DECIMAL(10,2),(SUM(size * 8.00) / 1024.00 / 1024.00)) As UsedSpace, 
(SELECT CAST(COUNT(*) AS VARCHAR(10)) FROM sys.dm_os_schedulers WHERE status = 'VISIBLE ONLINE') as vCPU,
(SELECT (committed_target_kb/1024) FROM sys.dm_os_sys_info) as AllocatedMemory,
(SELECT (total_physical_memory_kb/1024) AS Total_OS_Memory_MB FROM sys.dm_os_sys_memory) as OSMemory,
CONVERT(VARCHAR,CONNECTIONPROPERTY('local_net_address')) AS local_net_address,
CONVERT(VARCHAR,CONNECTIONPROPERTY('local_tcp_port')) AS local_tcp_port,
CURRENT_TIMESTAMP as CurTime
FROM master.sys.master_files;