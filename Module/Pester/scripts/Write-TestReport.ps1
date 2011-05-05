Write-Host Tests completed
$results = Get-GlobalTestResults;
Write-Host "Passed: $($results.TestCount - $results.FailedTests.length) Failed: $($results.FailedTests.length)"
