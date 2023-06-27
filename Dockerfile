FROM ubuntu:20.04
MAINTAINER docker@ipepe.pl

ENV DEBIAN_FRONTEND=noninteractive LANG=en_US.UTF-8 LANGUAGE=en_US:en LC_ALL=en_US.UTF-8
RUN apt-get update && apt-get upgrade -y && apt-get install -y locales && \
    localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8 && \
    echo 'LANG="en_US.UTF-8"' > /etc/default/locale && \
    echo 'LANGUAGE="en_US:en"' >> /etc/default/locale && \
    apt-get install --no-install-recommends -y \
    git ca-certificates curl netbase wget \
    make gcc libssl-dev libreadline-dev zlib1g-dev autoconf bison \
    build-essential libyaml-dev libreadline-dev libncurses5-dev libffi-dev libgdbm-dev \
    nano htop git curl cron gosu psmisc \
    imagemagick \
    shared-mime-info \
    dirmngr gnupg \
    apt-transport-https \
    openssl libssl-dev libreadline-dev make gcc \
    zlib1g-dev bzip2 software-properties-common \
    postgresql-client g++ openssl libssl-dev libpq-dev  \
    gnupg dirmngr && \
    rm -rf /var/lib/apt/lists/* && \
    git clone https://github.com/rbenv/ruby-build.git /tmp/ruby-build && \
    bash /tmp/ruby-build/install.sh && \
    rm -rf /tmp/ruby-build && \
    apt-get clean && rm -rf  /tmp/* /var/tmp/*
ENV GEM_HOME=/usr/local/bundle
ENV BUNDLE_PATH=/usr/local/bundle BUNDLE_SILENCE_ROOT_WARNING=1 BUNDLE_APP_CONFIG=/usr/local/bundle
ENV PATH=/usr/local/bundle/bin:/usr/local/bundle/gems/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

ARG RUBY_VERSION=2.3.1
ARG RUBY_MAJOR=2.3

RUN mkdir -p /usr/local/etc  && {   echo 'install: --no-document';   echo 'update: --no-document';  } >> /usr/local/etc/gemrc && \
    mkdir -p "$GEM_HOME" && chmod 777 "$GEM_HOME" && \
    ruby-build $RUBY_VERSION /tmp/built-ruby && \
    cp /tmp/built-ruby/bin/ruby /usr/local/bin/ruby && \
    cp /tmp/built-ruby/bin/gem /usr/local/bin/gem && \
    cp /tmp/built-ruby/bin/irb /usr/local/bin/irb

CMD ["irb"]
