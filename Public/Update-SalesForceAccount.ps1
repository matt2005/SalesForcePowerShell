function Update-SalesForceAccount 
{
    <#
            .SYNOPSIS
            Update an Existing SalesForce Account 

            .DESCRIPTION
            Update an Existing Account in SalesForce, This requries the AccountID to be included in the Hashtable

            .PARAMETER Account
            Hashtable which contains Name, AccountID as a minimum.
            This requries the AccountID to be included in the Hashtable

            .PARAMETER Token
            Need to run Get-SalesForceAuthenticationToken to get Token for Token Parameter

            .EXAMPLE
            Update-SalesForceAccount -Account @{Name='Last',AccountID='ABC1234562'} -Token $Token
            This will Update AccountID ABC1234562, using the authentication details from $Token

            .NOTES
            Need to run Get-SalesForceAuthenticationToken to get Token for Token Parameter

            .INPUTS
            Account Hashtable which contains Name, AccountID as a minimum

            .OUTPUTS
            Outputs the Account Hashtable
    #>


    param(
        [parameter(Mandatory,HelpMessage = 'This expects a Hashtable which contains Name, AccountID as a minimum')][Hashtable]$Account,
        [parameter(Mandatory,HelpMessage = 'This expects the output of the Get-SalesForceAuthenticationToken')][PSCustomObject]$Token
    )
    $Body = $Account.Clone()
    If (-not ($Body.AccountID))
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
    $Body.Remove('AccountID') # Remove AccountID from hashtable as it cannot be included in Body.
    $InvokeSalesForceAPIParams = @{
        Token       = $Token
        APIURI      = '/services/data/v20.0/sobjects/Account/'+$Account.AccountID
        APICALLType = 'Update'
        Body        = $Body
    }
    $Output = (Invoke-SalesForceAPI @InvokeSalesForceAPIParams)
    return $Output
}
