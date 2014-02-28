You need to register an account at GATK in order to download it.

Clone and run this on a new EC2 instance running Ubuntu 12.04.2 LTS:

    cd $HOME
    sudo apt-get install -y git-core
    git clone https://github.com/azalea/gatk_setup.git
    ./gatk_setup/setup.sh   

Most of the setup will run automatically.
Exceptions:
1. You need to agree to a license when installing Java.
2. You need to type "Y" a few times.
