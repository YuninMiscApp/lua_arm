

# ANSI COLORS
NORMAL="\033[0m"
RED="\033[31m"
GREEN="\033[32m"
YELLOW="\033[33m"
BLUE="\033[34m"
WHITE="\033[37m"

if [ $# -lt 1 ];then
	echo "usage: $0 [install/uninstall]"
	exit 1
fi


do_install()
{
	echo -e  "${YELLOW}install lua start ...${NORMAL}"
	
	#termcap
	echo -e  "${RED}make termcap...${NORMAL}" 
	
	echo -e  "${GREEN}make termcap clean ${NORMAL}" 
	cd ./3th-libs/termcap-1.3.1 && ./make.sh clean
	cd -
	echo -e  "${GREEN}make termcap all ${NORMAL}" 
	cd ./3th-libs/termcap-1.3.1 && ./make.sh all
	cd -
	echo -e  "${GREEN}make termcap install ${NORMAL}" 
	cd ./3th-libs/termcap-1.3.1 && ./make.sh install
	cd -
	
	#readline.
	echo -e "${RED}make readline...${NORMAL}"
	
	echo -e  "${GREEN}make readline clean ${NORMAL}"
	cd ./3th-libs/readline-6.0 && ./make.sh clean
	cd -
	echo -e  "${GREEN}make readline all ${NORMAL}"
	cd ./3th-libs/readline-6.0 && ./make.sh all
	cd -
	echo -e  "${GREEN}make readline install ${NORMAL}"
	cd ./3th-libs/readline-6.0 && ./make.sh install
	cd -
	
	#lua
	echo -e "${RED}make lua...${NORMAL}"
	
	echo -e  "${GREEN}make lua clean ${NORMAL}"
	cd ./lua && ./make.sh clean
	cd -
	echo -e  "${GREEN}make lua all ${NORMAL}"
	cd ./lua && ./make.sh all
	cd -
	echo -e  "${GREEN}make lua install ${NORMAL}"
	cd ./lua && ./make.sh install
	cd -
	
	echo -e  "${YELLOW}install lua complete ...${NORMAL}"
}



do_uninstall()
{
	echo -e  "${YELLOW}uninstall lua start ...${NORMAL}"
	#
	echo -e  "${GREEN}make termcap clean ${NORMAL}" 
	cd ./3th-libs/termcap-1.3.1 && ./make.sh clean
	cd -
	#
	echo -e  "${GREEN}make readline clean ${NORMAL}"
	cd ./3th-libs/readline-6.0 && ./make.sh clean
	cd -
	#
	echo -e  "${GREEN}make lua clean ${NORMAL}"
	cd ./lua && ./make.sh clean
	cd -
	#
	echo -e  "${YELLOW}uninstall lua complete ...${NORMAL}"
}


if [ "$1" == "install" ] ;then
	do_install
elif [ "$1" == "uninstall" ] ;then
	do_uninstall		
else
	echo "unknow command"
fi
