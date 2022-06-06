# FROM ubuntu
FROM ubuntu:latest

# Update Ubuntu Software repository
RUN apt update -y
RUN apt upgrade -y
RUN apt install git curl build-essential -y

ENV PWD=/app
WORKDIR ${PWD}

COPY .configure_bash.sh .configure_bash.sh

# RUN chmod +rwx .configure_bash.sh 

# RUN bash .configure_bash.sh n
# CMD [".configure_bash.sh" "n"]
# ENTRYPOINT [ "./.configure_bash.sh" ]


# RUN echo 'echo Sourcing .bash_profile ' >> $HOME/.bash_profile
# RUN echo 'echo Sourcing .profile ' >> $HOME/.profile
# RUN echo 'echo Sourcing .bashrc ' >> $HOME/.bashrc

# SHELL ["/bin/bash", "-c"]

# install packages
# RUN apt update -y
# RUN apt upgrade -y
# RUN apt install git curl build-essential -y

# install brew
# RUN echo | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# RUN curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh
# RUN echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> $HOME/.bash_profile
# RUN eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
# RUN brew doctor

# https://stackoverflow.com/questions/57703320/install-homebrew-using-dockerfile

# RUN git clone https://github.com/Homebrew/brew ~/.linuxbrew/Homebrew \
#     && mkdir ~/.linuxbrew/bin \
#     && ln -s ~/.linuxbrew/Homebrew/bin/brew ~/.linuxbrew/bin \
#     && echo 'eval $(~/.linuxbrew/bin/brew shellenv)' >> ~/.bashrc \
#     && eval $(~/.linuxbrew/bin/brew shellenv)
# && brew install gcc


# recommended by brew
# RUN brew install gcc

# ENTRYPOINT [ "sh", "setup.sh" ]
# ENTRYPOINT ./setup.sh
# ENTRYPOINT sh setup.sh
# CMD [ "sh", "setup.sh" ]
