if [[ "$PATH" != *"/usr/local/mips-2012.09/bin"* ]]; then
	export PATH="/usr/local/mips-2012.09/bin:$PATH"
fi

CROSS_COMPILE=mips-linux-gnu- ./Configure linux-mipsel32 shared zlib-dynamic
make

