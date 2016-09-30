#!/bin/bash
VERSION=2.2.3
git clone https://github.com/nextcloud/client_theming.git 
cd client_theming
git checkout -b newrelease$VERSION v$VERSION
git submodule update --init --recursive
git archive --prefix=nextcloud-client-$VERSION/ HEAD > ../nextcloud-client-$VERSION.tar
cd client 
git archive --prefix=nextcloud-client-$VERSION/client/ HEAD > ../../tmp.tar
cd ..
tar --concatenate --file=../nextcloud-client-$VERSION.tar ../tmp.tar
rm -f  ../tmp.tar
gzip ../nextcloud-client-$VERSION.tar
