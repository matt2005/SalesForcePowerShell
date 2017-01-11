function Add-SalesForceContact 
{
    <#
            .SYNOPSIS
            Add the New SalesForceContact to a specified AccountID

            .DESCRIPTION
            Create a New Contact in SalesForce under a specific Account ID, this doesn't check whether the Contact Already exists.

            .PARAMETER Contact
            Hashtable which contains FirstName, LastName, AccountID as a minimum
        
            .PARAMETER Token
            Need to run Get-SalesForceAuthenticationToken to get Token for Token Parameter

            .EXAMPLE
            Add-SalesForceContact -Contact @{FirstName='First',LastName='Last',AccountID='ABC1234563'} -Token $Token
            This will Add a contact to the AccountID ABC1234563, using the authentication details from $Token

            .NOTES
            Need to run Get-SalesForceAuthenticationToken to get Token for Token Parameter

            .INPUTS
            Contact Hashtable which contains FirstName, LastName, AccountID as a minimum

            .OUTPUTS
            Outputs the Contact Hashtable with the ContactID added
    #>


    param(
        [parameter(Mandatory,HelpMessage = 'This expects a Hashtable which contains FirstName, LastName, AccountID as a minimum')][Hashtable]$Contact,
        [parameter(Mandatory,HelpMessage = 'This expects the output of the Get-SalesForceAuthenticationToken')][PSCustomObject]$Token
    )
    If (-not ($Contact.AccountID))
    {
        Throw 'AccountID missing from Contact hashtable'
    }
    If (-not ($Contact.FirstName))
    {
        Throw 'FirstName missing from Contact hashtable'
    }
    If (-not ($Contact.LastName))
    {
        Throw 'LastName missing from Contact hashtable'
    }
    If (-not ($Token.instance_url))
    {
        Throw 'instance_url Missing from Token'
    }
    If (-not ($Token.access_token))
    {
        Throw 'access_token Missing from Token'
    }
    $URI = $Token.instance_url+'/services/data/v20.0/sobjects/Contact/'
    $Body = $Contact.Clone()
    $method = 'POST'
    $contenttype = 'application/json'
    $body2 = $Body | ConvertTo-Json
    $Contact['ContactId'] = (Invoke-RestMethod -Uri $URI -ContentType $contenttype -Method $method  -Body $body2 -Headers @{
            'Authorization' = 'OAuth ' + $Token.access_token
    }).id
    return $Contact
}
