FROM ubuntu

# Install dependencies
RUN apt-get update -y && \
  apt-get install -y git golang ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl doxygen

# Install neovim
WORKDIR /tmp
RUN git clone https://github.com/neovim/neovim
WORKDIR /tmp/neovim
RUN make CMAKE_BUILD_TYPE=Release
RUN make install

# Deploy configuration
COPY . /root/.config/nvim

# Finish
WORKDIR /root/.config/nvim
