FROM sherwind/centos-buildpack-deps:centos7
MAINTAINER Sherwin Daganato <sherwin@daganato.com>

RUN yum -y update && yum clean all
RUN yum -y install perl perl-core && yum clean all
RUN curl -L https://raw.githubusercontent.com/miyagawa/cpanminus/master/cpanm | perl - App::cpanminus \
    && cpanm Carton \
    && rm -rf /root/.cpanm

CMD [ "perl", "-de0" ]

RUN yum install -y perl perl-CPAN bzip2 xdelta3 gmp-devel openssl-devel gcc 

RUN groupadd lbc
RUN useradd -r -u 1001 -g lbc lbc

#RUN chown lbc:lbc /home/lbc/collider
RUN mkdir -p /home/lbc
RUN chown lbc:lbc /home/lbc


RUN perl -MCPAN -Mlocal::lib=~/perl5 -e 'my $c = "CPAN::HandleConfig"; $c->load(doit => 1, autoconfig => 1); $c->edit(prerequisites_policy => "follow"); $c->edit(build_requires_install_policy => "yes"); $c->commit'
#RUN cpan install Test::More
#RUN cpan install Digest::MD5
#RUN cpan install Net::IDN::Encode
#RUN cpan install HTTP::Headers


#USER lbc:lbc
#RUN mkdir -p /home/lbc/collider

#WORKDIR /home/lbc/collider

#RUN curl -o LBC https://lbc.cryptoguru.org/static/client/LBC

#RUN cpan install HTTP::Negotiate &&\
#  cpan install LWP::UserAgent &&\
#  cpan install Parallel::ForkManager &&\
#  cpan install Net::SSLeay

RUN cpan install LWP::UserAgent


#RUN ["perl","LBC","-h"]

#RUN ["perl","LBC", "-x"]



