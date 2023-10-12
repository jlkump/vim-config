# Overview
This repo contains both my nvim and vim configs to make it easy to copy
for future use. The vim folder contains my current vim config, while
the nvim folder contains my neo vim config. These are seperated
into seperate branches to make cloning them easier.

## How to use
For vim, place the files and folders within in the user's local root
(i.e. at `~`).

For vim config:
```
cd ~
git clone --depth=1 -b vim https://github.com/jlkump/vim-config.git
```

For nvim config:
```
cd ~
git clone --depth=1 -b neovim https://github.com/jlkump/vim-config.git
```

Then extract the files from the resulting vim-config folder to `~` and delete the vim-config folder
