$CurrentModulePath=Resolve-Path ($PSScriptRoot + '\..\..\..')
Import-Module -Name $CurrentModulePath -Force
$Function=Get-Command Invoke-SalesForceAPI
Describe "$($function.Name) Tests" {

   Context "Parameters for $($function.Name)"{

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
            [String]$Function.Parameters.Token.Attributes.Position | Should be '0'
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
        It 'Has a Parameter called APIURI' {
            $Function.Parameters.Keys.Contains('APIURI') | Should Be 'True'
            }
        It 'APIURI Parameter is Identified as Mandatory being True' {
            [String]$Function.Parameters.APIURI.Attributes.Mandatory | Should be 'True'
            }
        It 'APIURI Parameter is of String Type' {
            $Function.Parameters.APIURI.ParameterType.FullName | Should be 'System.String'
            }
        It 'APIURI Parameter is member of ParameterSets' {
            [String]$Function.Parameters.APIURI.ParameterSets.Keys | Should Be '__AllParameterSets'
            }
        It 'APIURI Parameter Position is defined correctly' {
            [String]$Function.Parameters.APIURI.Attributes.Position | Should be '1'
            }
        It 'Does APIURI Parameter Accept Pipeline Input?' {
            [String]$Function.Parameters.APIURI.Attributes.ValueFromPipeline | Should be 'False'
            }
        It 'Does APIURI Parameter Accept Pipeline Input by PropertyName?' {
            [String]$Function.Parameters.APIURI.Attributes.ValueFromPipelineByPropertyName | Should be 'False'
            }
        It 'Does APIURI Parameter use advanced parameter Validation? ' {
            $Function.Parameters.APIURI.Attributes.TypeID.Name -contains 'ValidateNotNullOrEmptyAttribute' | Should Be 'False'
            $Function.Parameters.APIURI.Attributes.TypeID.Name -contains 'ValidateNotNullAttribute' | Should Be 'False'
            $Function.Parameters.APIURI.Attributes.TypeID.Name -contains 'ValidateScript' | Should Be 'False'
            $Function.Parameters.APIURI.Attributes.TypeID.Name -contains 'ValidateRangeAttribute' | Should Be 'False'
            $Function.Parameters.APIURI.Attributes.TypeID.Name -contains 'ValidatePatternAttribute' | Should Be 'False'
            }
        It 'Has Parameter Help Text for APIURI '{
            $function.Definition.Contains('.PARAMETER APIURI') | Should Be 'True'
            }
        It 'Has a Parameter called APICALLType' {
            $Function.Parameters.Keys.Contains('APICALLType') | Should Be 'True'
            }
        It 'APICALLType Parameter is Identified as Mandatory being True' {
            [String]$Function.Parameters.APICALLType.Attributes.Mandatory | Should be 'True'
            }
        It 'APICALLType Parameter is of String Type' {
            $Function.Parameters.APICALLType.ParameterType.FullName | Should be 'System.String'
            }
        It 'APICALLType Parameter is member of ParameterSets' {
            [String]$Function.Parameters.APICALLType.ParameterSets.Keys | Should Be '__AllParameterSets'
            }
        It 'APICALLType Parameter Position is defined correctly' {
            [String]$Function.Parameters.APICALLType.Attributes.Position | Should be '2'
            }
        It 'Does APICALLType Parameter Accept Pipeline Input?' {
            [String]$Function.Parameters.APICALLType.Attributes.ValueFromPipeline | Should be 'False'
            }
        It 'Does APICALLType Parameter Accept Pipeline Input by PropertyName?' {
            [String]$Function.Parameters.APICALLType.Attributes.ValueFromPipelineByPropertyName | Should be 'False'
            }
        It 'Does APICALLType Parameter use advanced parameter Validation? ' {
            $Function.Parameters.APICALLType.Attributes.TypeID.Name -contains 'ValidateNotNullOrEmptyAttribute' | Should Be 'False'
            $Function.Parameters.APICALLType.Attributes.TypeID.Name -contains 'ValidateNotNullAttribute' | Should Be 'False'
            $Function.Parameters.APICALLType.Attributes.TypeID.Name -contains 'ValidateScript' | Should Be 'False'
            $Function.Parameters.APICALLType.Attributes.TypeID.Name -contains 'ValidateRangeAttribute' | Should Be 'False'
            $Function.Parameters.APICALLType.Attributes.TypeID.Name -contains 'ValidatePatternAttribute' | Should Be 'False'
            }
        It 'Has Parameter Help Text for APICALLType '{
            $function.Definition.Contains('.PARAMETER APICALLType') | Should Be 'True'
            }
        It 'Has a Parameter called Body' {
            $Function.Parameters.Keys.Contains('Body') | Should Be 'True'
            }
        It 'Body Parameter is Identified as Mandatory being False' {
            [String]$Function.Parameters.Body.Attributes.Mandatory | Should be 'False'
            }
        It 'Body Parameter is of Object Type' {
            $Function.Parameters.Body.ParameterType.FullName | Should be 'System.Object'
            }
        It 'Body Parameter is member of ParameterSets' {
            [String]$Function.Parameters.Body.ParameterSets.Keys | Should Be '__AllParameterSets'
            }
        It 'Body Parameter Position is defined correctly' {
            [String]$Function.Parameters.Body.Attributes.Position | Should be '3'
            }
        It 'Does Body Parameter Accept Pipeline Input?' {
            [String]$Function.Parameters.Body.Attributes.ValueFromPipeline | Should be 'False'
            }
        It 'Does Body Parameter Accept Pipeline Input by PropertyName?' {
            [String]$Function.Parameters.Body.Attributes.ValueFromPipelineByPropertyName | Should be 'False'
            }
        It 'Does Body Parameter use advanced parameter Validation? ' {
            $Function.Parameters.Body.Attributes.TypeID.Name -contains 'ValidateNotNullOrEmptyAttribute' | Should Be 'False'
            $Function.Parameters.Body.Attributes.TypeID.Name -contains 'ValidateNotNullAttribute' | Should Be 'False'
            $Function.Parameters.Body.Attributes.TypeID.Name -contains 'ValidateScript' | Should Be 'False'
            $Function.Parameters.Body.Attributes.TypeID.Name -contains 'ValidateRangeAttribute' | Should Be 'False'
            $Function.Parameters.Body.Attributes.TypeID.Name -contains 'ValidatePatternAttribute' | Should Be 'False'
            }
        It 'Has Parameter Help Text for Body '{
            $function.Definition.Contains('.PARAMETER Body') | Should Be 'True'
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


