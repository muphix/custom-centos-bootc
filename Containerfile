FROM quay.io/centos-bootc/centos-bootc:stream10
LABEL org.opencontainers.image.source="https://github.com/muphix/centos-bootc"

RUN dnf -y install \
      vim \
      tmux \
      podman \
    && dnf clean all

RUN rm -rf \
      /var/cache/dnf \
      /var/cache/ldconfig/aux-cache \
      /var/lib/dnf \
      /var/lib/rhsm \
      /run/rhsm

RUN rm -f \
    /var/roothome/.viminfo \
    /var/roothome/buildinfo/content-sets.json \
    /var/log/dnf.log \
    /var/log/dnf.rpm.log \
    /var/log/dnf.librepo.log \
    /var/log/hawkey.log \
    /var/log/rhsm/rhsm.log

RUN bootc container lint --no-truncate --fatal-warnings
