    $failedTestCount = $TestResults.FailedTests.Length
    $TestResults = $null

    #$host.SetShouldExit($failedTestCount)
    exit $failedTestCount
