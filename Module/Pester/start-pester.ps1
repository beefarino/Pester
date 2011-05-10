$local:root = $myInvocation.MyCommand.Path | split-path;
write-debug "local module root path is $local:root"

# create module commands for each script under the scripts directory
# content of each script file becomes a unique exported module function
write-debug "generating module commands";
ls $local:root/scripts | foreach {
	$local:c = ( get-content -path $_.pspath ) -join "`n";	
	$local:n = $_.Name -replace '.{4}$','';
	
	$local:fxn = "function $local:n`n{`n$local:c`n}";
	
	write-debug $local:n
	write-verbose $local:fxn
	invoke-expression $local:fxn;
}

try
{
Add-Type @'
	public class PesterTestResult
	{
		public string Describing;
		public string It;
		public object Result;			
		public object Exception;
	}
'@ 
}
catch
{
}