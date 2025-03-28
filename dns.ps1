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

# Quad9 IPv4 DNS server addresses (Primary & Secondary)
$customIPv4 = @("9.9.9.9", "149.112.112.112")

# Quad9 DNS over HTTPS (DoH) endpoints
$DoHTemplates = @{
    "9.9.9.9" = "https://dns.quad9.net/dns-query"
    "149.112.112.112" = "https://dns.quad9.net/dns-query"
}

# Get all active network adapters
$adapters = Get-NetAdapter | Where-Object { $_.Status -eq "Up" }

if ($adapters.Count -eq 0) {
    Write-Host "No active network adapters found. Exiting script." -ForegroundColor Red
    exit
}

foreach ($adapter in $adapters) {
    Write-Host "Attempting to configure Quad9 Secure DNS for adapter: $($adapter.Name)" -ForegroundColor Cyan

    try {
        # Set IPv4 DNS to Quad9 Secure DNS
        Write-Host "Setting IPv4 DNS for $($adapter.Name) to $($customIPv4 -join ', ')..." -ForegroundColor Yellow
        Set-DnsClientServerAddress -InterfaceIndex $adapter.InterfaceIndex -ServerAddresses $customIPv4 -ErrorAction Stop

        # Register and enable DoH for Quad9
        foreach ($dns in $DoHTemplates.Keys) {
            Write-Host "Enabling DoH for $dns with template $($DoHTemplates[$dns])..." -ForegroundColor Yellow
            Set-DnsClientDohServerAddress -ServerAddress $dns -DohTemplate $DoHTemplates[$dns] -AllowFallbackToUdp $false -AutoUpgrade $true -ErrorAction Stop
        }

        Write-Host "Quad9 Secure DNS (IPv4 + DoH) successfully configured for $($adapter.Name)." -ForegroundColor Green
    } catch {
        Write-Host "Error updating Quad9 DNS settings for adapter $($adapter.Name): $_" -ForegroundColor Red
    }
}

Write-Host "DNS configuration process completed. Verify in Windows Settings > Network & Internet > Ethernet/WiFi > DNS Settings." -ForegroundColor Green
