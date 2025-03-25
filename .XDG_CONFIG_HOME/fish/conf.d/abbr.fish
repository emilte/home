#!/bin/env bash

# All entries should refrain from using dash.

# Wrap all commands in single quotes ''.
# It prevents variable expansion.

# alias is just a wrapper for functions, and possibly slower.
# Rewrite to lazy-loaded function files or abbr.

# Classics:
alias la 'ls -lAh' # ls (but everything).
alias grep 'grep --color=auto' # Add colors to grep.
alias mkdir 'mkdir -pv'
alias mv 'mv -iv' # Confirmation of overwrite and create missing intermediate dirs.
alias cp 'cp -i' # Confirmation of overwrite.
alias ln 'ln -i' # Confirmation of overwrite.
alias today 'date +"%d.%m.%Y"'
alias now 'date +"%d.%m.%Y %H:%M:%S"'
abbr .. 'cd ..'
abbr ... 'cd ../..'
abbr cls 'clear'
abbr projects 'echo $PROJECTS_HOME'
abbr repos 'cd $REPOS'

# Other:
alias meme 'open "https://imgflip.com/memetemplates"'
alias gn 'sleep 5000 && sn'  # Good night, sleep well.
alias home 'code ~'
alias notes 'code $REPOS/notes'
alias django 'python -m pipenv run python manage.py'
alias makemigrations 'python -m pipenv run python manage.py makemigrations'
alias intellij 'open -a "IntelliJ IDEA"'
alias migrate 'python -m pipenv run python manage.py migrate'
alias reload 'fish' # reload; 			source $FISH_CONFIG_FILE' # Reload shell environment.
alias restart 'sudo shutdown -r now' # Reboot machine.
alias dw 'cd $REPOS/spotify && pipenv run python discover_weekly.py && cd -' # Generate playlists for discover weekly in Spotify.
alias ncdu_home 'ncdu ~ --exclude Projects --exclude Library --exclude .vscode' # Scan home dir.
alias screenshots 'code ~/Pictures/screenshots' # Cmd + Shift + 5 -> Options
alias br 'br --dates --hidden --git-ignored' # broot.
alias speedtest 'cat ~/speedtest.py | python -' # Old: alias speedtest 'curl https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python -"
alias safemail 'cd $REPOS/chrome-extension-safemail && code .'
alias reset_alttab 'defaults delete com.lwouis.alt-tab-macos' # https://github.com/lwouis/alt-tab-macos/issues/3653
abbr downloads 'code $HOME/Downloads'
abbr h 'home'
abbr supercaffeinate 'caffeinate -dimsu' # When you want the Mac screen to remain on.
abbr iterm_scripts 'code ~/Library/Application\ Support/iTerm2/Scripts'
# abbr code 'open -b com.microsoft.VSCode' # Open VSCode.
# alias chrome 'open -a "Google Chrome"'
# alias chrome 'open /Applications/Google\ Chrome.app' # --args --new-window --disable-dark-mode'


# Docker:
alias d 	'docker'
alias dc 	'docker-compose'
alias dcb 	'dc build'
alias dcu 	'dc up --remove-orphans'
alias dcua 	'dcu app'
alias dcbua 'dcbu app'
alias dcra 	'dc restart app'
alias dcbb 	'dcb backend'
alias dcub 	'dcu backend'
alias dce 	'dc exec'
alias dcr 	'dc run'
alias dcbub 'dcbu backend'
alias dspa 	'docker system prune -af --volumes' # Completely clean docker caches.

# git:
alias pr   'gh pr view --web' # This overrides `print files` command.
alias mr   'glab mr view --web' # Open current MR in GitLab.
alias repo 'git repo' # Open repository in browser.

# MG::Web
alias samf     'cd $REPOS/Samfundet'
alias samf4    'cd $REPOS/Samfundet4'
alias rekenett 'cd $REPOS/rekenett'
alias is_samf4 '[ (git remote-url) = git@github.com:Samfundet/Samfundet4.git ]'

# Bekk
alias skjer 'open "https://skjer.bekk.no/events?Oslo=0&trondheim=1&kommende=1&internt=1&filter=0&eksternt=1"'

# Brew:
alias binary-ninja 'open -a "Binary Ninja"'
alias idafree 'open -a "ida64"'
alias brew_outdated_casks 'brew outdated --greedy'
alias brew_search 'open "https://brew.sh"'
alias brew_up 'sudo echo || perm; brew update && brew upgrade && brew cleanup'


# Mac:
# https://ss64.com/osx/pmset.html
alias sn 'bluetooth-off; pmset sleepnow' # Send machine to sleep.
alias xacceptlicense 'sudo xcodebuild -license accept'
alias cpu-temperature 'sudo powermetrics --samplers smc || exit |grep -i "CPU die temperature"' # Monitor CPU temperature.
alias pmset-config 'code /Library/Preferences/SystemConfiguration/com.apple.PowerManagement.plist'
alias pmset-list 'code /Library/Preferences/SystemConfiguration/com.apple.AutoWake.plist' # Show pmset wake list.
alias lid 'ioreg -r -k AppleClamshellState -d 4 | grep AppleClamshellState | head -1' # Show lid state.
alias sync-clock 'sudo sntp -Ss time.apple.com'
alias mute 'osascript -e "set volume output muted true"'
alias volume0 "osascript -e 'set Volume 0'" # Set volume to 0 on Mac.
alias bluetooth-off 'blueutil -p 0'
alias perm 'open -a Privileges'
alias permcli '/Applications/Privileges.app/Contents/Resources/PrivilegesCLI'


# Java:
alias java8  'export JAVA_HOME=$(/usr/libexec/java_home -v1.8); echo JAVA_HOME=$JAVA_HOME; echo $(java -version)'
alias java11 'export JAVA_HOME=$(/usr/libexec/java_home -v11); echo JAVA_HOME=$JAVA_HOME; echo $(java -version)'
alias java17 'export JAVA_HOME=$(/usr/libexec/java_home -v17); echo JAVA_HOME=$JAVA_HOME; echo $(java -version)'
alias java18 'export JAVA_HOME=$(/usr/libexec/java_home -v18); echo JAVA_HOME=$JAVA_HOME; echo $(java -version)'
alias java19 'export JAVA_HOME=$(/usr/libexec/java_home -v19); echo JAVA_HOME=$JAVA_HOME; echo $(java -version)'
alias java21 'export JAVA_HOME=$(/usr/libexec/java_home -v21); echo JAVA_HOME=$JAVA_HOME; echo $(java -version)'

# Android:
alias sdkmanager '$ANDROID_HOME/cmdline-tools/latest/bin/sdkmanager'
alias adb '$ANDROID_HOME/platform-tools/adb'



#########################################
#               Archive
#########################################

# Kundeportalen:
# abbr kpdjango "dc run app python manage.py"
# abbr kpsync "pipenv run pipenv:sync; pnpm -w install"
# abbr kpup "pipenv run pipenv:update; pnpm -w run update"
# abbr kp-gen-routes "django generate_routes"
# abbr kp-gen-perms "kpdjango generate_permissions"
# abbr kpgen "makemigrations; kp-gen-routes; kp-gen-perms; ./maketypes.sh;"
# abbr feide 'cd $REPOS/feide-kp'
# abbr paas "open 'https://console.paas2.uninett.no/kubeconfig/'"
# abbr kp-deployments "kubectl -n feide-feide-kp get deployments --sort-by=.metadata.creationTimestamp"
# abbr kp-kube="kubectl -n feide-feide-kp" # <name>
# abbr kp-pods="kp-kube get pods --show-labels"
# abbr kp-logs="kp-kube logs" # <name>
# abbr dptest="open 'https://dashboard.dataporten-test.uninett.no/#!/fc:org:sikt.no'"
# abbr prod-terminal="open 'https://gitlab.sikt.no/feide/feide-kp/-/environments/189/terminal'"
# abbr staging-terminal="open 'https://gitlab.sikt.no/feide/feide-kp/-/environments/188/terminal'"
# abbr kp-rollestyring="open 'https://feide-kp-review-2359-test-tav533.paas2.uninett.no/org/2217476/start/'"
# abbr kp-emulated="open 'https://feide-kp-review-3299-emule-cj8bdj.paas2.uninett.no/org/2217476/start/'"
# abbr staging="open 'https://feide-kp-staging.paas2.uninett.no/'"
# abbr sentry="open 'https://sentry.feide.no/organizations/feide/issues/?environment=production&project=2&query=is%3Aunresolved&referrer=issue-list&statsPeriod=14d'"
# abbr chromatic="open 'https://www.chromatic.com/library?appId=6183ad02fa0207003a95f45f'"
# abbr board="open 'https://gitlab.sikt.no/feide/feide-kp/-/boards/768'" # kp-team
# abbr rboard="open 'https://gitlab.sikt.no/feide/feide-kp/-/boards/637'" # Rollestyring
# abbr myboard="open 'https://gitlab.sikt.no/feide/feide-kp/-/boards/798'" # kp-team + emilte
# abbr is-kp='[[ "$(git remote-url)" == "git@gitlab.sikt.no:feide/feide-kp.git" ]]'
# abbr kp-passed-master-pipelines="open 'https://gitlab.sikt.no/feide/feide-kp/-/pipelines?page=1&scope=all&ref=master&status=success'"
# function kp-kube-shell {
#     kubectl -n feide-feide-kp exec "$1" -it -- sh
# }

# Aneo:
# abbr aneo='cd $REPOS/aneo-common-web'
# abbr aneo-start='aneo && pnpm i && pnpm run dev'
# abbr aneo-start='aneo && cd apps/web && pnpm i && pnpm run dev'
# abbr aneo-design='cd $REPOS/aneo-designsystem'
# abbr aneo-design-start='aneo-design && pnpm i && pnpm run dev'
# abbr prod="open 'https://aneo-common-web.vercel.app/nb-NO'"
# abbr board="open 'https://app.asana.com/0/1208540119714729/1208549035714041'"
# abbr asana="board"
# abbr anup="pipenv run pipenv:update; pnpm -w run update"


#########################################
#             Random scrap
#########################################


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

