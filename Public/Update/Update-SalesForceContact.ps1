function Update-SalesForceContact {

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


  [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSUseShouldProcessForStateChangingFunctions","", Scope="Function",Target="")]
    param(
        [parameter(Mandatory,HelpMessage = 'This expects a Hashtable which contains FirstName, LastName, ContactID as a minimum')][Hashtable]$Contact,
        [parameter(Mandatory,HelpMessage = 'This expects the output of the Get-SalesForceAuthenticationToken')][PSCustomObject]$Token
    )
    $Body = $Contact.Clone()
    If (-not ($Body.ContactID))
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
    $Body.Remove('ContactID') # Remove ContactID from hashtable as it cannot be included in Body.
    $InvokeSalesForceAPIParams = @{
        Token       = $Token
        APIURI      = '/services/data/v20.0/sobjects/Contact/'+$Contact.ContactID
        APICALLType = 'Update'
        Body        = $Body
    }
    $Output = (Invoke-SalesForceAPI @InvokeSalesForceAPIParams)
    return $Output

}

