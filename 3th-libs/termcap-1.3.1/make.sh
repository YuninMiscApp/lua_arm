#/bin/sh

if [ $# -lt 1 ];then
	echo "usage: $0 [all/clean/install]"
	exit 1
fi

#environment variable
compiler_setting()
{
	#command setting
	export prefix="/home/leon/arm/arm-hisiv300-linux"
	export CC="arm-hisiv300-linux-gcc"
	export AR="arm-hisiv300-linux-ar"
	export RANLIB="arm-hisiv300-linux-ranlib"
	#options setting
	export CFLAGS="-g"
}

#do make
do_make()
{
	if [ "$1" == "clean" ] ;then
		echo "make clean"
		make clean
	elif [ "$1" == "all" ] ;then
		echo "compiler setting now..."
		compiler_setting
		echo "make all"
		make		
	elif [ "$1" == "install" ] ;then
		echo "compiler setting now..."
		compiler_setting
		echo "make install"
		make install
	else
		echo "unknow command"
	fi
}

#process
do_make $1

