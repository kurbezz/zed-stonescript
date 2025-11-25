use zed_extension_api::{self as zed, Result};

struct StonescriptExtension;

impl zed::Extension for StonescriptExtension {
    fn new() -> Self {
        Self
    }

    fn language_server_command(
        &mut self,
        _language_server_id: &zed::LanguageServerId,
        _worktree: &zed::Worktree,
    ) -> Result<zed::Command> {
        Ok(zed::Command {
            command: "stonescript-lsp".to_string(),
            args: vec![],
            env: Default::default(),
        })
    }
}

zed::register_extension!(StonescriptExtension);
