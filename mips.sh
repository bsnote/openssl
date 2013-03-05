if [[ "$PATH" != *"/usr/local/mips-2012.09/bin"* ]]; then
	export PATH="/usr/local/mips-2012.09/bin:$PATH"
fi

export AR="mips-linux-gnu-ar"
export CC="mips-linux-gnu-gcc -EL"
export CXX="mips-linux-gnu-g++ -EL"
export LINK="mips-linux-gnu-g++ -EL"
export NM="mips-linux-gnu-nm"
export RANLIB="mips-linux-gnu-ranlib"
export CFLAGS="-mips32r2"
export CXXFLAGS="-mips32r2"
export LDFLAGS="-mips32r2"

./Configure linux-mips32 shared
make

