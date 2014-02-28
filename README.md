You need to register an account at GATK, download the .tar.bz2 file, put it online somewhere, and change line 9 of setup.sh

Or if you trust me, you can use the file I downloaded and saved in Dropbox.

Clone and run this on Ubuntu 12.04.2 LTS (use your best judgement for other system):

    cd $HOME
    sudo apt-get install -y git-core
    git clone https://github.com/azalea/gatk_setup.git
    ./gatk_setup/setup.sh    

Most of the setup will run automatically.

Exceptions:

1. You need to agree to a license when installing Java.
2. You need to type "Y" a few times.
