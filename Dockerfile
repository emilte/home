FROM ubuntu:latest

# Update Ubuntu Software repository.
RUN apt update -y
RUN apt upgrade -y
RUN apt install git curl build-essential -y