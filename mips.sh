#!/bin/bash

if [[ "$PATH" != *"/usr/local/mips-2012.09/bin"* ]]; then
	export PATH="/usr/local/mips-2012.09/bin:$PATH"
fi

SYSROOT_DIR="`pwd`/sysroot"
PREFIX="/usr"

CROSS_COMPILE=mips-linux-gnu- ./Configure zlib-dynamic --prefix="${PREFIX}" --install_prefix="${SYSROOT_DIR}" linux-mipsel32 shared
make
make install

cd cacerts
curl http://mxr.mozilla.org/mozilla/source/security/nss/lib/ckfw/builtins/certdata.txt?raw=1 -L -o certdata.txt
./make-ca.sh
./remove-expired-certs.sh certs
cp certs/*.pem ${SYSROOT_DIR}${PREFIX}/ssl/certs
${SYSROOT_DIR}${PREFIX}/bin/./c_rehash ${SYSROOT_DIR}${PREFIX}/ssl/certs
install BLFS-ca-bundle*.crt ${SYSROOT_DIR}${PREFIX}/ssl/certs/ca-bundle.crt
rm -rf certs BLFS-ca-bundle* certdata.txt

