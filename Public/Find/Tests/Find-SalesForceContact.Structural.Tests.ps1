$CurrentModulePath=Resolve-Path ($PSScriptRoot + '\..\..\..')
Import-Module -Name $CurrentModulePath -Force
$Function=Get-Command Find-SalesForceContact
Describe "$($function.Name) Tests" {

   Context "Parameters for $($function.Name)"{

        It 'Has a Parameter called Contact' {
            $Function.Parameters.Keys.Contains('Contact') | Should Be 'True'
            }
        It 'Contact Parameter is Identified as Mandatory being True' {
            [String]$Function.Parameters.Contact.Attributes.Mandatory | Should be 'True'
            }
        It 'Contact Parameter is of Hashtable Type' {
            $Function.Parameters.Contact.ParameterType.FullName | Should be 'System.Collections.Hashtable'
            }
        It 'Contact Parameter is member of ParameterSets' {
            [String]$Function.Parameters.Contact.ParameterSets.Keys | Should Be '__AllParameterSets'
            }
        It 'Contact Parameter Position is defined correctly' {
            [String]$Function.Parameters.Contact.Attributes.Position | Should be '0'
            }
        It 'Does Contact Parameter Accept Pipeline Input?' {
            [String]$Function.Parameters.Contact.Attributes.ValueFromPipeline | Should be 'False'
            }
        It 'Does Contact Parameter Accept Pipeline Input by PropertyName?' {
            [String]$Function.Parameters.Contact.Attributes.ValueFromPipelineByPropertyName | Should be 'False'
            }
        It 'Does Contact Parameter use advanced parameter Validation? ' {
            $Function.Parameters.Contact.Attributes.TypeID.Name -contains 'ValidateNotNullOrEmptyAttribute' | Should Be 'False'
            $Function.Parameters.Contact.Attributes.TypeID.Name -contains 'ValidateNotNullAttribute' | Should Be 'False'
            $Function.Parameters.Contact.Attributes.TypeID.Name -contains 'ValidateScript' | Should Be 'False'
            $Function.Parameters.Contact.Attributes.TypeID.Name -contains 'ValidateRangeAttribute' | Should Be 'False'
            $Function.Parameters.Contact.Attributes.TypeID.Name -contains 'ValidatePatternAttribute' | Should Be 'False'
            }
        It 'Has Parameter Help Text for Contact '{
            $function.Definition.Contains('.PARAMETER Contact') | Should Be 'True'
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


