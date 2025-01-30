#!/bin/env bash

# Classics:
alias la="ls -lAh" # ls (but everything).
alias ..="cd .."
alias ...="cd ../.."
alias grep="grep --color=auto" # Add colors to grep.
alias projects='cd $PROJECTS_HOME'
alias repos='cd $REPOS'
alias mkdir="mkdir -pv"
alias mv="mv -iv" # Confirmation of overwrite and create missing intermediate dirs.
alias cp="cp -i" # Confirmation of overwrite.
alias ln="ln -i" # Confirmation of overwrite.
alias cls='clear'
alias today='date +"%d.%m.%Y"'
alias now='date +"%d.%m.%Y %H:%M:%S"'

# Other:
alias downloads='code $HOME/Downloads'
alias code='open -b com.microsoft.VSCode' # Open VSCode.
alias meme='open "https://imgflip.com/memetemplates"'
alias gn='sleep 5000 && sn' # Good night, sleep well.
alias home='code ~'
alias notes='code $REPOS/notes'
alias django="python -m pipenv run python manage.py"
alias makemigrations="python -m pipenv run python manage.py makemigrations"
alias migrate="python -m pipenv run python manage.py migrate"
alias reload="source ~/.bash_profile" # Reload shell environment.
alias restart="sudo shutdown -r now" # Reboot machine.
alias iterm-scripts="code ~/Library/Application\ Support/iTerm2/Scripts"
alias dw='cd "$REPOS"/spotify && pipenv run python discover_weekly.py && cd -' # Generate playlists for discover weekly in Spotify.
alias ncdu-home="ncdu ~ --exclude Projects --exclude Library --exclude .vscode" # Scan home dir.
alias screenshots="code ~/Pictures/screenshots" # Cmd + Shift + 5 -> Options
alias br="br --dates --hidden --git-ignored" # broot.
alias speedtest="cat ~/speedtest.py | python -" # Old: alias speedtest="curl https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python -"
alias supercaffeinate="caffeinate -dimsu" # When you want the Mac screen to remain on.
alias safemail='cd "$REPOS"/chrome-extension-safemail && code .'
alias reset-alttab="defaults delete com.lwouis.alt-tab-macos" # https://github.com/lwouis/alt-tab-macos/issues/3653

function r() {
    # Interactive repo picker.
    cd "$(find "$REPOS" -type d -maxdepth 1 | fzf)" || exit
}

function c() {
    # Interactive repo picker, opens VSCode.
    code "$(find "$REPOS" -type d -maxdepth 1 | fzf)" || exit
}

# Kundeportalen:
# alias kpdjango="dc run app python manage.py"
# alias kpsync="pipenv run pipenv:sync; pnpm -w install"
# alias kpup="pipenv run pipenv:update; pnpm -w run update"
# alias kp-gen-routes="django generate_routes"
# alias kp-gen-perms="kpdjango generate_permissions"
# alias kpgen="makemigrations; kp-gen-routes; kp-gen-perms; ./maketypes.sh;"
# alias feide='cd $REPOS/feide-kp'
# alias paas="open 'https://console.paas2.uninett.no/kubeconfig/'"
# alias kp-deployments="kubectl -n feide-feide-kp get deployments --sort-by=.metadata.creationTimestamp"
# alias kp-kube="kubectl -n feide-feide-kp" # <name>
# alias kp-pods="kp-kube get pods --show-labels"
# alias kp-logs="kp-kube logs" # <name>
# alias dptest="open 'https://dashboard.dataporten-test.uninett.no/#!/fc:org:sikt.no'"
# alias prod-terminal="open 'https://gitlab.sikt.no/feide/feide-kp/-/environments/189/terminal'"
alias staging-terminal="open 'https://gitlab.sikt.no/feide/feide-kp/-/environments/188/terminal'"
alias kp-rollestyring="open 'https://feide-kp-review-2359-test-tav533.paas2.uninett.no/org/2217476/start/'"
alias kp-emulated="open 'https://feide-kp-review-3299-emule-cj8bdj.paas2.uninett.no/org/2217476/start/'"
alias staging="open 'https://feide-kp-staging.paas2.uninett.no/'"
# alias sentry="open 'https://sentry.feide.no/organizations/feide/issues/?environment=production&project=2&query=is%3Aunresolved&referrer=issue-list&statsPeriod=14d'"
# alias chromatic="open 'https://www.chromatic.com/library?appId=6183ad02fa0207003a95f45f'"
# alias board="open 'https://gitlab.sikt.no/feide/feide-kp/-/boards/768'" # kp-team
# alias rboard="open 'https://gitlab.sikt.no/feide/feide-kp/-/boards/637'" # Rollestyring
# alias myboard="open 'https://gitlab.sikt.no/feide/feide-kp/-/boards/798'" # kp-team + emilte
alias is-kp='[[ "$(git remote-url)" == "git@gitlab.sikt.no:feide/feide-kp.git" ]]'
# alias kp-passed-master-pipelines="open 'https://gitlab.sikt.no/feide/feide-kp/-/pipelines?page=1&scope=all&ref=master&status=success'"

alias vevia='cd $REPOS/vevia'

# Aneo:
alias aneo='cd $REPOS/aneo-common-web'
alias aneo-start='aneo && pnpm i && pnpm run dev'
alias aneo-design='cd $REPOS/aneo-designsystem'
alias aneo-design-start='aneo-design && pnpm i && pnpm run dev'
alias prod="open 'https://aneo-common-web.vercel.app/nb-NO'"
alias board="open 'https://app.asana.com/0/1208540119714729/1208549035714041'"
alias asana="board"
# alias anup="pipenv run pipenv:update; pnpm -w run update"


# Docker:
alias d="docker"
alias dc="docker compose"
alias dcb="dc build"
alias dcu="dc up --remove-orphans"
alias dcbu="dcb; dcu"
alias dcua="dcu app"
alias dcbua="dcb; dcu app"
alias dcra="dc restart app"
alias dcbb="dcb backend"
alias dcub="dcu backend"
alias dcbub="dcbb; dcub"
alias dspa="docker system prune -af --volumes" # Completely clean docker caches.
# "cliPluginsExtraDirs": ["/usr/local/lib/docker/cli-plugins"] 

# git:
alias repo='git repo' # Open repository in browser.
alias nmr='. ~/.bash_scripts/nmr.sh'
alias npr='. ~/.bash_scripts/npr.sh'
alias gub='. ~/.bash_scripts/gub.sh'
alias branchify='. ~/.bash_scripts/branchify.sh'
alias is-home='[[ "$(git remote-url)" == "git@github.com:emilte/home.git" ]]'
alias mr="glab mr view --web" # Open current MR in GitLab.

# MG::Web
alias samf='cd $REPOS/Samfundet'
alias samf4='cd $REPOS/Samfundet4'
alias rekenett='cd $REPOS/rekenett'
alias is-samf4='[[ "$(git remote-url)" == "git@github.com:Samfundet/Samfundet4.git" ]]'

# Brew:
alias brew='sudo echo || open -a Privileges; brew'
alias binary-ninja='open -a "Binary Ninja"'
alias idafree='open -a "ida64"'
alias brew-outdated-casks='brew outdated --greedy'
alias brew-search='open "https://brew.sh"'
alias brew-up="brew update && brew upgrade && brew cleanup"



# alias chrome='open -a "Google Chrome"'
# alias chrome='open /Applications/Google\ Chrome.app' # --args --new-window --disable-dark-mode'

# Mac:
# https://ss64.com/osx/pmset.html
alias xacceptlicense="sudo xcodebuild -license accept"
alias cpu-temperature='sudo powermetrics --samplers smc || exit |grep -i "CPU die temperature"' # Monitor CPU temperature.
alias pmset-config="code /Library/Preferences/SystemConfiguration/com.apple.PowerManagement.plist"
alias pmset-list="code /Library/Preferences/SystemConfiguration/com.apple.AutoWake.plist" # Show pmset wake list.
alias lid="ioreg -r -k AppleClamshellState -d 4 | grep AppleClamshellState | head -1" # Show lid state.
alias sync-clock='sudo sntp -Ss time.apple.com'
alias mute="osascript -e 'set volume output muted true'"
alias volume0="osascript -e 'set Volume 0'" # Set volume to 0 on Mac.
alias bluetooth-off='blueutil -p 0'
alias sn="bluetooth-off; pmset sleepnow" # Send machine to sleep.

# Java:
alias java8='export JAVA_HOME=$(/usr/libexec/java_home -v1.8); echo JAVA_HOME=$JAVA_HOME; echo $(java -version)'
alias java11='export JAVA_HOME=$(/usr/libexec/java_home -v11); echo JAVA_HOME=$JAVA_HOME; echo $(java -version)'
alias java17='export JAVA_HOME=$(/usr/libexec/java_home -v17); echo JAVA_HOME=$JAVA_HOME; echo $(java -version)'
alias java18='export JAVA_HOME=$(/usr/libexec/java_home -v18); echo JAVA_HOME=$JAVA_HOME; echo $(java -version)'
alias java19='export JAVA_HOME=$(/usr/libexec/java_home -v19); echo JAVA_HOME=$JAVA_HOME; echo $(java -version)'
alias java21='export JAVA_HOME=$(/usr/libexec/java_home -v21); echo JAVA_HOME=$JAVA_HOME; echo $(java -version)'

# Android:
alias sdkmanager='$ANDROID_HOME/cmdline-tools/latest/bin/sdkmanager'
alias adb='$ANDROID_HOME/platform-tools/adb'

### Cleanup machine ###
# Use ncdu to locate large folders.
# See home directory
# See ~/Library/Caches
### End: Cleanup machine ###

# cache config
# npm config set cache "$HOME/Projects/.npm"
# yarn config set cacheFolder "$HOME/Projects/.yarn/cache"

# To restart php after an upgrade:
#   brew services restart php

# Or, if you don't want/need a background service you can just run:
#   /usr/local/opt/php/sbin/php-fpm --nodaemonize


# To restart postgresql@14 after an upgrade:
#   brew services restart postgresql@14
# Or, if you don't want/need a background service you can just run:
#   /usr/local/opt/postgresql@14/bin/postgres -D /usr/local/var/postgresql@14


# rust
# uninstall rust: rustup self uninstall


### Functions ###

function kp-kube-shell {
    kubectl -n feide-feide-kp exec "$1" -it -- sh
}