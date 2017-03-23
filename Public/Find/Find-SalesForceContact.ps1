function Find-SalesForceContact {

  <#
      .SYNOPSIS
      Find an Existing SalesForce Contact 

      .DESCRIPTION
      Get an Existing Contact in SalesForce, This requries the accountID

      .PARAMETER Contact
      Hashtable which contains AccountID as a minimum.
      This requries the AccountID to be included in the Hashtable
        
      .PARAMETER Token
      Need to run Get-SalesForceAuthenticationToken to get Token for Token Parameter

      .EXAMPLE
      Find-SalesForceContact -Contact @{AccountID='ABC1234562'} -Token $Token
      This will Get all contacts for AccountID ABC1234562, using the authentication details from $Token

      .NOTES
      Need to run Get-SalesForceAuthenticationToken to get Token for Token Parameter

      .INPUTS
      Contact Hashtable which contains AccountID as a minimum

      .OUTPUTS
      Outputs the Contact details
  #>

  param(
    [parameter(Mandatory,HelpMessage = 'This expects a Hashtable which contains AccountID as a minimum')][Hashtable]$Contact,
    [parameter(Mandatory,HelpMessage = 'This expects the output of the Get-SalesForceAuthenticationToken')][PSCustomObject]$Token
  )
  If (-not ($Contact.AccountID))
  {
    Throw 'Account ID missing from Contact hashtable'
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
    APICALLType = 'Get'
  }
  Foreach ($Key in $Contact.Keys)
  {
  $KeyValue = $Contact.$Key
  #Set SOQL EscapeCharacters in Value if they exist
  $KeyValue=Set-SOQLEscapeCharacters -Value $KeyValue

    IF (-not($InvokeSalesForceAPIParams.APIURI)) 
    {
      $InvokeSalesForceAPIParams['APIURI']      = ('/services/data/v20.0/query/?q=SELECT FirstName,LastName,ID,AccountID from Contact Where {0} in (''{1}'')' -f $Key, $KeyValue)
    }
    Else 
    {
      $InvokeSalesForceAPIParams.APIURI      = ('{0} and {1} in (''{2}'')' -f ($InvokeSalesForceAPIParams.APIURI), $Key,$KeyValue)
    }
  }
  $Output = (Invoke-SalesForceAPI @InvokeSalesForceAPIParams).records
  $Output.PSObject.TypeNames.Insert(0,'SalesForce.Contact')
  return $Output

}

