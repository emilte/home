# Home sweet home

I've finally published my local setup, [check it out](https://youtu.be/pqky5B179nM?t=73)!

<br>
<br>

## Sandbox

If you want a preview of this setup, you should try this!
<br>
I have provided a simple Dockerfile [/DockerFile](/DockerFile) for sandbox testing.

> WARNING: Never blindly trust commands you didn't write yourself. I advice you to inspect commands before running them.

<br>

Command to open a new container (can safely be repeated):

> NOTE: This does not run the installation, continue in the section [for other users](#for-non-emil-users).

```sh
cd ~ && rm -rf /tmp/docker-home-testing && mkdir /tmp/docker-home-testing && cd /tmp/docker-home-testing && curl -LJO https://raw.githubusercontent.com/emilte/home/master/Dockerfile && docker build --force-rm --rm -t home-test . ; docker run -it home-test
```

> This command will:
>
> 1. Create a temporary directory in `/tmp/docker-home-testing`.
> 2. Fetch Dockerfile.
> 3. Build image and run container.

<br>

If you only want the last part of starting a new clean container (can safely be repeated):

```sh
docker build --force-rm --rm -t home-test . ; docker run -it home-test
```

> Does only step 3 above.

<br>
<br>
<hr>
<br>
<br>

## Full installation:

Dedicated to myself, you should probably see the section [for other users](#for-non-emil-users).

> WARNING: This command will ensure that the home directory reflects this repo. The old setup will be backed up in a branch named `home-old`.

```sh
cd ~ && git init && git config --global user.email "you@example.com" && git config --global user.name "Your Name" && git remote add origin git@github.com:emilte/home.git && git fetch --all && git checkout -b "home-old" && git add . && git commit -m "Old home directory" && git checkout master -f ; bash .configure_bash.sh n
```

<br>
<br>
<hr>
<br>
<br>

## For non-Emil users

You probably don't want the exact same setup as me.
Run this command for interactive installation:

> WARNING: This command will ensure that the home directory reflects this repo. The old setup will be backed up in a branch named `home-old`.

> WARNING: Never blindly trust commands you didn't write yourself. I advice you to inspect commands before running them.

```sh
cd ~ && git init && git config --global user.email "you@example.com" && git config --global user.name "Your Name" && git remote add origin https://github.com/emilte/home.git && git fetch --all && git checkout -b "home-old" && git add . && git commit -m "Old home directory" && git checkout master -f ; bash .configure_bash.sh y
```

> This command will:
>
> 1. `cd ~` <br>
>    Go to home directory.
> 2. `git init` <br>
>    Hack to clone repo into non-empty existing path.
>    https://stackoverflow.com/questions/50361138/destination-path-already-exists-and-is-not-an-empty-directory
> 3. `git config --global user.email "you@example.com" && git config --global user.name "Your Name"` <br>
>    Added because git complained about missing config. This will be overwritten soon anyway.
> 4. `git remote add origin https://github.com/emilte/home.git` <br>
>    Set this repo as remote.
> 5. `git fetch --all` <br>
>    Fetch all branches and changes to prepare for incoming changes.
> 6. `git checkout -b "home-old"` <br>
>    Create branch `home-old` for current setup.
> 7. `git add .` <br>
>    Stage all files and folders in current setup.
> 8. `git commit -m "Old home directory"` <br>
>    Commit current setup to branch `home-old`.
> 9. `git checkout master -f` <br>
>    Force new setup in home directory.
> 10. `bash .configure_bash.sh y` <br>
>     Run configuration for bash in interactive mode.

<br>
<br>
<hr>
<br>
<br>

## Sources:

1. https://stackoverflow.com/a/45514197/12616507
2. https://stackoverflow.com/questions/50361138/destination-path-already-exists-and-is-not-an-empty-directory
3. https://curl.se/docs/manpage.html
4. https://codefather.tech/blog/bash-unary-operator-expected/
5. https://ryanstutorials.net/bash-scripting-tutorial/bash-if-statements.php
6. https://stackoverflow.com/a/2642592/12616507
7. https://hub.docker.com/_/ubuntu
8. https://ggkbase-help.berkeley.edu/how-to/install-pyenv/
9. https://unix.stackexchange.com/a/594845
10. https://stackoverflow.com/a/6212408/12616507
11. https://github.com/emilyst/home
12. https://github.com/emilte/terminal
13. https://linuxize.com/post/bash-functions/
