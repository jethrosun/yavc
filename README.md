# yavc

My nvim configuration draws inspirations from from [jonhoo/config](https://github.com/jonhoo/configs) and [smb374/my-nvim-dots](https://github.com/smb374/my-nvim-dots)

## Neovim Config

Welcome! This is my neovim config dir!

To update nvim config:

`nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'`

To install neovim:

`wget https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage && chmod u+x nvim.appimage && mv nvim.appimage nvim`

To install packer:
`
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim`

Setup pycodestyle: see [this](https://pycodestyle.pycqa.org/en/latest/intro.html#configuration)

## Setup pyenv and python environment
```bash
# setup pyenv first, then
pyenv install 3.12.0
sudo apt install libbz2-dev
sudo apt-get install liblzma-dev libsqlite3-dev libedit-dev libncurses5-dev libreadline-dev
```

## Current look

![Current look of my neovim](imgs/nvim-look.png?raw=true "Title")

## Reference
- [Neovim and latex](https://www.ejmastnak.com/tutorials/vim-latex/intro.html)
- [Mac BigSur and packer](https://github.com/wbthomason/packer.nvim/issues/180)
```bash
MACOSX_DEPLOYMENT_TARGET=10.15 nvim
```
- [ltex and java](): just install temurin instead of openjdk
```bash
brew install --cask temurin
```

## Additionally
```
:TSUninstall all
:TSInstall all
:TSUpdate
```


## TODO
- fix the pyenv issue: sometime i have it configured and installed, but
  sometimes not
- fix the fold thing: ufo is not working rn
- [checkwriting](https://github.com/devd/Academic-Writing-Check): I need a
  better way to use it

https://github.com/GregoryAshton/dotfiles/blob/master/vim/vimrc
https://github.com/syclops/dotfiles/blob/master/vim/post.vimrc

## ChangeList
- Nov 19, 2020: [config nvim with coq and packer using lua](https://github.com/jethrosun/yavc/commit/46628fb7cd72f02c50c9faaf36bf212f8b6d8c85)
- Nov 15, 2020: [Ditch coc.nvim and switch to nvim lsp](https://github.com/jethrosun/yavc/commit/837aa7a6e3dec6d40263d2308918124fd1e058f7)
- Nov 10, 2020: [Switched back to lightline from airline](https://github.com/jethrosun/yavc/commit/fa77bad8eb396ce021d313ce4d16e730ffbb5f3d)
- Nov 6, 2020: [More tweaks on coc setup](https://github.com/jethrosun/yavc/commit/a756b0e15fe4117cd96c52fa47133d0083cb7d2f)
- Aug 22, 2020: [Fixed rustfmt and coc setting](https://github.com/jethrosun/yavc/commit/3de540d3aaf52ca844027e31f5b292de72a1bf71)
- Nov 27, 2019: [Fixed airline and added js](https://github.com/jethrosun/yavc/commit/7b5dc6e642b784eea054da8b8bf7c6dff6beef33)
- Nov 22, 2019: [Display coc via ale](https://github.com/jethrosun/yavc/commit/4e84e6ebaabe788fb3bc7c910d76a6d5cb74c8b4)
- Nov 11, 2019: [Use coc rust analyzer w/ ale](https://github.com/jethrosun/yavc/commit/a7122b6a40620737252295e3ffe667006a4b3973)
- Nov 7, 2019: [Give rust-analyzer a go](https://github.com/jethrosun/yavc/commit/b47ba8dc901ba75cf23619532caf7bc3cfb36c91)
- May 24, 2019: [Refactoring the codebase: coc for completion and ale for linting](https://github.com/jethrosun/yavc/commit/463bae1f8b04b9c940c2d89181baf4b1f52e0055)
