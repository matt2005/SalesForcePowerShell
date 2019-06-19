function Find-SalesForceCase {

  <#
      .SYNOPSIS
      Find an Existing SalesForce Case 

      .DESCRIPTION
      Get an Existing Case in SalesForce, This requries the contactID

      .PARAMETER Case
      Hashtable which contains contactID as a minimum.
      This requries the contactID to be included in the Hashtable
        
      .PARAMETER Token
      Need to run Get-SalesForceAuthenticationToken to get Token for Token Parameter

      .EXAMPLE
      Find-SalesForceCase -Case @{contactID='ABC1234562'} -Token $Token
      This will Get all Cases for contactID ABC1234562, using the authentication details from $Token

      .NOTES
      Need to run Get-SalesForceAuthenticationToken to get Token for Token Parameter

      .INPUTS
      Case Hashtable which contains contactID as a minimum

      .OUTPUTS
      Outputs the Case details
  #>

  param(
    [parameter(Mandatory,HelpMessage = 'This expects a Hashtable which contains contactID as a minimum')][Hashtable]$Case,
    [parameter(Mandatory,HelpMessage = 'This expects the output of the Get-SalesForceAuthenticationToken')][PSCustomObject]$Token
  )
  If (-not ($Case.contactID))
  {
    Throw 'Account ID missing from Case hashtable'
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
  Foreach ($Key in $Case.Keys)
  {
  $KeyValue = $Case.$Key
  #Set SOQL EscapeCharacters in Value if they exist
  $KeyValue=Set-SOQLEscapeCharacters -Value $KeyValue

    IF (-not($InvokeSalesForceAPIParams.APIURI)) 
    {
      $InvokeSalesForceAPIParams['APIURI']      = ('/services/data/v20.0/query/?q=SELECT Subject,Description,Status,CaseNumber,ID,contactID from Case Where {0} in (''{1}'')' -f $Key, $KeyValue)
    }
    Else 
    {
      $InvokeSalesForceAPIParams.APIURI      = ('{0} and {1} in (''{2}'')' -f ($InvokeSalesForceAPIParams.APIURI), $Key,$KeyValue)
    }
  }
  $Output = (Invoke-SalesForceAPI @InvokeSalesForceAPIParams).records
  $Output.PSObject.TypeNames.Insert(0,'SalesForce.Case')
  return $Output

}

