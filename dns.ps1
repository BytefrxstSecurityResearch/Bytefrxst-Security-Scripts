# ASCII Art Header
Write-Host @"
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⡾⠃⠀⠀⠀⠀⠀⠀⠰⣶⡀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⡿⠁⣴⠇⠀⠀⠀⠀⠸⣦⠈⢿⡄⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⡇⢸⡏⢰⡇⠀⠀⢸⡆⢸⡆⢸⡇⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⡇⠘⣧⡈⠃⢰⡆⠘⢁⣼⠁⣸⡇⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢿⣄⠘⠃⠀⢸⡇⠀⠘⠁⣰⡟⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠃⠀⠀⢸⡇⠀⠀⠘⠋⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡇⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡇⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⠃⠀⠀⠀⠀⠀⠀⠀⠀
⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀
⠀⢸⣿⣟⠉⢻⡟⠉⢻⡟⠉⣻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀
⠀⢸⣿⣿⣷⣿⣿⣶⣿⣿⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀
⠀⠈⠉⠉⢉⣉⣉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⣉⣉⡉⠉⠉⠁⠀⠀
⠀⠀⠀⠀⠉⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠉⠀⠀⠀⠀⠀
"@ -ForegroundColor Cyan

# Ensure the script is running with administrator privileges
$runAsAdmin = [Security.Principal.WindowsIdentity]::GetCurrent()
$isAdmin = $runAsAdmin.Groups -match 'S-1-5-32-544'  # SID for Administrators group

if (-not $isAdmin) {
    Write-Host "This script must be run as Administrator." -ForegroundColor Red
    exit
}

# Quad9 IPv4 & IPv6 DNS addresses
$Quad9_IPv4 = @("9.9.9.9", "149.112.112.112")
$Quad9_IPv6 = @("2620:fe::fe", "2620:fe::9")

# Quad9 DNS over HTTPS (DoH) endpoint
$DoHServer = "https://dns.quad9.net/dns-query"

# Get all active network adapters
$adapters = Get-NetAdapter | Where-Object { $_.Status -eq "Up" }

if ($adapters.Count -eq 0) {
    Write-Host "No active network adapters found. Exiting script." -ForegroundColor Red
    exit
}

foreach ($adapter in $adapters) {
    Write-Host "`nConfiguring Quad9 Secure DNS for adapter: $($adapter.Name)" -ForegroundColor Cyan

    try {
        # Set IPv4 & IPv6 DNS addresses
        Write-Host "Setting IPv4 DNS to $($Quad9_IPv4 -join ', ')..." -ForegroundColor Yellow
        Set-DnsClientServerAddress -InterfaceIndex $adapter.InterfaceIndex -ServerAddresses $Quad9_IPv4 -ErrorAction Stop

        Write-Host "Setting IPv6 DNS to $($Quad9_IPv6 -join ', ')..." -ForegroundColor Yellow
        Set-DnsClientServerAddress -InterfaceIndex $adapter.InterfaceIndex -ServerAddresses $Quad9_IPv6 -ErrorAction Stop

        # Enable DNS over HTTPS (DoH) for Quad9
        Write-Host "Enabling DoH using Quad9 ($DoHServer)..." -ForegroundColor Yellow
        Set-DnsClientDohServerAddress -ServerAddress $Quad9_IPv4[0] -DohTemplate $DoHServer -AllowFallbackToUdp $false -AutoUpgrade $true -ErrorAction Stop
        Set-DnsClientDohServerAddress -ServerAddress $Quad9_IPv4[1] -DohTemplate $DoHServer -AllowFallbackToUdp $false -AutoUpgrade $true -ErrorAction Stop
        Set-DnsClientDohServerAddress -ServerAddress $Quad9_IPv6[0] -DohTemplate $DoHServer -AllowFallbackToUdp $false -AutoUpgrade $true -ErrorAction Stop
        Set-DnsClientDohServerAddress -ServerAddress $Quad9_IPv6[1] -DohTemplate $DoHServer -AllowFallbackToUdp $false -AutoUpgrade $true -ErrorAction Stop

        Write-Host "✅ Quad9 Secure DNS (IPv4 + IPv6 + DoH) successfully applied to $($adapter.Name)." -ForegroundColor Green
    } catch {
        Write-Host "❌ Error configuring Quad9 for adapter $($adapter.Name): $_" -ForegroundColor Red
    }
}

Write-Host "`n🚀 DNS configuration process completed. All active adapters should now be using Quad9 encrypted DNS." -ForegroundColor Green
