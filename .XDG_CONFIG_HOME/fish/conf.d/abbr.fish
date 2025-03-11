#!/bin/env bash

# Wrap all commands in single quotes ''.
# It prevents variable expansion.

# Classics:
abbr la 'ls -lAh' # ls (but everything).
abbr .. 'cd ..'
abbr ... 'cd ../..'
abbr grep 'grep --color=auto' # Add colors to grep.
abbr projects 'echo $PROJECTS_HOME'
abbr repos 'cd $REPOS'
abbr mkdir 'mkdir -pv'
abbr mv 'mv -iv' # Confirmation of overwrite and create missing intermediate dirs.
abbr cp 'cp -i' # Confirmation of overwrite.
abbr ln 'ln -i' # Confirmation of overwrite.
abbr cls 'clear'
abbr today 'date +"%d.%m.%Y"'
abbr now 'date +"%d.%m.%Y %H:%M:%S"'
abbr h 'home'

# Other:
abbr downloads 'code $HOME/Downloads'
# abbr code 'open -b com.microsoft.VSCode' # Open VSCode.
abbr meme 'open "https://imgflip.com/memetemplates"'
abbr gn 'sleep 5000 && sn' # Good night, sleep well.
abbr home 'code ~'
abbr notes 'code $REPOS/notes'
abbr django 'python -m pipenv run python manage.py'
abbr makemigrations 'python -m pipenv run python manage.py makemigrations'
abbr intellij 'open -a "IntelliJ IDEA"'
abbr migrate 'python -m pipenv run python manage.py migrate'
abbr reload 'source $FISH_CONFIG_FILE' # Reload shell environment.
abbr restart 'sudo shutdown -r now' # Reboot machine.
abbr iterm-scripts 'code ~/Library/Application\ Support/iTerm2/Scripts'
abbr dw 'cd $REPOS/spotify && pipenv run python discover_weekly.py && cd -' # Generate playlists for discover weekly in Spotify.
abbr ncdu-home 'ncdu ~ --exclude Projects --exclude Library --exclude .vscode' # Scan home dir.
abbr screenshots 'code ~/Pictures/screenshots' # Cmd + Shift + 5 -> Options
abbr br 'br --dates --hidden --git-ignored' # broot.
abbr speedtest 'cat ~/speedtest.py | python -' # Old: abbr speedtest="curl https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python -"
abbr supercaffeinate 'caffeinate -dimsu' # When you want the Mac screen to remain on.
abbr safemail 'cd $REPOS/chrome-extension-safemail && code .'
abbr reset-alttab 'defaults delete com.lwouis.alt-tab-macos' # https://github.com/lwouis/alt-tab-macos/issues/3653
# abbr chrome='open -a "Google Chrome"'
# abbr chrome='open /Applications/Google\ Chrome.app' # --args --new-window --disable-dark-mode'


# Docker:
abbr d 'docker'
abbr dc 'docker-compose'
abbr dcb 'dc build'
abbr dcu 'dc up --remove-orphans'
abbr dcbu 'dcb; dcu'
abbr dcua 'dcu app'
abbr dcbua 'dcb; dcu app'
abbr dcra 'dc restart app'
abbr dcbb 'dcb backend'
abbr dcub 'dcu backend'
abbr dcbub 'dcbb; dcub'
abbr dspa 'docker system prune -af --volumes' # Completely clean docker caches.

# git:
abbr pr 'gh pr view --web' # This overrides `print files` command.
abbr repo 'git repo' # Open repository in browser.
abbr nmr '. ~/.bash_scripts/nmr.sh'
abbr npr '. ~/.bash_scripts/npr.sh'
abbr gub '. ~/.bash_scripts/gub.sh'
abbr branchify '. ~/.bash_scripts/branchify.sh'
# abbr is-home '[ (git remote-url 2>/dev/null || echo "unknown") = git@github.com:emilte/home.git ]'
abbr mr 'glab mr view --web' # Open current MR in GitLab.


# MG::Web
abbr samf 'cd $REPOS/Samfundet'
abbr samf4 'cd $REPOS/Samfundet4'
abbr rekenett 'cd $REPOS/rekenett'
abbr is-samf4 '[ (git remote-url) = git@github.com:Samfundet/Samfundet4.git ]'

# Bekk
abbr skjer 'open "https://skjer.bekk.no/events?Oslo=0&trondheim=1&kommende=1&internt=1&filter=0&eksternt=1"'

# Brew:
abbr binary-ninja 'open -a "Binary Ninja"'
abbr idafree 'open -a "ida64"'
abbr brew-outdated-casks 'brew outdated --greedy'
abbr brew-search 'open "https://brew.sh"'
abbr brew-up 'sudo echo || perm; brew update && brew upgrade && brew cleanup'

# Mac:
# https://ss64.com/osx/pmset.html
abbr xacceptlicense 'sudo xcodebuild -license accept'
abbr cpu-temperature 'sudo powermetrics --samplers smc || exit |grep -i "CPU die temperature"' # Monitor CPU temperature.
abbr pmset-config 'code /Library/Preferences/SystemConfiguration/com.apple.PowerManagement.plist'
abbr pmset-list 'code /Library/Preferences/SystemConfiguration/com.apple.AutoWake.plist' # Show pmset wake list.
abbr lid 'ioreg -r -k AppleClamshellState -d 4 | grep AppleClamshellState | head -1' # Show lid state.
abbr sync-clock 'sudo sntp -Ss time.apple.com'
abbr mute 'osascript -e "set volume output muted true"'
abbr volume0 "osascript -e 'set Volume 0'" # Set volume to 0 on Mac.
abbr bluetooth-off 'blueutil -p 0'
abbr sn 'bluetooth-off; pmset sleepnow' # Send machine to sleep.
abbr perm 'open -a Privileges'


# Java:
abbr java8 'export JAVA_HOME=$(/usr/libexec/java_home -v1.8); echo JAVA_HOME=$JAVA_HOME; echo $(java -version)'
abbr java11 'export JAVA_HOME=$(/usr/libexec/java_home -v11); echo JAVA_HOME=$JAVA_HOME; echo $(java -version)'
abbr java17 'export JAVA_HOME=$(/usr/libexec/java_home -v17); echo JAVA_HOME=$JAVA_HOME; echo $(java -version)'
abbr java18 'export JAVA_HOME=$(/usr/libexec/java_home -v18); echo JAVA_HOME=$JAVA_HOME; echo $(java -version)'
abbr java19 'export JAVA_HOME=$(/usr/libexec/java_home -v19); echo JAVA_HOME=$JAVA_HOME; echo $(java -version)'
abbr java21 'export JAVA_HOME=$(/usr/libexec/java_home -v21); echo JAVA_HOME=$JAVA_HOME; echo $(java -version)'

# Android:
abbr sdkmanager '$ANDROID_HOME/cmdline-tools/latest/bin/sdkmanager'
abbr adb '$ANDROID_HOME/platform-tools/adb'



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

