function New-SalesForceCase {

    <#
            .SYNOPSIS
            Create a New SalesForceCase

            .DESCRIPTION
            Create a New Case in SalesForce, this doesn't check whether the Case Already exists.

            .PARAMETER Case
            Hashtable which contains ContactID, OwnerID, Subject, Status as a minimum
        
            .PARAMETER Token
            Need to run Get-SalesForceAuthenticationToken to get Token for Token Parameter

            .EXAMPLE
            New-SalesForceCase -Case @{FirstName='First',LastName='Last',AccountID='ABC1234563'} -Token $Token
            This will New a Case to the AccountID ABC1234563, using the authentication details from $Token

            .NOTES
            Need to run Get-SalesForceAuthenticationToken to get Token for Token Parameter

            .INPUTS
            Case Hashtable which contains ContactID, OwnerID, Subject, Status as a minimum

            .OUTPUTS
            Outputs the Case Hashtable with the CaseID Newed
    #>


    param(
        [parameter(Mandatory,HelpMessage = 'This expects a Hashtable which contains ContactID, OwnerID, Subject, Status as a minimum')][Hashtable]$Case,
        [parameter(Mandatory,HelpMessage = 'This expects the output of the Get-SalesForceAuthenticationToken')][PSCustomObject]$Token
    )
    $Body = $Case.Clone()
    If (-not ($Body.ContactID))
    {
        Throw 'ContactID missing from Case hashtable'
    }
    If (-not ($Body.OwnerID))
    {
        Throw 'OwnerID missing from Case hashtable'
    }
    If (-not ($Body.Subject))
    {
        Throw 'Subject missing from Case hashtable'
    }
    If (-not ($Body.Status))
    {
        Throw 'Status missing from Case hashtable'
    }
    If ($Body.CaseID)
    {
        Throw 'CaseID included in Case hashtable'
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
        APIURI      = '/services/data/v54.0/sobjects/Case/'
        APICALLType = 'Add'
        Body        = $Body
    }
    $Case['CaseId'] = (Invoke-SalesForceAPI @InvokeSalesForceAPIParams).id
    return $Case

}

