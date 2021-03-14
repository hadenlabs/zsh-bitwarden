<!--


  ** DO NOT EDIT THIS FILE
  **
  ** 1) Make all changes to `README.yaml`
  ** 2) Run`make readme` to rebuild this file.
  **
  ** (We maintain HUNDREDS of open source projects. This is how we maintain our sanity.)
  **


  -->

# zsh-bitwarden

[![Lint](https://github.com/hadenlabs/zsh-bitwarden/actions/workflows/lint.yml/badge.svg?branch=develop)](https://github.com/hadenlabs/zsh-bitwarden/actions) [![Issues](https://img.shields.io/github/issues/hadenlabs/zsh-bitwarden.svg)](https://github.com/hadenlabs/zsh-bitwarden/issues) [![Latest Release](https://img.shields.io/github/release/hadenlabs/zsh-bitwarden.svg)](https://github.com/hadenlabs/zsh-bitwarden/releases)

zsh-bitwarden plugin for zsh.

## :page_facing_up: License

zsh-bitwarden is an open-sourced software licensed under the [MIT license](LICENSE.md).

## Requirements

This is a list of plugins that need to be installed previously to enjoy all the goodies of this configuration:

```{bash}
https://github.com/hadenlabs/zsh-core

```

## Installation

### [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) users

If you're using [oh-my-zsh](https://gitub.com/robbyrussell/oh-my-zsh), install this plugin by doing the following:

1.  Go to your oh-my-zsh custom plugins directory -`cd ~/.oh-my-zsh/custom/plugins`
2.  Clone the plugin `bash git clone https://github.com/hadenlabs/zsh-bitwarden`bash
3.  Edit your `.zshrc` and add `plugins=( ... zsh-bitwarden )` to your list of plugins
4.  Open a new terminal and enjoy!

### [antigen](https://github.com/zsh-users/antigen) users

If you're using [Antigen](https://github.com/zsh-lovers/antigen), install this plugin by doing the following:

1.  Add `antigen bundle hadenlabs/zsh-bitwarden` to your `.zshrc` where you're adding your other plugins.
2.  Either open a new terminal to force zsh to load the new plugin, or run `antigen bundle hadenlabs/zsh-bitwarden` in a running zsh session.
3.  Enjoy!

### [antibody](https://github.com/getantibody/antibody) users

If you're using [Antigen](https://github.com/getantibody/antibody), install this plugin by doing the following:

1.  Add :

```{.sourceCode .bash}
     antibody bundle hadenlabs/zsh-bitwarden
```

to your `.zshrc` where you're adding your other plugins.

2.  Either open a new terminal to force zsh to load the new plugin, or run `antibody bundle hadenlabs/zsh-bitwarden` in a running zsh session.
3.  Enjoy!

## Usage

`CTRL x + k`: run fzf bitwarden

## Functions

zsh bitwarden includes a small utility `bitwarden` to fetch and install new packages.

#### `bw::search`

Search key in bitwarden.

## Help

**Got a question?**

File a GitHub [issue](https://github.com/hadenlabs/zsh-bitwarden/issues), send us an [email](email) or join our [Slack Community](slack).

## Contributing

### Bug Reports & Feature Requests

Please use the [issue tracker](https://github.com/hadenlabs/zsh-bitwarden/issues) to report any bugs or file feature requests.

### Developing

In general, PRs are welcome. We follow the typical "fork-and-pull" Git workflow.

1.  **Fork** the repo on GitHub
2.  **Clone** the project to your own machine
3.  **Commit** changes to your own branch
4.  **Push** your work back up to your fork
5.  Submit a **Pull Request** so that we can review your changes

**NOTE:** Be sure to rebase the latest changes from "upstream" before making a pull request!

#### Versioning

Releases are managed using github release feature. We use [Semantic Versioning](http://semver.org) for all the releases. Every change made to the code base will be referred to in the release notes (except for cleanups and refactorings).

## Copyright

Copyright © 2018-2021 [Hadenlabs](https://hadenlabs.com)

## Trademarks

All other trademarks referenced herein are the property of their respective owners.

## Don't forget to 🌟 Star 🌟 the repo if you like zsh-bitwarden

[Your feedback is appreciated](https://github.com/hadenlabs/zsh-bitwarden/issues)
