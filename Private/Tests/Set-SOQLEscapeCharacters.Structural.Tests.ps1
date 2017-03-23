$CurrentModulePath=Resolve-Path ($PSScriptRoot + '\..\..')
Import-Module -Name $CurrentModulePath -Force
$Function=Get-Command Set-SOQLEscapeCharacters
Describe "$($function.Name) Tests" {

   Context "Parameters for $($function.Name)"{

        It 'Has a Parameter called Value' {
            $Function.Parameters.Keys.Contains('Value') | Should Be 'True'
            }
        It 'Value Parameter is Identified as Mandatory being True' {
            [String]$Function.Parameters.Value.Attributes.Mandatory | Should be 'True'
            }
        It 'Value Parameter is of String Type' {
            $Function.Parameters.Value.ParameterType.FullName | Should be 'System.String'
            }
        It 'Value Parameter is member of ParameterSets' {
            [String]$Function.Parameters.Value.ParameterSets.Keys | Should Be '__AllParameterSets'
            }
        It 'Value Parameter Position is defined correctly' {
            [String]$Function.Parameters.Value.Attributes.Position | Should be '0'
            }
        It 'Does Value Parameter Accept Pipeline Input?' {
            [String]$Function.Parameters.Value.Attributes.ValueFromPipeline | Should be 'False'
            }
        It 'Does Value Parameter Accept Pipeline Input by PropertyName?' {
            [String]$Function.Parameters.Value.Attributes.ValueFromPipelineByPropertyName | Should be 'False'
            }
        It 'Does Value Parameter use advanced parameter Validation? ' {
            $Function.Parameters.Value.Attributes.TypeID.Name -contains 'ValidateNotNullOrEmptyAttribute' | Should Be 'False'
            $Function.Parameters.Value.Attributes.TypeID.Name -contains 'ValidateNotNullAttribute' | Should Be 'False'
            $Function.Parameters.Value.Attributes.TypeID.Name -contains 'ValidateScript' | Should Be 'False'
            $Function.Parameters.Value.Attributes.TypeID.Name -contains 'ValidateRangeAttribute' | Should Be 'False'
            $Function.Parameters.Value.Attributes.TypeID.Name -contains 'ValidatePatternAttribute' | Should Be 'False'
            }
        It 'Has Parameter Help Text for Value '{
            $function.Definition.Contains('.PARAMETER Value') | Should Be 'True'
            }
    }
    Context "Function $($function.Name) - Help Section" {

            It "Function $($function.Name) Has show-help comment block" {

                $function.Definition.Contains('<#') | should be 'True'
                $function.Definition.Contains('#>') | should be 'True'
            }

            It "Function $($function.Name) Has show-help comment block has a.SYNOPSIS" {

                $function.Definition.Contains('.SYNOPSIS') -or $function.Definition.Contains('.Synopsis') | should be 'True'

            }

            It "Function $($function.Name) Has show-help comment block has an example" {

                $function.Definition.Contains('.EXAMPLE') | should be 'True'
            }

            It "Function $($function.Name) Is an advanced function" {

                $function.CmdletBinding | should be 'True'
                $function.Definition.Contains('param') -or  $function.Definition.Contains('Param') | should be 'True'
            }
    
    }

 }


