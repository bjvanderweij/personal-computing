# Installation and running

```
./build.sh
uv run ansible-playbook bootstrap.yaml -K
```

The build script renders dotfiles in `dotfiles/` and places them in the `build/` directory.
Stow creates symlinks to this repository when it deploys dotfiles.
If we used files `dotfiles/` directly, our deployed dotfiles would be affected any time we change a file in `dotfiles` while developing this repo.

## Troubleshooting

If "become escalation" doesn't work and you're on a distro that uses sudo-rs rather than sudo, you can fix it as follows

```
ANSIBLE_BECOME_EXE=/usr/bin/sudo.ws uv run ansible-playbook bootstrap.yaml -K
```
