You need to register an account at GATK, download the .tar.bz2 file, put it online somewhere, and change line 9 of setup.sh

Clone and run this on a new EC2 instance running Ubuntu 12.04.2 LTS:

    cd $HOME
    sudo apt-get install -y git-core
    git clone https://github.com/azalea/gatk_setup.git
    cd gatk_setup
    nano setup.sh 
    # Make change to line 9
    ./setup.sh    

Most of the setup will run automatically.

Exceptions:

1. You need to agree to a license when installing Java.
2. You need to type "Y" a few times.
