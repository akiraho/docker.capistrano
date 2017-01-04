FROM akiraho/ubuntu:16.04

# capistrano
RUN export RUBY_VERSION=ruby-2.3.3 && \
    export RUBY_GEMSET=app && \
    export CAPISTRANO_VERSION=3.7.1 && \
    export CAPPER_VERSION=2.0.0 && \
    echo ========== && \
    echo RUBY_VERSION=$RUBY_VERSION && \
    echo RUBY_GEMSET=$RUBY_GEMSET && \
    echo CAPISTRANO_VERSION=$CAPISTRANO_VERSION && \
    echo CAPPER_VERSION=$CAPPER_VERSION && \
    echo ========== && \
    curl -sSL https://rvm.io/mpapis.asc | gpg --import - && \
    curl -sSL https://get.rvm.io | bash -s stable && \
    bash -lc ' \
      rvm install $RUBY_VERSION@$RUBY_GEMSET --create && \
      gem update --system && \
      gem install bundle && \
      gem install capistrano -v $CAPISTRANO_VERSION && \
      gem install capper -v $CAPPER_VERSION \
    '
