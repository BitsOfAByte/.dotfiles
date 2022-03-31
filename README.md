# BitsOfAByte's .dotfiles

This repository stores my personal setup for **Ubuntu** based distributions.

## Word of Warning

> By running these scripts, you are certain that you are okay with any changes they may make to your system, I am not responsible for any issues/damage they may cause. **Always** check what scripts you run, especially if you find them on the internet. You will have to make a lot of modifications to individual files in order to make them more personal to you.

### Oneliner

```
cd ~ && git clone https://github.com/bitsofabyte/.dotfiles.git && chmod -R +x .dotfiles && cd .dotfiles && ./bootstrap.sh
```

## Setup

1. Clone the repository locally in your home folder and navigate to it
2. Run `chmod -R +x .` to make scripts executable
4. Run `bash bootstrap.sh` (optional: --force or -f)

## Variables

Variable management is done in `variables.sh`, it is NOT recommended to modify this file as it could break the bootstrapper.

## CRON Syncing

When running the bootstrapper, a cron job to sync configurations from the remote to local will be added to your crontab (`crontab -l`). If your dotfiles directory moves, you must delete the job from the crontab and re-run the bootstrapper as the bootstrapper will not detect this.

## Bootstrap Scripts

Core bootstrap scripts are located in `$DOTFILES_DIR/bootstrap` and are executed from `bootstrap.sh`. Sub-directories in .bootstrap are used for organizing sub-tasks. All scripts are ran in `sort` order.

## Directories

```
├── .bootstrap - Scripts for bootrap.sh
├── configs - Configuration files
├── programs - Program installers & sources
└── wallpapers - Wallpaper storage
```
