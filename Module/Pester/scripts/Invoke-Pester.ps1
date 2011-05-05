[CmdletBinding()]
param( $path = '.', $filePattern = "*.Tests.*" )

begin
{
	Write-Debug "path: $path; filepattern: $filepattern";
	
	$script:pesterFiles = @();
}
process
{
	$local:f = ls -path $path -filter $filePattern;
	if( $local:f )
	{
		Write-Debug "adding files: ";
		$local:f | Write-Debug;
		$script:pesterFiles += $local:f;
	}
}
end
{
	$script:pesterFiles | %{ 
		try
		{
			Write-Verbose "running $_";
			& $_.pspath;			
		}
		catch
		{
			Write-Error $_ -ErrorAction Continue;
		}
	}		
}