if [[ "$PATH" != *"/usr/local/mips-2012.09/bin"* ]]; then
	export PATH="/usr/local/mips-2012.09/bin:$PATH"
fi

export AR="mips-linux-gnu-ar"
export CC="mips-linux-gnu-gcc -EL"
export CXX="mips-linux-gnu-g++ -EL"
export CFLAGS="-march=mips32r2"
export CXXFLAGS="-march=mips32r2"
export LINK="mips-linux-gnu-g++ -EL"
export LDFLAGS="-march=mips32r2"

./Configure linux-mips32 shared
make

