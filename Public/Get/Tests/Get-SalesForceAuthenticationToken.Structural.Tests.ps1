$CurrentModulePath=Resolve-Path ($PSScriptRoot + '\..\..\..')
Import-Module -Name $CurrentModulePath -Force
$Function=Get-Command Get-SalesForceAuthenticationToken
Describe "$($function.Name) Tests" {

   Context "Parameters for $($function.Name)"{

        It 'Has a Parameter called Uri' {
            $Function.Parameters.Keys.Contains('Uri') | Should Be 'True'
            }
        It 'Uri Parameter is Identified as Mandatory being True' {
            [String]$Function.Parameters.Uri.Attributes.Mandatory | Should be 'True'
            }
        It 'Uri Parameter is of String Type' {
            $Function.Parameters.Uri.ParameterType.FullName | Should be 'System.String'
            }
        It 'Uri Parameter is member of ParameterSets' {
            [String]$Function.Parameters.Uri.ParameterSets.Keys | Should Be '__AllParameterSets'
            }
        It 'Uri Parameter Position is defined correctly' {
            [String]$Function.Parameters.Uri.Attributes.Position | Should be '0'
            }
        It 'Does Uri Parameter Accept Pipeline Input?' {
            [String]$Function.Parameters.Uri.Attributes.ValueFromPipeline | Should be 'False'
            }
        It 'Does Uri Parameter Accept Pipeline Input by PropertyName?' {
            [String]$Function.Parameters.Uri.Attributes.ValueFromPipelineByPropertyName | Should be 'False'
            }
        It 'Does Uri Parameter use advanced parameter Validation? ' {
            $Function.Parameters.Uri.Attributes.TypeID.Name -contains 'ValidateNotNullOrEmptyAttribute' | Should Be 'False'
            $Function.Parameters.Uri.Attributes.TypeID.Name -contains 'ValidateNotNullAttribute' | Should Be 'False'
            $Function.Parameters.Uri.Attributes.TypeID.Name -contains 'ValidateScript' | Should Be 'False'
            $Function.Parameters.Uri.Attributes.TypeID.Name -contains 'ValidateRangeAttribute' | Should Be 'False'
            $Function.Parameters.Uri.Attributes.TypeID.Name -contains 'ValidatePatternAttribute' | Should Be 'False'
            }
        It 'Has Parameter Help Text for Uri '{
            $function.Definition.Contains('.PARAMETER Uri') | Should Be 'True'
            }
        It 'Has a Parameter called GrantType' {
            $Function.Parameters.Keys.Contains('GrantType') | Should Be 'True'
            }
        It 'GrantType Parameter is Identified as Mandatory being True' {
            [String]$Function.Parameters.GrantType.Attributes.Mandatory | Should be 'True'
            }
        It 'GrantType Parameter is of String Type' {
            $Function.Parameters.GrantType.ParameterType.FullName | Should be 'System.String'
            }
        It 'GrantType Parameter is member of ParameterSets' {
            [String]$Function.Parameters.GrantType.ParameterSets.Keys | Should Be '__AllParameterSets'
            }
        It 'GrantType Parameter Position is defined correctly' {
            [String]$Function.Parameters.GrantType.Attributes.Position | Should be '1'
            }
        It 'Does GrantType Parameter Accept Pipeline Input?' {
            [String]$Function.Parameters.GrantType.Attributes.ValueFromPipeline | Should be 'False'
            }
        It 'Does GrantType Parameter Accept Pipeline Input by PropertyName?' {
            [String]$Function.Parameters.GrantType.Attributes.ValueFromPipelineByPropertyName | Should be 'False'
            }
        It 'Does GrantType Parameter use advanced parameter Validation? ' {
            $Function.Parameters.GrantType.Attributes.TypeID.Name -contains 'ValidateNotNullOrEmptyAttribute' | Should Be 'False'
            $Function.Parameters.GrantType.Attributes.TypeID.Name -contains 'ValidateNotNullAttribute' | Should Be 'False'
            $Function.Parameters.GrantType.Attributes.TypeID.Name -contains 'ValidateScript' | Should Be 'False'
            $Function.Parameters.GrantType.Attributes.TypeID.Name -contains 'ValidateRangeAttribute' | Should Be 'False'
            $Function.Parameters.GrantType.Attributes.TypeID.Name -contains 'ValidatePatternAttribute' | Should Be 'False'
            }
        It 'Has Parameter Help Text for GrantType '{
            $function.Definition.Contains('.PARAMETER GrantType') | Should Be 'True'
            }
        It 'Has a Parameter called ConsumerKey' {
            $Function.Parameters.Keys.Contains('ConsumerKey') | Should Be 'True'
            }
        It 'ConsumerKey Parameter is Identified as Mandatory being True' {
            [String]$Function.Parameters.ConsumerKey.Attributes.Mandatory | Should be 'True'
            }
        It 'ConsumerKey Parameter is of String Type' {
            $Function.Parameters.ConsumerKey.ParameterType.FullName | Should be 'System.String'
            }
        It 'ConsumerKey Parameter is member of ParameterSets' {
            [String]$Function.Parameters.ConsumerKey.ParameterSets.Keys | Should Be '__AllParameterSets'
            }
        It 'ConsumerKey Parameter Position is defined correctly' {
            [String]$Function.Parameters.ConsumerKey.Attributes.Position | Should be '2'
            }
        It 'Does ConsumerKey Parameter Accept Pipeline Input?' {
            [String]$Function.Parameters.ConsumerKey.Attributes.ValueFromPipeline | Should be 'False'
            }
        It 'Does ConsumerKey Parameter Accept Pipeline Input by PropertyName?' {
            [String]$Function.Parameters.ConsumerKey.Attributes.ValueFromPipelineByPropertyName | Should be 'False'
            }
        It 'Does ConsumerKey Parameter use advanced parameter Validation? ' {
            $Function.Parameters.ConsumerKey.Attributes.TypeID.Name -contains 'ValidateNotNullOrEmptyAttribute' | Should Be 'False'
            $Function.Parameters.ConsumerKey.Attributes.TypeID.Name -contains 'ValidateNotNullAttribute' | Should Be 'False'
            $Function.Parameters.ConsumerKey.Attributes.TypeID.Name -contains 'ValidateScript' | Should Be 'False'
            $Function.Parameters.ConsumerKey.Attributes.TypeID.Name -contains 'ValidateRangeAttribute' | Should Be 'False'
            $Function.Parameters.ConsumerKey.Attributes.TypeID.Name -contains 'ValidatePatternAttribute' | Should Be 'False'
            }
        It 'Has Parameter Help Text for ConsumerKey '{
            $function.Definition.Contains('.PARAMETER ConsumerKey') | Should Be 'True'
            }
        It 'Has a Parameter called ConsumerSecret' {
            $Function.Parameters.Keys.Contains('ConsumerSecret') | Should Be 'True'
            }
        It 'ConsumerSecret Parameter is Identified as Mandatory being True' {
            [String]$Function.Parameters.ConsumerSecret.Attributes.Mandatory | Should be 'True'
            }
        It 'ConsumerSecret Parameter is of String Type' {
            $Function.Parameters.ConsumerSecret.ParameterType.FullName | Should be 'System.String'
            }
        It 'ConsumerSecret Parameter is member of ParameterSets' {
            [String]$Function.Parameters.ConsumerSecret.ParameterSets.Keys | Should Be '__AllParameterSets'
            }
        It 'ConsumerSecret Parameter Position is defined correctly' {
            [String]$Function.Parameters.ConsumerSecret.Attributes.Position | Should be '3'
            }
        It 'Does ConsumerSecret Parameter Accept Pipeline Input?' {
            [String]$Function.Parameters.ConsumerSecret.Attributes.ValueFromPipeline | Should be 'False'
            }
        It 'Does ConsumerSecret Parameter Accept Pipeline Input by PropertyName?' {
            [String]$Function.Parameters.ConsumerSecret.Attributes.ValueFromPipelineByPropertyName | Should be 'False'
            }
        It 'Does ConsumerSecret Parameter use advanced parameter Validation? ' {
            $Function.Parameters.ConsumerSecret.Attributes.TypeID.Name -contains 'ValidateNotNullOrEmptyAttribute' | Should Be 'False'
            $Function.Parameters.ConsumerSecret.Attributes.TypeID.Name -contains 'ValidateNotNullAttribute' | Should Be 'False'
            $Function.Parameters.ConsumerSecret.Attributes.TypeID.Name -contains 'ValidateScript' | Should Be 'False'
            $Function.Parameters.ConsumerSecret.Attributes.TypeID.Name -contains 'ValidateRangeAttribute' | Should Be 'False'
            $Function.Parameters.ConsumerSecret.Attributes.TypeID.Name -contains 'ValidatePatternAttribute' | Should Be 'False'
            }
        It 'Has Parameter Help Text for ConsumerSecret '{
            $function.Definition.Contains('.PARAMETER ConsumerSecret') | Should Be 'True'
            }
        It 'Has a Parameter called UserToken' {
            $Function.Parameters.Keys.Contains('UserToken') | Should Be 'True'
            }
        It 'UserToken Parameter is Identified as Mandatory being True' {
            [String]$Function.Parameters.UserToken.Attributes.Mandatory | Should be 'True'
            }
        It 'UserToken Parameter is of String Type' {
            $Function.Parameters.UserToken.ParameterType.FullName | Should be 'System.String'
            }
        It 'UserToken Parameter is member of ParameterSets' {
            [String]$Function.Parameters.UserToken.ParameterSets.Keys | Should Be '__AllParameterSets'
            }
        It 'UserToken Parameter Position is defined correctly' {
            [String]$Function.Parameters.UserToken.Attributes.Position | Should be '4'
            }
        It 'Does UserToken Parameter Accept Pipeline Input?' {
            [String]$Function.Parameters.UserToken.Attributes.ValueFromPipeline | Should be 'False'
            }
        It 'Does UserToken Parameter Accept Pipeline Input by PropertyName?' {
            [String]$Function.Parameters.UserToken.Attributes.ValueFromPipelineByPropertyName | Should be 'False'
            }
        It 'Does UserToken Parameter use advanced parameter Validation? ' {
            $Function.Parameters.UserToken.Attributes.TypeID.Name -contains 'ValidateNotNullOrEmptyAttribute' | Should Be 'False'
            $Function.Parameters.UserToken.Attributes.TypeID.Name -contains 'ValidateNotNullAttribute' | Should Be 'False'
            $Function.Parameters.UserToken.Attributes.TypeID.Name -contains 'ValidateScript' | Should Be 'False'
            $Function.Parameters.UserToken.Attributes.TypeID.Name -contains 'ValidateRangeAttribute' | Should Be 'False'
            $Function.Parameters.UserToken.Attributes.TypeID.Name -contains 'ValidatePatternAttribute' | Should Be 'False'
            }
        It 'Has Parameter Help Text for UserToken '{
            $function.Definition.Contains('.PARAMETER UserToken') | Should Be 'True'
            }
        It 'Has a Parameter called SalesForceUserCredential' {
            $Function.Parameters.Keys.Contains('SalesForceUserCredential') | Should Be 'True'
            }
        It 'SalesForceUserCredential Parameter is Identified as Mandatory being True' {
            [String]$Function.Parameters.SalesForceUserCredential.Attributes.Mandatory | Should be 'True'
            }
        It 'SalesForceUserCredential Parameter is of PSCredential Type' {
            $Function.Parameters.SalesForceUserCredential.ParameterType.FullName | Should be 'System.Management.Automation.PSCredential'
            }
        It 'SalesForceUserCredential Parameter is member of ParameterSets' {
            [String]$Function.Parameters.SalesForceUserCredential.ParameterSets.Keys | Should Be '__AllParameterSets'
            }
        It 'SalesForceUserCredential Parameter Position is defined correctly' {
            [String]$Function.Parameters.SalesForceUserCredential.Attributes.Position | Should be '5'
            }
        It 'Does SalesForceUserCredential Parameter Accept Pipeline Input?' {
            [String]$Function.Parameters.SalesForceUserCredential.Attributes.ValueFromPipeline | Should be 'False'
            }
        It 'Does SalesForceUserCredential Parameter Accept Pipeline Input by PropertyName?' {
            [String]$Function.Parameters.SalesForceUserCredential.Attributes.ValueFromPipelineByPropertyName | Should be 'False'
            }
        It 'Does SalesForceUserCredential Parameter use advanced parameter Validation? ' {
            $Function.Parameters.SalesForceUserCredential.Attributes.TypeID.Name -contains 'ValidateNotNullOrEmptyAttribute' | Should Be 'False'
            $Function.Parameters.SalesForceUserCredential.Attributes.TypeID.Name -contains 'ValidateNotNullAttribute' | Should Be 'False'
            $Function.Parameters.SalesForceUserCredential.Attributes.TypeID.Name -contains 'ValidateScript' | Should Be 'False'
            $Function.Parameters.SalesForceUserCredential.Attributes.TypeID.Name -contains 'ValidateRangeAttribute' | Should Be 'False'
            $Function.Parameters.SalesForceUserCredential.Attributes.TypeID.Name -contains 'ValidatePatternAttribute' | Should Be 'False'
            }
        It 'Has Parameter Help Text for SalesForceUserCredential '{
            $function.Definition.Contains('.PARAMETER SalesForceUserCredential') | Should Be 'True'
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


