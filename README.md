# My neovim config

I'm still kinda new to neovim, but liked my setup. Largely used Primeagen's zero to LSP video but used Lazy as a plugin manager. I used

```
# Mac
brew install neovim

# Linux (I use Pop!_OS 24.04 LTS)
sudo apt-get install neovim
```

For Telescope, I used

```
# Mac
brew install ripgrep

# Linux (I use Pop!_OS 24.04 LTS)
sudo apt-get install neovim
```

for better search finding. Just the two things I remember installing that need to be done outside of this configuration repository.

The LSPs should be installed as you go as well, not sure how to bundle those up but per preferences as well anyway.

I also have a bash command I use, my source being ~/.zshrc

```
alias nvim_update_plugins="nvim --headless \"+Lazy! sync\" +qa
```

Also- and mostly as a note to self- I have my key repeat settings set to the shortest/quickest possible.

## Tech Stack

I kind of have a personal tech stack (that I'll need to eventually put on my portfolio site as level of skill).

- Application: Golang
- Scripting: Lua
- Functional: Elixir (haven't used it for big projects yet though)
- Systems Level: Zig (haven't used it yet but it's on my list instead of C++. unless Jai comes out...)
- Frontend: JS (Vue, React)

## TODO

I want to organize the setups a little bit since each plugin more or less has its own lua file as per lazy vim configurations on their docs.

Other than that, I'll also add more of the remaps to the remap lua file. Those will come as I find things that I need and use frequently as well.

- [ ] Set up the debugging plugin (from the primeagen's repo I believe)
