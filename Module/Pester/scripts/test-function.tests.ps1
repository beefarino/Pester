

Describe 'test-function' {

	It "accepts a single input" {
		$r = ./test-function.ps1 'input';
		$r.should.be.( 'input' );
	}

}