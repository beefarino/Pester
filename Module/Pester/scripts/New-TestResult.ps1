[CmdletBinding()]
param( [Parameter(ValueFromPipeline=$true)]$object  )

Write-Debug "creating new test result object";

$local:result = New-Object psobject |

#equality
	Add-Member ScriptMethod be {
        param($expected)
		
		#write-debug ("$expected -eq $($this.actual) == " + ($expected -eq $this.actual))
        return ($expected -eq $this.actual)
        } -PassThru |

#container size
	Add-Member ScriptMethod have_count_of {
	    param($expected_count)

	    $count = 0
	    $this.actual | % { $count += 1 }

	    return ($expected_count -eq $count)

	    } -PassThru |
		
#containment
	Add-Member ScriptMethod contain {
        param($items)

		foreach( $item in @($items) )
		{
			if( $this.actual -notcontains $item ) 
			{ 
				return $false; 
			}
		}
        return $true;
    } -PassThru |
	
#path existence
	Add-Member ScriptMethod exist {
        return Test-Path $this.actual
    } -PassThru |

	Add-Member ScriptMethod match {
		param($pattern)
		
		return $this.actual -match $pattern;
	} -PassThru |
	
	Add-Member NoteProperty -Name actual -Value $null -PassThru |
	Add-Member ScriptProperty -Name ThisValue -Value { $this.actual } `
        {
            param($newactual)
            $this.actual = $newactual
    } -PassThru

$local:result.ThisValue = $object;
if( $null -eq $object )
{
	Write-Debug 'de-nulling null object';
	$object = New-Object psobject;
}

$object | Add-Member NoteProperty -Name Should -Value $local:result -PassThru
