function Set-SOQLEscapeCharacters 
{
  <#
      .SYNOPSIS
      Escapes SOQL reserved Characters

      .DESCRIPTION
      This Escapes the special Reservwed Characters for SOQL before sending the value via the REST API

      .PARAMETER Value
      Value which needs to be Escaped correctly before sending via the REST API

      .EXAMPLE
      Set-SOQLEscapeCharacters -Value "SalesForce"
      This will return the Value input with the reserved Characters Escaped


      .NOTES
      Place additional notes here.

      .LINK
      https://developer.salesforce.com/docs/atlas.en-us.soql_sosl.meta/soql_sosl/sforce_api_calls_soql_select_reservedcharacters.htm

      .INPUTS
      String

      .OUTPUTS
      String with correctly escaped Characters
  #>

  [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseSingularNouns','', Scope = 'Function',Target = '')]
  [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions','', Scope = 'Function',Target = '')]
  param ([parameter(Mandatory,HelpMessage = 'String to parse')][string]$Value)
  #region Remove Escaped Characters, this is done to ensure that the String in not partially escaped
  If ($Value -like '*\\*')
  {
    $Value = $Value.Replace('\\','\')
  }
  If ($Value -like "*\'*")
  {
    $Value = $Value.Replace("\'","'")
  }
  #endregion
  #region Escape Special Characters
  IF (($Value -like '*\*') -and ($Value -notlike '*\\*'))
  {
    Write-Verbose -Message ('{0} - Value contains a Backslash' -f $Value)
    $Value = $Value.Replace('\','\\')
  }
  IF (($Value -like "*'*") -and ($Value -notlike "*\'*"))
  {
    Write-Verbose -Message ('{0} - Value contains single quote' -f $Value)
    $Value = $Value.Replace("'","\'")
  }
  #endregion
  return $Value
}

