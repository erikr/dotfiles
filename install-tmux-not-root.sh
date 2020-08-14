#!/bin/bash

# Installs tmux and other GNU tools on systems where you don't have root access.

# Determine number of CPUs for calling make
if [ -f /proc/cpuinfo ]; then
    CPUS=`grep processor /proc/cpuinfo | wc -l`
else
    CPUS=1
fi

# Create temporary directory in which to store installation files
TEMPDIR=$HOME/install_tmp
cd && rm -rf ${TEMPDIR}
mkdir -p ${TEMPDIR}
cd ${TEMPDIR}


# Define function to install tools
install_from_src () {
    SRC=$1
    TOOL=$2
    VERSION=$3
    CUSTOMURL=$4

    if [ "$SRC" == "ftp" ]; then
        BASE_ADDR="https://ftp.gnu.org/gnu"
        ADDR="${BASE_ADDR}/${TOOL}/${TOOL}-${VERSION}.tar.gz"
        wget -O "${TOOL}.tar.gz" -q $ADDR &> /dev/null
    fi

    if [ "$SRC" == "freedesktop" ]; then
        BASE_ADDR="http://pkgconfig.freedesktop.org/releases"
        ADDR="${BASE_ADDR}/${TOOL}-${VERSION}.tar.gz"
        wget -O "${TOOL}.tar.gz" -q $ADDR &> /dev/null
    fi

    if [ "$SRC" == "github" ]; then
        BASE_ADDR="https://github.com"
        ADDR="${BASE_ADDR}/${2}/${2}/releases/download/${CUSTOMURL}.tar.gz"
        wget -O "${TOOL}.tar.gz" -q $ADDR &> /dev/null
    fi

    # Check file size of download
    FILESIZE=$(stat -c%s "${TOOL}.tar.gz")

    if [ ${FILESIZE} != 0 ]; then
        # Identify directory name that will be created via tar
        dir_name=`tar -tzf ${TOOL}.tar.gz | head -1 | cut -f1 -d"/"`

        # Untar the tar.gz file
        tar -xvzf ${TOOL}.tar.gz

        # Enter the directory
        cd $dir_name

        # Run autogen.sh, only for github files though
        if [ ${SRC} == "github" ]; then
            ./autogen.sh
        fi
        
        if [ {$TOOL} == "tmux" ]; then
            ./configure CFLAGS="-I$HOME/local/include -I$HOME/local/include/ncurses" LDFLAGS="-L$HOME/local/lib -L$HOME/local/include/ncurses -L$HOME/local/include"
            CPPFLAGS="-I$HOME/local/include -I$HOME/local/include/ncurses" LDFLAGS="-static -L$HOME/local/include -L$HOME/local/include/ncurses -L$HOME/local/lib"
        fi

        if [ "$TOOL" == "pkg-config" ]; then
            ./configure --prefix=$HOME/local --with-internal-glib
        else
            ./configure --prefix=$HOME/local
        fi
        
        if [ "$TOOL" == "ncurses" ]; then
            export CPPFLAGS="-P"
        fi

        make -j $CPUS
        make install
        make clean

        cd ..
        rm -rf $dir_name
        rm "${TOOL}.tar.gz"
        echo -e "\e[1;39m[   \e[1;32mOK\e[39m   ] ${TOOL}-${VERSION} installed\e[0;39m"
    else
        echo -e "\e[1;39m[   \e[31mError\e[39m   ] cannot fetch ${TOOL}-${VERSION} from ${SRC} \e[0;39m"
    fi
}

# Call install, specifying up to four args:
# 1. source
# 2. tool
# 3. version
# 4. custom URL because GitHub releases do not use consistent naming
install_from_src ftp autoconf 2.69
install_from_src ftp automake 1.16.2
install_from_src ftp libtool 2.4.6
install_from_src freedesktop pkg-config 0.29.2
install_from_src ftp ncurses 6.0
install_from_src github libevent 2.1.11 release-2.1.11-stable/libevent-2.1.11-stable
install_from_src github tmux 3.0a 3.0a/tmux-3.0a

# Cleanup
rm -rf $TEMPDIR

echo -e "\n\n$HOME/local/bin/tmux is now available. Make it accessible:"
echo -e "\nSolution 1: append it to your PATH:\n  export PATH=\$PATH:$HOME/local/bin"
echo -e "\nSolution 2: create an alias:\n  alias tmux=$HOME/local/bin/tmux"
