Setup [GATK](http://www.broadinstitute.org/gatk/) and [software packages required to follow the GATK Best Practices](http://gatkforums.broadinstitute.org/discussion/2899/howto-install-all-software-packages-required-to-follow-the-gatk-best-practices) on Ubuntu 12.04 LTS.

You need to register an account at GATK, download the .tar.bz2 file, put it online somewhere, and change lines 9 and 10 of setup.sh

Or if you trust me, you can use the file I downloaded and saved in Dropbox.

Clone and run this on Ubuntu 12.04 LTS (use your best judgement for other system):

    cd $HOME
    sudo apt-get install -y git-core
    git clone https://github.com/azalea/gatk_setup.git
    ./gatk_setup/setup.sh    

Most of the setup will run automatically.

Exceptions:

1. You need to agree to a license when installing Java.
2. You need to type "Y"

Testing if setup is successful:

    source ~/.bashrc

    # GATK
    GATK --help
    # wait and see lots of help messages
    # The following should also work
    # java -jar $GATK_HOME/GenomeAnalysisTK.jar --help

    # Picard
    java -jar $PICARD_HOME/AddOrReplaceReadGroups.jar -h 

    bwa
    samtools
    htscmd
    R
    # in R console, type
    # library(gsalib)
