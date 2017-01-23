#requires -Version 3.0
Function Invoke-SalesForceAPI
{
    <#
        .SYNOPSIS
        Invoke the SalesForce REST API

        .DESCRIPTION
        Add a more complete description of what the function does.

        .PARAMETER Token
        Need to run Get-SalesForceAuthenticationToken to get Token for Token Parameter

        .PARAMETER APIURI
        API URI e.g. '/services/data/v20.0/sobjects/Contact/'

        .PARAMETER APICALLType
        API Call Type e.g. Add

        .PARAMETER Body
        Optional used with Add and Update Call type

        .EXAMPLE
        Invoke-SalesForceAPI -Token $Token -APIURI '/services/data/v20.0/sobjects/Contact/' -APICALLType 'Add' -Body @{FirstName='Test',LastName='Testers',AccountID='ABC1234'}
        Create a new Contact

        .NOTES
        
        .LINK

        .INPUTS

        .OUTPUTS
    #>


    Param(
        [parameter(Mandatory,HelpMessage = 'This expects the output of the Get-SalesForceAuthenticationToken')][PSCustomObject]$Token,
        [parameter(Mandatory,HelpMessage = 'This expects a salesforce api URI e.g. /services/data/v20.0/sobjects/Contact/')][String]$APIURI,
        [parameter(Mandatory,HelpMessage = 'This expects the API call type e.g. Add')][ValidateSet('Get','Add','Update')][String]$APICALLType,
        $Body
    )
    $InvokeParams = @{
        URI     = $URI = $Token.instance_url+$APIURI
        Headers = @{
            'Authorization' = 'OAuth ' + $Token.access_token
        }
    }

    Switch ($APICALLType){
        Get 
        {
            $InvokeParams['Method'] = 'GET'
        }
        Add 
        {
            $InvokeParams['Method'] = 'POST'
            $InvokeParams['ContentType'] = 'application/json'
            $JSONBody=$Body | ConvertTo-Json
            $InvokeParams['Body'] = ([System.Text.Encoding]::UTF8.GetBytes($JSONBody))
        }
        Update 
        {
            $InvokeParams['Method'] = 'PATCH'
            $InvokeParams['ContentType'] = 'application/json'
            $JSONBody=$Body | ConvertTo-Json
            $InvokeParams['Body'] = ([System.Text.Encoding]::UTF8.GetBytes($JSONBody))
        }
    }
    IF ($JSONBody){Write-Verbose ('Body Contains: {0}' -f $JSONBody) }
    $Output = Invoke-RestMethod @InvokeParams
    return $Output
}
