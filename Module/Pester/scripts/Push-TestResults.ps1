$local:testResults = @{}
$local:testResults.FailedTests = @()
$local:testResults.TestCount = 0
$local:testResults.TestResults = @{};

if( ! $global:testResultStack )
{
	$global:testResultStack = New-Object System.Collections.Stack;
}

$global:testResultStack.push( $local:testResults );

return $local:TestResults;
