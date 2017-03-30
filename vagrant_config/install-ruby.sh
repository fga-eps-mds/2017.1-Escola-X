#!/usr/bin/env bash


source /usr/local/rvm/scripts/rvm || source /etc/profile.d/rvm.sh

rvm use --default --install $1

shift

if (( $# ))
then gem install $@
fi

rvm cleanup all
