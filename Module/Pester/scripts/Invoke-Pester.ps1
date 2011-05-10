[CmdletBinding()]
param( $path = '.', $filePattern = "*.Tests.*", $fixture )

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
			& $_.pspath $fixture;			
		}
		catch
		{
			Write-Error $_ -ErrorAction Continue;
		}
	}		
}