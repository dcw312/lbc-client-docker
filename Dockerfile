FROM base/archlinux

RUN pacman --noconfirm -Syu

RUN useradd lbc -g users

RUN mkdir -p /home/lbc && chown lbc:users /home/lbc

USER lbc

RUN mkdir /home/lbc/collider
WORKDIR /home/lbc/collider

RUN curl -o LBC https://lbc.cryptoguru.org/static/client/LBC

RUN ["perl","LBC","-h"]
