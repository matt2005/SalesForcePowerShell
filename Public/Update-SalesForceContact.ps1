function Update-SalesForceContact 
{
    <#
            .SYNOPSIS
            Update an Existing SalesForce Contact 

            .DESCRIPTION
            Update an Existing Contact in SalesForce, This requries the ContactID to be included in the Hashtable

            .PARAMETER Contact
            Hashtable which contains FirstName, LastName, ContactID as a minimum.
            This requries the ContactID to be included in the Hashtable

            .PARAMETER Token
            Need to run Get-SalesForceAuthenticationToken to get Token for Token Parameter

            .EXAMPLE
            Update-SalesForceContact -Contact @{FirstName='First',LastName='Last',ContactID='ABC1234562'} -Token $Token
            This will Update contactID ABC1234562, using the authentication details from $Token

            .NOTES
            Need to run Get-SalesForceAuthenticationToken to get Token for Token Parameter

            .INPUTS
            Contact Hashtable which contains FirstName, LastName, ContactID as a minimum

            .OUTPUTS
            Outputs the Contact Hashtable
    #>


    param(
        [parameter(Mandatory,HelpMessage = 'This expects a Hashtable which contains FirstName, LastName, ContactID as a minimum')][Hashtable]$Contact,
        [parameter(Mandatory,HelpMessage = 'This expects the output of the Get-SalesForceAuthenticationToken')][PSCustomObject]$Token
    )
    If (-not ($Contact.ContactID))
    {
        Throw 'Contact ID missing from Contact hashtable'
    }
    If (-not ($Token.instance_url))
    {
        Throw 'instance_url Missing from Token'
    }
    If (-not ($Token.access_token))
    {
        Throw 'access_token Missing from Token'
    }
    $URI = $Token.instance_url+'/services/data/v20.0/sobjects/Contact/'+$Contact.ContactID
    $Body = $Contact.Clone()
    $Body.Remove('ContactId')
    $method = 'PATCH'
    $contenttype = 'application/json'
    $body2 = $Body | ConvertTo-Json
    $null = Invoke-RestMethod -Uri $URI -ContentType $contenttype -Method $method  -Body $body2 -Headers @{
        'Authorization' = 'OAuth ' + $Token.access_token
    }
    return $Contact
}
