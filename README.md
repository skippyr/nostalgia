# Nostalgia
## About
A theme for the ZSH shell that is inspired by the Windows CMD prompt.
![](preview.png)

It can show you:
-   The exit code of failed commands.
-   Your user and host names.
-   Your current directory, abbreaviating parent directories by their initials.
-   If inside a Git repository, the branch.

## Installation
### Dependencies
The following dependencies must be installed to install this software properly:
-   `git`

### Procedures
-   Clone this repository.
```bash
git\
    clone --depth=1 https://github.com/skippyr/nostalgia\
    ~/.local/share/zsh/themes/nostalgia
```

-   Add the following source rule to your `~/.zshrc` file. Ensure to not source other theme.
```bash
source ~/.local/share/zsh/themes/nostalgia/nostalgia.zsh-theme
```

-   Reopen ZSH.

## Copyright
This software is under the MIT license. A copy of the license is bundled with the source code.
