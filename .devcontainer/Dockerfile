FROM ubuntu:20.04

RUN apt update

RUN apt upgrade -y

RUN apt-get install software-properties-common -y

RUN apt-add-repository ppa:swi-prolog/stable -y

RUN apt-get update

RUN apt-get install swi-prolog -y