param($name, [ScriptBlock] $fixture) 
	Write-Debug "describing $name ...";
    $currentDescribing = $name;
    & $fixture
	$currentDescribing = $null;
    Cleanup

