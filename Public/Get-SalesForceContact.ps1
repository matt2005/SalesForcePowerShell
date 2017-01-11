function Get-SalesForceContact 
{
    <#
            .SYNOPSIS
            Gets Existing SalesForce Contact 

            .DESCRIPTION
            Get an Existing Contact in SalesForce, This requries the ContactID to be included in the Hashtable

            .PARAMETER Contact
            Hashtable which contains ContactID as a minimum.
            This requries the ContactID to be included in the Hashtable
        
            .PARAMETER Token
            Need to run Get-SalesForceAuthenticationToken to get Token for Token Parameter

            .EXAMPLE
            Get-SalesForceContact -Contact @{ContactID='ABC1234562'} -Token $Token
            This will Get contactID ABC1234562, using the authentication details from $Token

            .NOTES
            Need to run Get-SalesForceAuthenticationToken to get Token for Token Parameter

            .INPUTS
            Contact Hashtable which contains ContactID as a minimum

            .OUTPUTS
            Outputs the Contact details
    #>


    param(
        [parameter(Mandatory,HelpMessage = 'This expects a Hashtable which contains ContactID as a minimum')][Hashtable]$Contact,
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
    $InvokeSalesForceAPIParams = @{
        Token       = $Token
        APIURI      = '/services/data/v20.0/sobjects/Contact/'+$Contact.ContactID
        APICALLType = 'Get'
    }
    $Output = (Invoke-SalesForceAPI @InvokeSalesForceAPIParams)
    return $Output
}
