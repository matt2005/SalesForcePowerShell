function Get-SalesForceAuthenticationToken {

    <#
            .SYNOPSIS
            Generate SalesForce Authentication Token

            .DESCRIPTION
            Accquires SalesForce Authentication token to enable API communications

            .PARAMETER Uri
            SalesForce Base URI, During this function this URI will be suffixed with /services/oauth2/token
            e.g. https://eu6.salesforce.com

            .PARAMETER GrantType
            Grant Type for the Authentication. Currrently only Password authetication is enabled

            .PARAMETER ConsumerKey
            SalesForce Application Consumer Key
            To generate see https://help.salesforce.com/apex/HTViewSolution?id=000205876&language=en_US

            .PARAMETER ConsumerSecret
            SalesForce Application ConsumerSecret.
            To generate see https://help.salesforce.com/apex/HTViewSolution?id=000205876&language=en_US

            .PARAMETER UserToken
            Security Token for the User

            .PARAMETER SalesForceUserCredential
            The Credentials used to login to SalesForce

            .EXAMPLE
            Get-SalesForceAuthenticationToken -Uri Value -GrantType Password -ConsumerKey 'abc123q22' -ConsumerSecret 'abcd1323' -UserToken 'adbcdd' -SalesForceUserCredential get-Credential 
            Gets the SalesForce Authentication Token

            .NOTES
        
            .LINK
        
            .INPUTS
        

            .OUTPUTS
            SalesForce Authentication Token
    #>



    param(
        [OutputType('SalesForce.AuthenticationToken')]
        [parameter(Mandatory,HelpMessage = 'This expects a salesforce URL, this URL will have /services/oauth2/token added to it')][String]$Uri,
        [parameter(Mandatory,HelpMessage = 'This expects a string of either Password')][ValidateSet('Password')] [string]$GrantType,
        [parameter(Mandatory,HelpMessage = 'This expects the SalesForce Consumer Key')][String]$ConsumerKey,
        [parameter(Mandatory,HelpMessage = 'This expects the SalesForce Consumer Secret')][String]$ConsumerSecret,
        [parameter(Mandatory,HelpMessage = 'This expects the SalesForce User Security Token')] [String]$UserToken,
        [parameter(Mandatory,HelpMessage = 'This expects the SalesForce User Credential')] [System.Management.Automation.Credential()][pscredential]$SalesForceUserCredential
    )
    Add-Type -AssemblyName System.Web
    $Uri = $Uri+'/services/oauth2/token'
    Switch ($GrantType) {
        Password  
        {
            If (-not ($UserToken))
            {
                Throw 'UserToken Not Specified'
            }
            If (-not ($SalesForceUserCredential))
            {
                Throw 'SalesForceUserCredential Not Specified'
            }
            $username = [System.Web.HttpUtility]::UrlEncode($SalesForceUserCredential.UserName)
            $password = [System.Web.HttpUtility]::UrlEncode($SalesForceUserCredential.GetNetworkCredential().Password)
            $requestBody = ''
            $requestBody += ('grant_type={0}' -f $GrantType.ToLower()) #Grant_type must be lowercase
            $requestBody += ('&client_id={0}' -f $ConsumerKey)
            $requestBody += ('&client_secret={0}' -f $ConsumerSecret)
            $requestBody += ('&username={0}' -f $username)
            $requestBody += ('&password={0}{1}' -f $password, $UserToken)
        }
        Default
        {
            Throw 'Grant Type Invalid'
        }
    }

    Write-Verbose $requestBody
    $Token = Invoke-RestMethod -Method Post -Uri $Uri -Body $requestBody
    Return $Token

}

