#!/bin/sh
script_dir=$(dirname $0)
dest="${script_dir}/target/repo"
mkdir -p $dest/binary
cp ${script_dir}/target/classes/*.deb $dest
( cd $dest && dpkg-scanpackages binary /dev/null | gzip -9c > binary/Packages.gz )
s3cmd put --recursive $dest s3://debian.us-east.neo4j.org
