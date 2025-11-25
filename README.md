# Zed StoneScript Extension

A Zed editor extension providing comprehensive language support for StoneScript, the scripting language used in Stone Story RPG.

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

### From Source

```bash
git clone https://github.com/kurbezz/zed-stonescript.git
cd zed-stonescript
```

Then in Zed, use `zed: install dev extension` and select this directory.

## Requirements

This extension requires the [StoneScript Language Server](https://github.com/kurbezz/stonescript-language-server). The extension will attempt to use the language server if it's available in your PATH.

### Installing the Language Server

```bash
git clone https://github.com/kurbezz/stonescript-language-server.git
cd stonescript-language-server
cargo build --release
# Add target/release/stonescript-lsp to your PATH
```

## File Extensions

The extension automatically activates for files with the following extensions:
- `.ss` - StoneScript files
- `.txt` - Text files (when containing StoneScript code)

## Configuration

The extension uses the Tree-sitter grammar from [tree-sitter-stonescript](https://github.com/kurbezz/tree-sitter-stonescript).

### Extension Settings

Configuration is managed through `extension.toml`:

```toml
id = "stonescript"
name = "StoneScript"
version = "0.1.0"
description = "StoneScript language support with LSP"
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
├── src/
│   └── lib.rs                  # Extension implementation
└── languages/
    └── stonescript/
        ├── config.toml         # Language configuration
        └── highlights.scm      # Syntax highlighting queries
```

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