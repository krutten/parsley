#! /bin/bash
   parsley_version="parsley 0.1"

   # Log details in /var/log/ for easy checking
   echo "Start install -- Parsley" >>  /var/log/parsley_install.txt
   date >> /var/log/parsley_install.txt
   echo "Version: $parsley_version " >>  /var/log/parsley_install.txt

   # test for parsley
   parsley_result=`/usr/local/bin/parsley -V`
   echo "Result: $parsley_result " >> /var/log/parsley_install.txt

   if [[ $parsley_result != $parsley_version ]]; then

   # Test if we are root so we can install
     if [ "`whoami`" != "root" ]; then
      echo "Must be run as root"
      echo "Must be run as root" >> /var/log/parsley_install.txt
      exit 1
     fi

   # /etc/config.yml
    if ! test -e /usr/local/include/json/json.h; then
      echo "json not found, installing"
      echo "json not found, installing" >> /var/log/parsley_install.txt
   # Build Install json-c 0.8
      cd json-c-0.8
      sh ./configure
      make
      make install
      cd ..
    else
      echo json found, skipping
      echo json found, skipping >> /var/log/parsley_install.txt
    fi

    # build parsley
    echo installing parsley
    echo installing parsley >> /var/log/parsley_install.txt

    sh ./configure
    make
    make install
    ldconfig
   else
    echo already installed
    echo already installed >> /var/log/parsley_install.txt
   fi
   date >> /var/log/parsley_install.txt
   echo "Done Install -- Parsley" >> /var/log/parsley_install.txt

