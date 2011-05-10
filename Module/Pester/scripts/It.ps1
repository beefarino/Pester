param($name, [ScriptBlock] $test) 
	
Write-Debug "it $name ...";
$local:result = New-Object PesterTestResult;

$local:result.Describing = $currentDescribing;
$local:result.It = $name;

try
{
	$local:result.Result = & $test;
	Write-Debug "test result: $($local:result.Result)";
}
catch
{
	$local:result.Result = $false;
	$local:result.Exception = $_;
	Write-Verbose "test exception: $($local:result.Exception)";
}	

return $local:result;