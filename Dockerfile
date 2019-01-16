FROM ubuntu:18.04
RUN apt-get update -qqy \
    && apt-get -qqy install wget git zsh make gcc sudo dh-autoreconf libxcb1-dev \
              libxcb-keysyms1-dev libpango1.0-dev \
              libxcb-util0-dev libxcb-icccm4-dev libyajl-dev \
              libstartup-notification0-dev libxcb-randr0-dev \
              libev-dev libxcb-cursor-dev libxcb-xinerama0-dev \
              libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev \
              libxcb-xrm0 libxcb-xrm-dev automake libxcb-shape0-dev \
              j4-dmenu-desktop gnome-terminal \
              cmake cmake-data libcairo2-dev libxcb1-dev libxcb-ewmh-dev libxcb-icccm4-dev libxcb-image0-dev libxcb-randr0-dev libxcb-util0-dev libxcb-xkb-dev pkg-config python-xcbgen xcb-proto libxcb-xrm-dev libasound2-dev libmpdclient-dev libiw-dev libcurl4-openssl-dev libpulse-dev libxcb-composite0-dev xcb libxcb-ewmh2

# Install i3wm-gaps
RUN cd /tmp/ \
    && git clone https://www.github.com/Airblader/i3 i3-gaps && cd i3-gaps \
    && autoreconf --force --install && mkdir -p build && cd build/ \
    && ../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers \
    && make && make install

# Install zsh

RUN wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh  && sh ./install.sh

RUN git clone https://github.com/jaagr/polybar.git && cd polybar && ./build.s git clone https://github.com/jaagr/polybar.git && cd polybar && ./build.sh 
ADD ./i3wm-config /etc/i3/config

CMD ["/usr/bin/i3"]
