#!/usr/bin/env bash

if [ -f /etc/sphinx/build ]; then
    rm -rf /var/lib/sphinx/*
    rm -f /etc/sphinx/build
fi

searchd -c /etc/sphinx/sphinx.conf --nodetach "@"