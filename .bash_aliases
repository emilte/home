#!/bin/env bash

alias la="ls -lAh" # ls (but everything).
alias ..="cd .."
alias ...="cd ../.."
alias grep="grep --color=auto" # Add colors to grep.
alias projects='cd $PROJECTS_HOME'
alias repos='cd $REPOS'
alias dc="docker compose"
alias d="docker"
alias mkdir="mkdir -pv"
alias mv="mv -iv" # Confirmation of overwrite and create missing intermediate dirs.
alias cp="cp -i" # Confirmation of overwrite.
alias ln="ln -i" # Confirmation of overwrite.

# Kundeportalen:
alias kpdjango="dc exec app python manage.py"
alias kp-gen-routes="django generate_routes"
alias kp-gen-perms="kpdjango generate_permissions"
alias kpgen="kp-gen-routes; kp-gen-perms; ./maketypes.sh"
# alias kpgen="(kp-gen-routes >/dev/null 2>&1) & disown; (kp-gen-perms) & disown; (./maketypes.sh) & disown"
alias feide='cd $REPOS/feide-kp'
alias paas="open 'https://console.paas2.uninett.no/kubeconfig/'"
alias kp-deployments="kubectl -n feide-feide-kp get deployments --sort-by=.metadata.creationTimestamp"
alias kp-kube="kubectl -n feide-feide-kp" # <name>
alias kp-pods="kp-kube get pods --show-labels"
alias kp-logs="kp-kube logs" # <name>
alias dptest="open 'https://dashboard.dataporten-test.uninett.no/#!/fc:org:sikt.no'"
alias prod-terminal="open 'https://gitlab.sikt.no/feide/feide-kp/-/environments/189/terminal'"
alias staging-terminal="open 'https://gitlab.sikt.no/feide/feide-kp/-/environments/188/terminal'"
alias kp-rollestyring="open 'https://feide-kp-review-2359-test-tav533.paas2.uninett.no/org/2217476/start/'"
alias kp-emulated="open 'https://feide-kp-review-3299-emule-cj8bdj.paas2.uninett.no/org/2217476/start/'"
alias staging="open 'https://feide-kp-staging.paas2.uninett.no/'"
alias prod="open 'https://kunde.feide.no/'"
alias sentry="open 'https://sentry.feide.no/organizations/feide/issues/?environment=production&project=2&query=is%3Aunresolved&referrer=issue-list&statsPeriod=14d'"
alias chromatic="open 'https://www.chromatic.com/library?appId=6183ad02fa0207003a95f45f'"
alias board="open 'https://gitlab.sikt.no/feide/feide-kp/-/boards/78'" # kp-team
alias rboard="open 'https://gitlab.sikt.no/feide/feide-kp/-/boards/637'" # Rollestyring
alias myboard="open 'https://gitlab.sikt.no/feide/feide-kp/-/boards/798'" # kp-team + emilte
alias is-kp='[[ "$(git remote-url)" == "git@gitlab.sikt.no:feide/feide-kp.git" ]]'
alias kp-passed-master-pipelines="open 'https://gitlab.sikt.no/feide/feide-kp/-/pipelines?page=1&scope=all&ref=master&status=success'"

alias dcb="dc build"
alias dcbu="dc build; dc up"
alias dcua="dc up app"
alias dcbua="dc build; dc up app"
alias today='date +"%d.%m.%Y"'
alias now='date +"%d.%m.%Y %H:%M:%S"'

alias home='code ~'
alias cls='clear'
alias samf='cd $REPOS/Samfundet'
alias samf4='cd $REPOS/Samfundet4'
alias rekenett='cd $REPOS/rekenett'
alias django="python -m pipenv run python manage.py"
alias makemigrations="python -m pipenv run python manage.py makemigrations"
alias migrate="python -m pipenv run python manage.py migrate"
alias mr="glab mr view --web"
alias reload="source ~/.bash_profile"
alias restart="sudo shutdown -r now"
alias xacceptlicense="sudo xcodebuild -license accept"
alias lid="ioreg -r -k AppleClamshellState -d 4 | grep AppleClamshellState | head -1" # Show lid state.
alias sleepnow="pmset sleepnow"
alias sn="sleepnow"
alias dspa="docker system prune -af --volumes"
alias iterm-scripts="code ~/Library/Application\ Support/iTerm2/Scripts"
alias is-home='[[ "$(git remote-url)" == "git@github.com:emilte/home.git" ]]'
alias is-samf4='[[ "$(git remote-url)" == "git@github.com:Samfundet/Samfundet4.git" ]]'
alias dw='cd "$REPOS"/spotify && pipenv run python discover_weekly.py && cd -' # Generate playlists for discover weekly in Spotify.
alias ncdu-home="ncdu ~ --exclude Projects --exclude Library --exclude .vscode" # Scan home dir.
alias screenshots="code ~/Documents/screenshots"
alias br="br --dates --hidden --git-ignored" # broot.
alias speedtest="cat ~/speedtest.py | python -" # Old: alias speedtest="curl https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python -"
alias sync-clock='sudo sntp -Ss time.apple.com'
alias mute="osascript -e 'set volume output muted true'"
alias volume0="osascript -e 'set Volume 0'"
alias nmr='. ~/.bash_scripts/nmr.sh'
alias meme='open "https://imgflip.com/memetemplates"'
alias brew-search='open "https://brew.sh"'

alias supercaffeinate="caffeinate -dimsu"
alias binary-ninja='open -a "Binary Ninja"'
alias idafree='open -a "ida64"'
alias chrome='open -a "Google Chrome"'

# https://ss64.com/osx/pmset.html
alias pmset-config="code /Library/Preferences/SystemConfiguration/com.apple.PowerManagement.plist"
alias pmset-list="code /Library/Preferences/SystemConfiguration/com.apple.AutoWake.plist" # Show pmset wake list.

alias cpu-temperature='sudo powermetrics --samplers smc || exit |grep -i "CPU die temperature"' # Monitor CPU temperature.

### Cleanup machine ###
# Use ncdu to locate large folders.
# See home directory
# See ~/Library/Caches
### End: Cleanup machine ###

# cache config
# npm config set cache "$HOME/Projects/.npm"
# yarn config set cacheFolder "$HOME/Projects/.yarn/cache"


# kubectl get -n feide-feide-kp pods

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
# shellcheck disable=SC1090
source ~/.bash_scripts/branchify.sh

function kp-kube-shell {
    kubectl -n feide-feide-kp exec "$1" -it -- sh
}

function gub {
    # git-update-branch
    # Rebase branch on master, push and return to previous branch.
    local branch_name
    branch_name="$1"
    branch_name=${branch_name:?}

    git co "$branch_name" && git prm && git fpush && git co -
}
