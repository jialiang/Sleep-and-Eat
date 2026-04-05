Add-Type -Assembly System.IO.Compression.FileSystem

$root = $PSScriptRoot
$tmp  = "$root\Temp"
$out  = "$root\sleep_and_eat.zip"

function New-Pak {
    param([string]$sourceDir, [string]$outPak)

    if (-not (Test-Path (Split-Path $outPak -Parent))) { New-Item -ItemType Directory -Path (Split-Path $outPak -Parent) | Out-Null }

    $zip = [System.IO.Compression.ZipFile]::Open($outPak, 'Create')
    try {
        Get-ChildItem -Recurse -File $sourceDir | ForEach-Object {
            [System.IO.Compression.ZipFileExtensions]::CreateEntryFromFile($zip, $_.FullName, $_.FullName.Substring($sourceDir.Length + 1).Replace('\', '/')) | Out-Null
        }
    } finally { $zip.Dispose() }

    Write-Host "Packed: $outPak"
}

if (Test-Path $tmp) { Remove-Item -Recurse -Force $tmp }
New-Pak     "$root\Data"         "$tmp\sleep_and_eat\Data\sleep_and_eat.pak"
New-Pak     "$root\Localization" "$tmp\sleep_and_eat\Localization\English_xml.pak"
Copy-Item   "$root\mod.manifest" "$tmp\sleep_and_eat\mod.manifest"

if (Test-Path $out) { Remove-Item $out }
[System.IO.Compression.ZipFile]::CreateFromDirectory($tmp, $out)
Remove-Item -Recurse -Force $tmp

Write-Host "Done: $out"
pause
