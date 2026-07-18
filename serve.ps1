$port = 3000
$ip = (Get-NetIPAddress -AddressFamily IPv4 | Where-Object { $_.InterfaceAlias -notlike "*Loopback*" -and $_.PrefixOrigin -ne "WellKnown" } | Select-Object -First 1).IPAddress

Write-Host ""
Write-Host "  Stow Web - static server started"
Write-Host "  ---------------------------------"
Write-Host "  Local:   http://localhost:$port"
Write-Host "  LAN:     http://$ip`:$port"
Write-Host ""
Write-Host "  Press Ctrl+C to stop"
Write-Host ""

python -m http.server $port --bind 0.0.0.0
