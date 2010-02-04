#! /bin/bash
   parsley_version="parsley 0.1"

   # test for parsley
   parsley_result=`/usr/local/bin/parsley -V`
   if [[ $parsley_result != $parsley_version ]]; then

   # Test if we are root so we can install
     if [ "`whoami`" != "root" ]; then
      echo "Must be run as root"
      exit 1
     fi

   # /etc/config.yml
    if ! test -e /usr/local/include/json/json.h; then
      echo json not found, installing
   # Build Install json-c 0.8
      cd json-c-0.8
      sh ./configure
      make
      make install
      cd ..
    else
      echo json found, skipping
    fi

    # build parsley
    echo installing parsley
    sh ./configure
    make
    make install
    ldconfig
   else
    echo already installed
   fi
