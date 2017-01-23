Function Get-SalesForceAccountManagerForAccount 
{
  <#
    .SYNOPSIS
    Get the Account manager for a SalesForce Account

    .DESCRIPTION
    Gets a account manager for a account

    .PARAMETER AccountID
    SalesForce AccountID

    .PARAMETER Token
    SalesForceAuthentication Token

    .EXAMPLE
    Get-SalesForceAccountManagerForAccount -AccountID '123424342354334' -Token $SalesForceToken
    Get the SalesForce Accoutn manager for the AccountID

    .NOTES
    Needs to have Account Teams enabled

  #>
    param(
   [string] [Parameter(Mandatory)]$AccountID,
   [pscustomobject] [Parameter(Mandatory)]$Token
  )
  $InvokeSalesForceAPIParams = @{
    Token       = $Token
    APICALLType = 'Get'
  }
  $InvokeSalesForceAPIParams['APIURI']      = ('/services/data/v20.0/query/?q=Select Id from AccountTeamMember where AccountID in (''{0}'') and TeamMemberRole in (''{1}'')' -f $AccountID, 'Account Manager')
  $Output = (Invoke-SalesForceAPI @InvokeSalesForceAPIParams).records.id
  return $Output
}
