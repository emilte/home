#! /bin/bash

alias la="ls -la" # ls (but everything).
alias ..="cd .."
alias ...="cd ../.."
alias grep="grep --color=auto" # Add colors to grep.
alias projects="cd ~/my-projects"
alias dc="docker compose"
alias feide="cd ~/my-projects/feide-kp"
alias staging="open https://feide-kp-staging.paas2.uninett.no/"
alias prod="open https://kunde.feide.no/"
alias sentry="open https://sentry.feide.no/organizations/feide/issues/?environment=production&project=2&query=is%3Aunresolved&referrer=issue-list&statsPeriod=14d"
alias chromatic="open https://www.chromatic.com/library?appId=6183ad02fa0207003a95f45f"
alias board="open https://gitlab.sikt.no/feide/feide-kp/-/boards/78"
alias samf="cd ~/my-projects/Samfundet"
alias rekenett="cd ~/my-projects/rekenett"
alias samf4="cd ~/my-projects/Samfundet4"
alias django="python -m pipenv run python manage.py"
alias makemigrations="python -m pipenv run python manage.py makemigrations"
alias migrate="python -m pipenv run python manage.py migrate"
alias mr="glab mr view --web"
alias reload="source ~/.bash_profile"
alias restart="sudo shutdown -r now"
alias xacceptlicense="sudo xcodebuild -license accept"