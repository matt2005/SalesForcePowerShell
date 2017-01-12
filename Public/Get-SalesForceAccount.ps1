function Get-SalesForceAccount 
{
    <#
            .SYNOPSIS
            Gets Existing SalesForce Account 

            .DESCRIPTION
            Get an Existing Account in SalesForce, This requries the AccountID to be included in the Hashtable

            .PARAMETER Account
            Hashtable which contains AccountID as a minimum.
            This requries the AccountID to be included in the Hashtable
        
            .PARAMETER Token
            Need to run Get-SalesForceAuthenticationToken to get Token for Token Parameter

            .EXAMPLE
            Get-SalesForceAccount -Account @{AccountID='ABC1234562'} -Token $Token
            This will Get AccountID ABC1234562, using the authentication details from $Token

            .NOTES
            Need to run Get-SalesForceAuthenticationToken to get Token for Token Parameter

            .INPUTS
            Account Hashtable which contains AccountID as a minimum

            .OUTPUTS
            Outputs the Account details
    #>


    param(
        [parameter(Mandatory,HelpMessage = 'This expects a Hashtable which contains AccountID as a minimum')][Hashtable]$Account,
        [parameter(Mandatory,HelpMessage = 'This expects the output of the Get-SalesForceAuthenticationToken')][PSCustomObject]$Token
    )
    If (-not ($Account.AccountID))
    {
        Throw 'Account ID missing from Account hashtable'
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
        APIURI      = '/services/data/v20.0/sobjects/Account/'+$Account.AccountID
        APICALLType = 'Get'
    }
    $Output = (Invoke-SalesForceAPI @InvokeSalesForceAPIParams)
    return $Output
}
