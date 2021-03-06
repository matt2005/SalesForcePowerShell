
    $CommonParams = @{}
    'Verbose', 'Debug', 'ErrorAction', 'WarningAction', 'ErrorVariable', 'WarningVariable' | 
    ForEach {If ($PSBoundParameters.ContainsKey($_)) {$CommonParams.Add($_, $PSBoundParameters[$_])}}
    $DebugPreference = 'Continue'

#Get public and private function definition files.
$ScriptRoot = $PSScriptRoot

$Public  = Get-ChildItem -Path "$ScriptRoot\Public\*.ps1" -Recurse -ErrorAction SilentlyContinue -Exclude '*.Tests.ps1'
$Private = Get-ChildItem -Path "$ScriptRoot\Private\*.ps1" -Recurse -ErrorAction SilentlyContinue -Exclude '*.Tests.ps1'


#Dot source the files
    Foreach($import in @($Public + $Private))
    {
        Try
        {
            . $import.fullname
        }
        Catch
        {
            Write-Error -Message "Failed to import function $($import.fullname): $_"
        }
    }
    
# Here I might...
    # Read in or create an initial config file and variable
    # Export Public functions ($Public.BaseName) for WIP modules
    # Set variables visible to the module and its functions only

Export-ModuleMember -Function $Public.Basename -Alias *
