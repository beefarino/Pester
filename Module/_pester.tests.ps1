function new-fixture
{
	param( 
		[Parameter( ValueFromPipeline=$true )]
		$path 
	);
	
	$template = @"
Describe 'Passing Test at $path' {
	It 'passes' { `$true }
}
"@

	$template | Out-File $path -Force 		
}

Describe "invoke-pester" {

	It "allows the user to specify a path" {
		$path = "./tests";
		$results = @( invoke-pester -path $path );
		
		$results.Count.should.be(1) -and @( $results | where { -not $_.result } ).Count.should.be(0);
	}
		
	It "allows the user to specify a file pattern" {
		$path = "./tests";
		$customFixture = "my.custompattern.ps1";
		( Join-Path $path $customFixture ) | new-fixture;
		
		$pattern = "*.custompattern.*";
		$results = @( invoke-pester -path $path -filepattern $pattern );

		$results.Count.should.be(1) -and @( $results | where { -not $_.result } ).Count.should.be(0);
	}
}