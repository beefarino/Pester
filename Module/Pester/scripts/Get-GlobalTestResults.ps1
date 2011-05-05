if ($global:TestResults -eq $null) {
	Write-Debug 'initializing test results';
	$global:testResults = @{}
    $global:testResults.FailedTests = @()
	$global:testResults.TestCount = 0
}

return $global:TestResults
