#!/bin/bash

# StoneScript Zed Extension Build Script
# This script builds the extension and prepares it for installation

set -e  # Exit on error

echo "🔨 Building StoneScript Zed Extension..."
echo ""

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Check if we're in the right directory
if [ ! -f "extension.toml" ]; then
    echo "❌ Error: extension.toml not found!"
    echo "Please run this script from the zed-stonescript directory."
    exit 1
fi

# Check if cargo is installed
if ! command -v cargo &> /dev/null; then
    echo "❌ Error: cargo not found!"
    echo "Please install Rust: https://rustup.rs/"
    exit 1
fi

# Clean previous build
echo -e "${BLUE}Cleaning previous build...${NC}"
cargo clean

# Build the extension
echo -e "${BLUE}Building extension...${NC}"
cargo build --release

# Check if build was successful
if [ $? -eq 0 ]; then
    echo ""
    echo -e "${GREEN}✅ Build successful!${NC}"
    echo ""
    echo "📦 Extension built at: target/wasm32-wasi/release/stonescript.wasm"
    echo ""
    echo "Next steps:"
    echo "1. Open Zed editor"
    echo "2. Press Cmd+Shift+P (macOS) or Ctrl+Shift+P (Linux/Windows)"
    echo "3. Run: 'zed: install dev extension'"
    echo "4. Select this directory: $(pwd)"
    echo ""
    echo "Or reload if already installed:"
    echo "- Run: 'zed: reload extensions'"
    echo ""
    echo -e "${YELLOW}📝 What's new in v0.3.0:${NC}"
    echo "  • Support for .txt files"
    echo "  • Custom extension icon"
    echo ""
else
    echo ""
    echo -e "${RED}❌ Build failed!${NC}"
    echo "Please check the error messages above."
    exit 1
fi
