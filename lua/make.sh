#/bin/sh

if [ $# -lt 1 ];then
	echo "usage: $0 [all/clean/install]"
	exit 1
fi

#environment variable
compiler_setting()
{
	#command setting
	export INSTALL_TOP="/home/leon/arm/arm-hisiv300-linux"
	export CC="arm-hisiv300-linux-gcc"
	export AR="arm-hisiv300-linux-ar rcu"
	export RANLIB="arm-hisiv300-linux-ranlib"
	#options setting
	export SYSCFLAGS=
	export SYSLDFLAGS=
	export SYSLIBS=
	
	export MYCFLAGS="-I/home/leon/arm/arm-hisiv300-linux/include"
	export MYLDFLAGS="-L/home/leon/arm/arm-hisiv300-linux/lib"
	export MYLIBS="-ltermcap"
	export MYOBJS=
}

#do make
do_make()
{
	if [ "$1" == "clean" ] ;then
		echo "make clean"
		cd lua-5.3.4 
		make clean
	elif [ "$1" == "all" ] ;then	
		echo "compiler setting now..."
		compiler_setting
		cd lua-5.3.4 
		echo "make linux"
		make linux	
	elif [ "$1" == "install" ] ;then
		echo "compiler setting now..."
		compiler_setting
		echo "make install"
		cd lua-5.3.4 
		make install
	else
		echo "unknow command"
	fi
}

#process
do_make $1

