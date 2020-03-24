#!/usr/bin/env bash
pushd `dirname $0` > /dev/null

echo Building module
cd src/module 
make $1

echo Building userpace tools
cd ../
make $1

popd > /dev/null