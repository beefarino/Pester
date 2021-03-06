$pwd = Split-Path -Parent $MyInvocation.MyCommand.Path
. "$pwd\Cleanup.ps1"
. "$pwd\..\Pester.ps1"

Describe "When implementing filesystem tests in a fixture" {
    Setup -Dir "foo"
}

Describe "Cleanup" {

    It "should have removed the temp folder from the previous fixture" { 
        -not $TestDrive.should.exist()
    }

    It "should also remove the TestDrive:" {
        -not "TestDrive:".should.exist()
    }
}
