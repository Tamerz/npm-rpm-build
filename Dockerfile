FROM centos:7

ARG NODE_VERSION=10.16.3

RUN yum makecache fast && \
    yum install -y \
      ruby-devel \
      gcc \
      make \
      rpm-build \
      rubygems \
      wget && \
    gem install --no-ri --no-rdoc fpm

RUN wget "https://nodejs.org/dist/v${NODE_VERSION}/node-v${NODE_VERSION}-linux-x64.tar.xz" && \
    tar --strip-components 1 -xf node-v${NODE_VERSION}-linux-x64.tar.xz -C /usr/local && \
    rm node-v${NODE_VERSION}-linux-x64.tar.xz

