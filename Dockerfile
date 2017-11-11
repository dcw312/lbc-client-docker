FROM dcw312/lbc-base:latest

COPY funds_h160.blf /home/lbc/funds_h160.blf

COPY entrypoint.sh /home/lbc/entrypoint.sh
COPY entrypoint.sh /home/lbc/register.sh
COPY hook-find /home/lbc/hook-find

RUN chown lbc:lbc /home/lbc/funds_h160.blf \
    && chown lbc:lbc /home/lbc/entrypoint.sh \
    && chmod +x /home/lbc/entrypoint.sh \
    && chown lbc:lbc /home/lbc/register.sh \
    && chmod +x /home/lbc/register.sh \
    && chown lbc:lbc /home/lbc/hook-find \
    && chmod +x /home/lbc/hook-find

USER lbc

WORKDIR /home/lbc

RUN curl -o LBC https://lbc.cryptoguru.org/static/client/LBC && chmod +x LBC

CMD ["/bin/sh","/home/lbc/entrypoint.sh"]

