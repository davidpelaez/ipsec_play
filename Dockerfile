FROM cpuguy83/ubuntu

RUN apt-get update

# Libreswan dependencies
#RUN apt-get install -y libnss3-dev libnspr4-dev pkg-config libpam-dev \
#	libcap-ng-dev libcap-ng-utils libselinux-dev \
#	libcurl4-nss-dev libgmp3-dev flex bison gcc make \
#	libunbound-dev git

#RUN git clone https://github.com/libreswan/libreswan.git /root/libreswan_src

#WORKDIR /root/libreswan_src

#RUN make programs
#RUN make install

RUN apt-get install -y openswan
RUN rm -R /etc/ipsec.d
RUN rm /etc/ipsec.conf

ADD ipsec.conf /etc/ipsec.conf
ADD ipsec.secrets /etc/ipsec.secrets

EXPOSE 500

# turn on the connection named VPN
#ENTRYPOINT ["/bin/bash"]