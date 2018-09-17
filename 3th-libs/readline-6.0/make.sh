#

if [ $# -lt 1 ];then
	echo "usage: $0 [all/clean/install]"
	exit 1
fi



#environment variable
compiler_setting()
{
	#command setting
	./configure --prefix=/home/leon/arm/arm-hisiv300-linux --target=arm-hisiv300-linux --host=arm-hisiv300-linux CC=arm-hisiv300-linux-gcc CFLAGS="-fPIC -Wall -Wno-format -fno-strict-aliasing -O2" 
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
		echo "make install"
		make install
	else
		echo "unknow command"
	fi
}

#process
do_make $1


