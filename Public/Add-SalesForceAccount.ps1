function Add-SalesForceAccount 
{
    <#
            .SYNOPSIS
            Add the New SalesForce Account

            .DESCRIPTION
            Create a New Account in SalesForce, this doesn't check whether the Account Already exists.

            .PARAMETER Account
            Hashtable which contains Name as a minimum
        
            .PARAMETER Token
            Need to run Get-SalesForceAuthenticationToken to get Token for Token Parameter

            .EXAMPLE
            Add-SalesForceAccount -Account @{Name='Last'} -Token $Token
            This will Add a account to the Name ABC1234563, using the authentication details from $Token

            .NOTES
            Need to run Get-SalesForceAuthenticationToken to get Token for Token Parameter

            .INPUTS
            Account Hashtable which contains Name as a minimum

            .OUTPUTS
            Outputs the Account Hashtable with the AccountID added
    #>


    param(
        [parameter(Mandatory,HelpMessage = 'This expects a Hashtable which contains Name as a minimum')][Hashtable]$Account,
        [parameter(Mandatory,HelpMessage = 'This expects the output of the Get-SalesForceAuthenticationToken')][PSCustomObject]$Token
    )
    $Body = $Account.Clone()
    If (-not ($Body.Name))
    {
        Throw 'Name missing from Account hashtable'
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
        APIURI      = '/services/data/v20.0/sobjects/Account/'
        APICALLType = 'Add'
        Body        = $Body
    }
    $Account['AccountId'] = (Invoke-SalesForceAPI @InvokeSalesForceAPIParams).id
    return $Account
}
