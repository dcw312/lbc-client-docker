FROM ubuntu:zesty-20170915

RUN apt-get -y update

RUN apt-get -y install libcpandb-perl binutils-doc cpp-doc gcc-5-locales gcc-multilib make autoconf automake libtool flex bison gdb gcc-doc gcc-5-multilib gcc-5-doc libgcc1-dbg libgomp1-dbg libitm1-dbg libatomic1-dbg libasan2-dbg liblsan0-dbg libtsan0-dbg libssl-dev

RUN apt-get -y install curl

COPY MyConfig.pm /root/.local/share/.cpan/CPAN/MyConfig.pm

RUN cpan install JSON \
    && cpan install LWP::UserAgent \
    && cpan install Net::SSLeay \
    && cpan install LWP::Protocol::https \
    && cpan install Parallel::ForkManager \
    && cpan install Term::ReadKey

RUN apt-get -y install ocl-icd-libopencl1

RUN groupadd lbc && useradd lbc -g lbc && mkdir -p /home/lbc && chown lbc:lbc /home/lbc
