function Get-SalesForceCase {

    <#
            .SYNOPSIS
            Gets Existing SalesForce Case 

            .DESCRIPTION
            Get an Existing Case in SalesForce, This requries the CaseID to be included in the Hashtable

            .PARAMETER Case
            Hashtable which contains CaseID as a minimum.
            This requries the CaseID to be included in the Hashtable
        
            .PARAMETER Token
            Need to run Get-SalesForceAuthenticationToken to get Token for Token Parameter

            .EXAMPLE
            Get-SalesForceCase -Case @{CaseID='ABC1234562'} -Token $Token
            This will Get CaseID ABC1234562, using the authentication details from $Token

            .NOTES
            Need to run Get-SalesForceAuthenticationToken to get Token for Token Parameter

            .INPUTS
            Case Hashtable which contains CaseID as a minimum

            .OUTPUTS
            Outputs the Case details
    #>

    param(
        [parameter(Mandatory,HelpMessage = 'This expects a Hashtable which contains CaseID as a minimum')][Hashtable]$Case,
        [parameter(Mandatory,HelpMessage = 'This expects the output of the Get-SalesForceAuthenticationToken')][PSCustomObject]$Token
    )
    If (-not ($Case.CaseID))
    {
        Throw 'Case ID missing from Case hashtable'
    }
    If (-not ($Token.instance_url))
    {
        Throw 'instance_url Missing from Token'
    }
    If (-not ($Token.access_token))
    {
        Throw 'access_token Missing from Token'
    }
    $InvokeSalesForceAPIParams = @{
        Token       = $Token
        APIURI      = '/services/data/v54.0/sobjects/Case/'+$Case.CaseID
        APICALLType = 'Get'
    }
    $Output = (Invoke-SalesForceAPI @InvokeSalesForceAPIParams)
    $Output.PSObject.TypeNames.Insert(0,'SalesForce.Case')
    return $Output

}

