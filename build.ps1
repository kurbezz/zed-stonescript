# StoneScript Zed Extension Build Script (PowerShell)
# This script builds the extension and prepares it for installation on Windows

$ErrorActionPreference = "Stop"

Write-Host "🔨 Building StoneScript Zed Extension..." -ForegroundColor Cyan
Write-Host ""

# Check if we're in the right directory
if (-not (Test-Path "extension.toml")) {
    Write-Host "❌ Error: extension.toml not found!" -ForegroundColor Red
    Write-Host "Please run this script from the zed-stonescript directory."
    exit 1
}

# Check if cargo is installed
try {
    $null = Get-Command cargo -ErrorAction Stop
} catch {
    Write-Host "❌ Error: cargo not found!" -ForegroundColor Red
    Write-Host "Please install Rust: https://rustup.rs/"
    exit 1
}

# Clean previous build
Write-Host "Cleaning previous build..." -ForegroundColor Blue
cargo clean

# Build the extension
Write-Host "Building extension..." -ForegroundColor Blue
cargo build --release

# Check if build was successful
if ($LASTEXITCODE -eq 0) {
    Write-Host ""
    Write-Host "✅ Build successful!" -ForegroundColor Green
    Write-Host ""
    Write-Host "📦 Extension built at: target\wasm32-wasi\release\stonescript.wasm"
    Write-Host ""
    Write-Host "Next steps:"
    Write-Host "1. Open Zed editor"
    Write-Host "2. Press Ctrl+Shift+P"
    Write-Host "3. Run: 'zed: install dev extension'"
    Write-Host "4. Select this directory: $PWD"
    Write-Host ""
    Write-Host "Or reload if already installed:"
    Write-Host "- Run: 'zed: reload extensions'"
    Write-Host ""
    Write-Host "📝 What's new in v0.3.0:" -ForegroundColor Yellow
    Write-Host "  • Support for .txt files"
    Write-Host "  • Custom extension icon"
    Write-Host ""
} else {
    Write-Host ""
    Write-Host "❌ Build failed!" -ForegroundColor Red
    Write-Host "Please check the error messages above."
    exit 1
}
