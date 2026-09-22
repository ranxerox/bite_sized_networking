# Forked from justanotherdot/Dockerfile.bite_sized_networking
# N.B. The only tool missing here that is mentioned in the document is `zenmap`
# purely because this image is intended to be run via a CLI and `zenmap` is a GUI
# to `nmap` i.e. one can play around with the tools by running:
#
# $ make
# 
# so it creates an image and put it into you docker repo (edit Makefile and add yours)
# 
# How to use it?
# 
# best solution is to create an alias:
# 
# $ alias nt='docker run --rm --name nt --net host -it -v ~/.volumes:/app agustincito/bite_size_networking'
# 
# then you can either enter to the container:
# $ nt
# root@laptop:/# curl example.com
# 
# or just type the desired command as a parameter:
# $ nt curl example.com
#
# One can also run this image on a docker network to capture packets and so
# forth for debugging purposes. Once you've found the tooling that best suits
# your needs, it may make sense to make a slimmed down version of this
# Dockerfile and, if wireguard isn't needed, base this image off
# `debian:stable` instead.
#
# Lastly, you can purchase Bite Size Networking or Julia's other fantastic
# zines over at https://wizardzines.com/

# We use `unstable` here since we install `wireguard` below
FROM debian:unstable
RUN apt update && \
      DEBIAN_FRONTEND=noninteractive apt install -y \
        dnsutils \
        curl \
        nmap \
        tcpdump \
        ngrep \
        mitmproxy \
        iptables \
        ethtool \
        stunnel \
        hping3 \
        lsof \
        ipcalc \
        p0f \
        iperf \
        apache2-utils \
        wget \
        python3 \
        iftop \
        nethogs \
        iptraf \
        httpie \
        nload \
        aria2 \
        nftables \
        tcpflow \
        telnet \
        openvpn \
        links \
        wireguard \
        tshark \
        netcat-openbsd \
        miniupnpc