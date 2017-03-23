$CurrentModulePath=Resolve-Path ($PSScriptRoot + '\..\..\..')
Import-Module -Name $CurrentModulePath -Force
$Function=Get-Command Get-SalesForceAccount
Describe "$($function.Name) Tests" {

   Context "Parameters for $($function.Name)"{

        It 'Has a Parameter called Account' {
            $Function.Parameters.Keys.Contains('Account') | Should Be 'True'
            }
        It 'Account Parameter is Identified as Mandatory being True' {
            [String]$Function.Parameters.Account.Attributes.Mandatory | Should be 'True'
            }
        It 'Account Parameter is of Hashtable Type' {
            $Function.Parameters.Account.ParameterType.FullName | Should be 'System.Collections.Hashtable'
            }
        It 'Account Parameter is member of ParameterSets' {
            [String]$Function.Parameters.Account.ParameterSets.Keys | Should Be '__AllParameterSets'
            }
        It 'Account Parameter Position is defined correctly' {
            [String]$Function.Parameters.Account.Attributes.Position | Should be '0'
            }
        It 'Does Account Parameter Accept Pipeline Input?' {
            [String]$Function.Parameters.Account.Attributes.ValueFromPipeline | Should be 'False'
            }
        It 'Does Account Parameter Accept Pipeline Input by PropertyName?' {
            [String]$Function.Parameters.Account.Attributes.ValueFromPipelineByPropertyName | Should be 'False'
            }
        It 'Does Account Parameter use advanced parameter Validation? ' {
            $Function.Parameters.Account.Attributes.TypeID.Name -contains 'ValidateNotNullOrEmptyAttribute' | Should Be 'False'
            $Function.Parameters.Account.Attributes.TypeID.Name -contains 'ValidateNotNullAttribute' | Should Be 'False'
            $Function.Parameters.Account.Attributes.TypeID.Name -contains 'ValidateScript' | Should Be 'False'
            $Function.Parameters.Account.Attributes.TypeID.Name -contains 'ValidateRangeAttribute' | Should Be 'False'
            $Function.Parameters.Account.Attributes.TypeID.Name -contains 'ValidatePatternAttribute' | Should Be 'False'
            }
        It 'Has Parameter Help Text for Account '{
            $function.Definition.Contains('.PARAMETER Account') | Should Be 'True'
            }
        It 'Has a Parameter called Token' {
            $Function.Parameters.Keys.Contains('Token') | Should Be 'True'
            }
        It 'Token Parameter is Identified as Mandatory being True' {
            [String]$Function.Parameters.Token.Attributes.Mandatory | Should be 'True'
            }
        It 'Token Parameter is of PSObject Type' {
            $Function.Parameters.Token.ParameterType.FullName | Should be 'System.Management.Automation.PSObject'
            }
        It 'Token Parameter is member of ParameterSets' {
            [String]$Function.Parameters.Token.ParameterSets.Keys | Should Be '__AllParameterSets'
            }
        It 'Token Parameter Position is defined correctly' {
            [String]$Function.Parameters.Token.Attributes.Position | Should be '1'
            }
        It 'Does Token Parameter Accept Pipeline Input?' {
            [String]$Function.Parameters.Token.Attributes.ValueFromPipeline | Should be 'False'
            }
        It 'Does Token Parameter Accept Pipeline Input by PropertyName?' {
            [String]$Function.Parameters.Token.Attributes.ValueFromPipelineByPropertyName | Should be 'False'
            }
        It 'Does Token Parameter use advanced parameter Validation? ' {
            $Function.Parameters.Token.Attributes.TypeID.Name -contains 'ValidateNotNullOrEmptyAttribute' | Should Be 'False'
            $Function.Parameters.Token.Attributes.TypeID.Name -contains 'ValidateNotNullAttribute' | Should Be 'False'
            $Function.Parameters.Token.Attributes.TypeID.Name -contains 'ValidateScript' | Should Be 'False'
            $Function.Parameters.Token.Attributes.TypeID.Name -contains 'ValidateRangeAttribute' | Should Be 'False'
            $Function.Parameters.Token.Attributes.TypeID.Name -contains 'ValidatePatternAttribute' | Should Be 'False'
            }
        It 'Has Parameter Help Text for Token '{
            $function.Definition.Contains('.PARAMETER Token') | Should Be 'True'
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


