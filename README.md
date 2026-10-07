# Frankie's Dotfiles

Shell and editor configuration for macOS and Linux.

## Prerequisites

Install the following before setup:

- Git
- Zsh
- nvm
- pnpm
- Oh My Posh
- Homebrew

## Setup

1. Clone the repository to the location expected by the installer:

   ```shell
   git clone https://github.com/0xfr4nkie/dotfiles.git ~/.dotfiles
   ```

2. Enter the repository:

   ```shell
   cd ~/.dotfiles
   ```

3. Make the installer executable:

   ```shell
   chmod +x scripts/makesymlinks.sh
   ```

4. Create the symlinks:

   ```shell
   ./scripts/makesymlinks.sh
   ```

The script creates `~/.dotfiles_old` and backs up existing dotfiles before replacing them. It links only the supported home-directory files: `config/shell/zshrc` to `~/.zshrc` and `config/editor/vimrc` to `~/.vimrc`.

## Claude Code config

`config/claude/` holds the global Claude Code instructions (`CLAUDE.md`) and sub-agent definitions (`agents/*.md`). On a new machine, after cloning, run:

```shell
./scripts/link-claude.sh
```

The script symlinks `CLAUDE.md` and each agent file individually into `~/.claude/`, creating `~/.claude/` and `~/.claude/agents/` if needed. It never links the whole directory, so machine-local state and other agents are untouched. It is safe to re-run: correct links are skipped, stale links are replaced, and any existing real file is moved to `<name>.bak.<timestamp>` first.

## Optional: Linux MOTD

On Ubuntu or Debian systems that use `update-motd`, install the custom greeting with:

```shell
sudo install -m 755 \
  ~/.dotfiles/config/motd/update-motd.d/05-greeting \
  /etc/update-motd.d/05-greeting
```

Test it without logging out:

```shell
/etc/update-motd.d/05-greeting
```

The greeting will appear during the next SSH login or login shell when `update-motd` runs.

## Included

- `config/shell/zshrc`, linked as `~/.zshrc`
- `config/shell/macos.zshrc` and `config/shell/linux.zshrc`, loaded by Zsh as appropriate
- nvm, pnpm, Homebrew, and Oh My Posh configuration
- `config/prompt/theme.omp.json`, the Oh My Posh theme
- `config/editor/vimrc`, linked as `~/.vimrc`
- `config/motd/update-motd.d/05-greeting`, the optional Linux login greeting
- `config/claude/`, the Claude Code global config, linked into `~/.claude/` by `scripts/link-claude.sh`
- `scripts/makesymlinks.sh`, the symlink installer

## References

- <https://dotfiles.github.io/tutorials/>
- <https://blog.smalleycreative.com/using-git-and-github-to-manage-your-dotfiles/>
