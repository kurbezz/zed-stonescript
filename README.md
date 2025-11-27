# Zed StoneScript Extension

A Zed editor extension providing comprehensive language support for StoneScript, the scripting language used in Stone Story RPG.

![Extension Icon](icons/stonescript.svg)

## Features

- **Syntax Highlighting** - Rich syntax highlighting powered by Tree-sitter
- **Language Server Integration** - Full LSP support with StoneScript Language Server
- **Code Completion** - Intelligent autocomplete for game objects, abilities, and functions
- **Diagnostics** - Real-time error detection and warnings
- **Hover Documentation** - Inline documentation for built-in functions and objects
- **Go to Definition** - Navigate to variable and function declarations
- **Code Formatting** - Automatic code formatting support

## Installation

### From Zed Extensions

1. Open Zed editor
2. Open the command palette (`Cmd+Shift+P` on macOS, `Ctrl+Shift+P` on Linux/Windows)
3. Search for "zed: extensions"
4. Search for "StoneScript"
5. Click "Install"

The extension will automatically download and install the StoneScript Language Server on first use.

### From Source

```bash
git clone https://github.com/kurbezz/zed-stonescript.git
cd zed-stonescript
```

Then in Zed, use `zed: install dev extension` and select this directory.

## Language Server

The extension automatically manages the [StoneScript Language Server](https://github.com/kurbezz/stonescript-language-server):

- **Automatic Installation**: The LSP binary is downloaded automatically from GitHub releases when you first open a StoneScript file
- **Version Management**: The extension checks for updates and downloads new versions as needed
- **Platform Support**: Pre-built binaries for macOS (Apple Silicon & Intel), Linux (x86_64), and Windows

### Manual Installation (Optional)

If you prefer to use a custom-built LSP server, you can install it manually and add it to your PATH:

```bash
git clone https://github.com/kurbezz/stonescript-language-server.git
cd stonescript-language-server
cargo build --release
# Add target/release/stonescript-lsp to your PATH
```

The extension will automatically detect and use the LSP from your PATH if available.

## File Extensions

The extension automatically activates for files with the following extensions:
- `.ss` - StoneScript files (primary extension)
- `.txt` - Text files (now supported for StoneScript code)

## Configuration

The extension uses the Tree-sitter grammar from [tree-sitter-stonescript](https://github.com/kurbezz/tree-sitter-stonescript).

### Extension Settings

Configuration is managed through `extension.toml`:

```toml
id = "stonescript"
name = "StoneScript"
version = "0.3.0"
description = "StoneScript language support with LSP"
icon = "icons/stonescript.svg"
```

## Syntax Highlighting

The extension provides semantic syntax highlighting for:
- Keywords (`var`, `if`, `else`, `for`, `while`, etc.)
- Built-in objects (`foe`, `item`, `armor`, `loc`, etc.)
- Functions and function calls
- Variables and constants
- Operators
- String and number literals
- Comments

## Language Server Features

When the StoneScript Language Server is installed, you get:

- **Intelligent Code Completion** - Context-aware suggestions for:
  - Variables and functions
  - Built-in game objects
  - Abilities (dash, smite, bardiche, etc.)
  - Locations (Rocky Plateau, Deadwood Canyon, etc.)
  - Foes (Poena, Nagaraja, Bolesh, etc.)
  - UI elements, sounds, and music

- **Real-time Diagnostics** - Immediate feedback on:
  - Syntax errors
  - Undefined variables
  - Type mismatches

- **Hover Information** - Documentation on hover for:
  - Built-in functions
  - Game objects and properties
  - Variables and their inferred types

- **Go to Definition** - Jump to declarations of:
  - Variables
  - Functions
  - Custom definitions

## Development

### Building

This extension is written in Rust. To build:

```bash
cargo build --release
```

### Project Structure

```
zed-stonescript/
├── extension.toml              # Extension metadata
├── Cargo.toml                  # Rust dependencies
├── icons/
│   ├── stonescript.svg         # Extension icon
│   └── README.md               # Icon customization guide
├── src/
│   └── lib.rs                  # Extension implementation
└── languages/
    └── stonescript/
        ├── config.toml         # Language configuration
        └── highlights.scm      # Syntax highlighting queries
```

### Customizing the Icon

The extension includes a custom icon that appears in Zed's extension list and file tree. To customize it:

1. Edit or replace `icons/stonescript.svg` with your own SVG icon (recommended size: 64x64px)
2. Update the `icon` field in `extension.toml` if you change the filename
3. Rebuild the extension with `cargo build --release`

See `icons/README.md` for detailed guidelines on creating or modifying icons.

### Syntax Highlighting Queries

The syntax highlighting is defined in `languages/stonescript/highlights.scm` using Tree-sitter query syntax.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

### Areas for Contribution

- Improved syntax highlighting patterns
- Additional language server features
- Better documentation and examples
- Bug fixes and performance improvements

## License

MIT License - see LICENSE file for details

## Related Projects

- [stonescript-language-server](https://github.com/kurbezz/stonescript-language-server) - LSP implementation for StoneScript
- [tree-sitter-stonescript](https://github.com/kurbezz/tree-sitter-stonescript) - Tree-sitter grammar for StoneScript

## Resources

- [Stone Story RPG](https://stonestoryrpg.com/)
- [StoneScript Documentation](https://stonestoryrpg.com/stonescript/)
- [Zed Editor](https://zed.dev/)
- [Zed Extensions Documentation](https://zed.dev/docs/extensions)

## Acknowledgments

Built for the Stone Story RPG community with tools from:
- [Zed Industries](https://zed.dev/) - The Zed editor
- [Tree-sitter](https://tree-sitter.github.io/) - Incremental parsing library
- [tower-lsp](https://github.com/ebkalderon/tower-lsp) - LSP framework

## Support

For issues, questions, or suggestions:
- Open an issue on [GitHub](https://github.com/kurbezz/zed-stonescript/issues)
- Visit the Stone Story RPG community