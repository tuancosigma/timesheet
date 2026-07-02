#Requires -RunAsAdministrator
<#
  Giải phóng cổng 8001 trên Windows để Docker map host 8001 -> container 8001.

  Nguyên nhân: TCP "excluded port range" (vd. 7921–8020) do WinNAT / Hyper-V.
  Phải chạy PowerShell hoặc CMD "As Administrator".

  Sau khi chạy xong: Restart Docker Desktop (khuyến nghị), rồi:
    docker compose -f docker-compose.windows.yml up -d --force-recreate kimai

  Nếu netsh delete báo lỗi: mở "Windows Defender Firewall" / VPN / chỉnh dải cổng thủ công,
  hoặc gửi nguyên văn lỗi + kết quả "netsh interface ipv4 show excludedportrange protocol=tcp".
#>

$ErrorActionPreference = 'Continue'

function Show-Excluded {
    Write-Host "`n--- IPv4 ---" -ForegroundColor Cyan
    netsh interface ipv4 show excludedportrange protocol=tcp
    Write-Host "--- IPv6 ---" -ForegroundColor Cyan
    netsh interface ipv6 show excludedportrange protocol=tcp
}

Write-Host "TRUOC KHI SUA:" -ForegroundColor Yellow
Show-Excluded

# Dải phổ biến chứa 8001 (đúng với netsh trên máy Cosigma); nếu máy bạn khác, sửa 2 biến này.
$start = 7921
$count = 100  # 7921..8020

Write-Host "`nDung WinNAT va Host Network Service (HNS)..." -ForegroundColor Yellow
Stop-Service winnat -Force -ErrorAction SilentlyContinue
Start-Sleep -Seconds 2
Stop-Service hns -Force -ErrorAction SilentlyContinue
Start-Sleep -Seconds 2

Write-Host "Xoa excluded range: IPv4 TCP start=$start numberofports=$count" -ForegroundColor Yellow
$out4 = netsh interface ipv4 delete excludedportrange protocol=tcp startport=$start numberofports=$count 2>&1
Write-Host $out4

Write-Host "Xoa excluded range: IPv6 TCP start=$start numberofports=$count" -ForegroundColor Yellow
$out6 = netsh interface ipv6 delete excludedportrange protocol=tcp startport=$start numberofports=$count 2>&1
Write-Host $out6

Write-Host "`nKhoi dong lai HNS, WinNAT..." -ForegroundColor Yellow
Start-Service hns -ErrorAction SilentlyContinue
Start-Sleep -Seconds 2
Start-Service winnat -ErrorAction SilentlyContinue
Start-Sleep -Seconds 2

Write-Host "`nSAU KHI SUA:" -ForegroundColor Green
Show-Excluded

Write-Host "`n--------------------------------------------------" -ForegroundColor Green
Write-Host "Buoc tiep theo:" -ForegroundColor Green
Write-Host "  1) Mo Docker Desktop -> Quit Docker Desktop, mo lai (hoac Restart computer)." -ForegroundColor White
Write-Host "  2) Trong thu muc kimai-src chay:" -ForegroundColor White
Write-Host "     docker compose -f docker-compose.windows.yml up -d --force-recreate kimai" -ForegroundColor Gray
Write-Host "  3) Mo trinh duyet: http://localhost:8001/" -ForegroundColor White
Write-Host "--------------------------------------------------`n" -ForegroundColor Green

Read-Host "Nhan Enter de dong cua so"
