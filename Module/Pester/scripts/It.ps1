param($name, [ScriptBlock] $test) 
	Write-Debug "it $name ...";
	$local:result = New-Object PesterTestResult;

	$local:result.Describing = $currentDescribing;
	$local:result.Name = $name;
	
	try
	{
    	$local:result.Result = & $test;
	}
	catch
	{
		$local:result.Result = $null;
	}	
	
	return $local:result;
	


