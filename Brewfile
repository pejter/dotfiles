require "open3"

def command_available?(command)
  ENV.fetch("PATH", "").split(File::PATH_SEPARATOR).any? do |directory|
    executable = File.join(directory, command)
    File.file?(executable) && File.executable?(executable)
  end
end

# Dotfiles management
# Antidote is sourced from the Homebrew prefix by the post-hook.
brew "toml-bombadil" unless command_available?("bombadil")
brew "antidote"

# Shell
brew "zsh" unless command_available?("zsh")
brew "starship" unless command_available?("starship")
brew "neovim" unless command_available?("nvim")
brew "eza" unless command_available?("eza")
brew "fzf" unless command_available?("fzf")

# Git development
brew "git" unless command_available?("git")
brew "gh" unless command_available?("gh")
brew "worktrunk" unless command_available?("wt")
brew "difftastic" unless command_available?("difft")
brew "git-delta" unless command_available?("delta")

if command_available?("gh")
  extensions, status = Open3.capture2e("gh", "extension", "list")
  abort "Could not list GitHub CLI extensions: #{extensions.strip}" unless status.success?

  unless extensions.lines.any? { |line| line.split.include?("github/gh-stack") }
    abort "Missing GitHub CLI extension: gh-stack; install with gh extension install github/gh-stack"
  end
end

# CLI utilities
brew "bat" unless command_available?("bat")
brew "bottom" unless command_available?("btm")
brew "dust" unless command_available?("dust")
brew "dstp" unless command_available?("dstp")
brew "duf" unless command_available?("duf")
brew "fd" unless command_available?("fd")
brew "glow" unless command_available?("glow")
brew "pug" unless command_available?("pug")
brew "ripgrep" unless command_available?("rg")
brew "somo" unless command_available?("somo")
brew "yazi" unless command_available?("yazi")

# Kubernetes
brew "kubernetes-cli" unless command_available?("kubectl")
brew "k9s" unless command_available?("k9s")
