LABEL org.opencontainers.image.source="https://github.com/muphix/centos-bootc"

FROM quay.io/centos-bootc/centos-bootc:stream10

RUN dnf -y install \
      vim \
      tmux \
      podman \
    && dnf clean all

RUN bootc container lint --fatal-warnings
