# Server-side tunnel (forwards data from $remotehost to localhost)

$configfile = ".\config.txt"
$config = ConvertFrom-StringData((Get-Content $configfile) -join "`n")
@("keyfile", "remoteport", "host") | ForEach-Object {
  if (!($_ -in $config.keys)) {
    Write-Host "${_} not found in ${configfile}"
    exit
  }
}

$localport = Read-Host 'Local port to be forwarded to'

$command = "ssh -i {0} 
-o 'ExitOnForwardFailure yes' 
-NR {1}:127.0.0.1:{2} {3}" -f $config["keyfile"], $config["remoteport"], $localport, $config["host"]
Write-Host "Executing: `n$command"
Invoke-Expression $command.Replace("`r`n", "")

# Pause on error
if (!$?) {Pause}