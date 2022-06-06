# Home sweet home

## Full installation:

> WARNING: This command will ensure that the home directory reflects this repo. The old setup will be backed up in a branch named "home-old".

```sh
cd ~ && git init && git config --global user.email "you@example.com" && git config --global user.name "Your Name" && git remote add origin https://github.com/emilte/home.git && git fetch --all && git checkout -b "home-old" && git add . && git commit -m "Old home directory" && git checkout master -f ; bash .docker_testing/.configure_bash.sh n
```

> Steps:
>
> 1.

> Hack to clone repo into non-empty existing path such as the home directory:
> init new repo
> add repo as origin
> fetch
> force checkout to master

## For non-Emil users

You probably don't want the exact same setup as me.
Run this command for interactive installation:

```sh
cd ~ && git init && git config --global user.email "you@example.com" && git config --global user.name "Your Name" && git remote add origin https://github.com/emilte/home.git && git fetch --all && git checkout -b "home-old" && git add . && git commit -m "Old home directory" && git checkout master -f ; bash .docker_testing/.configure_bash.sh y
```
