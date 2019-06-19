function Update-SalesForceCase {

    <#
            .SYNOPSIS
            Update an Existing SalesForce Case 

            .DESCRIPTION
            Update an Existing Case in SalesForce, This requries the CaseID to be included in the Hashtable

            .PARAMETER Case
            Hashtable which contains FirstName, LastName, CaseID as a minimum.
            This requries the CaseID to be included in the Hashtable

            .PARAMETER Token
            Need to run Get-SalesForceAuthenticationToken to get Token for Token Parameter

            .EXAMPLE
            Update-SalesForceCase -Case @{Description='test',CaseID='ABC1234562'} -Token $Token
            This will Update CaseID ABC1234562, using the authentication details from $Token

            .NOTES
            Need to run Get-SalesForceAuthenticationToken to get Token for Token Parameter

            .INPUTS
            Case Hashtable which contains CaseID as a minimum

            .OUTPUTS
            Outputs the Case Hashtable
    #>


  [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSUseShouldProcessForStateChangingFunctions","", Scope="Function",Target="")]
    param(
        [parameter(Mandatory,HelpMessage = 'This expects a Hashtable which contains CaseID as a minimum')][Hashtable]$Case,
        [parameter(Mandatory,HelpMessage = 'This expects the output of the Get-SalesForceAuthenticationToken')][PSCustomObject]$Token
    )
    $Body = $Case.Clone()
    If (-not ($Body.CaseID))
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
    $Body.Remove('CaseID') # Remove CaseID from hashtable as it cannot be included in Body.
    $InvokeSalesForceAPIParams = @{
        Token       = $Token
        APIURI      = '/services/data/v20.0/sobjects/Case/'+$Case.CaseID
        APICALLType = 'Update'
        Body        = $Body
    }
    $Output = (Invoke-SalesForceAPI @InvokeSalesForceAPIParams)
    return $Output

}

