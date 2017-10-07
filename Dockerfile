FROM centos/perl-524-centos7:latest

RUN yum -y update && yum install -y perl perl-CPAN bzip2 xdelta3 gmp-devel openssl-devel gcc 

RUN groupadd lbc
RUN useradd -r -u 1001 -g lbc lbc

#RUN chown lbc:lbc /home/lbc/collider
RUN mkdir -p /home/lbc
RUN chown lbc:lbc /home/lbc


RUN perl -MCPAN -Mlocal::lib=~/perl5 -e 'my $c = "CPAN::HandleConfig"; $c->load(doit => 1, autoconfig => 1); $c->edit(prerequisites_policy => "follow"); $c->edit(build_requires_install_policy => "yes"); $c->commit'
RUN cpan install Test::More
RUN cpan install Digest::MD5
RUN cpan install Net::IDN::Encode
RUN cpan install HTTP::Headers


USER lbc:lbc
RUN mkdir -p /home/lbc/collider
RUN cpan install Digest::MD5

WORKDIR /home/lbc/collider

RUN curl -o LBC https://lbc.cryptoguru.org/static/client/LBC

RUN cpan install Net::IDN::Encode

RUN ["perl","LBC","-h"]

RUN ["perl","LBC", "-x"]



