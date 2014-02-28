#!/bin/bash
# Simple setup.sh for configuring Ubuntu 12.04 LTS EC2 instance to setup GATK and other software packages required for GATK best practice.

#### Get GATK file for install ####
# Currently you cannot download GATK from command line.
# Has to download it from a machine with a brower and upload it somewhere like an FTP or Dropbox
# Or you can scp the file from the machine that downloaded it to the machine you want to install on.
# ref: http://gatkforums.broadinstitute.org/discussion/comment/12092/#Comment_12092
GATK_URL='https://dl.dropboxusercontent.com/u/308058/GenomeAnalysisTK-2.8-1.tar.bz2'
wget $GATK_URL

#### Set installation path ####
INSTALL_DIR='/usr/bin'
JAR_EXT_DIR='/usr/lib/jvm/java-7-oracle/jre/lib/ext'
sudo mkdir -p $JAR_EXT_DIR

#### Install dependency packages ####
sudo apt-get install build-essential 
sudo apt-get install zlib1g-dev
sudo apt-get install unzip

# required for samtools
# ref: http://askubuntu.com/questions/78749/what-provides-curses-headers-named-curses-h
sudo apt-get install libncurses5-dev

#### Setup java 7 ####
# GATK 2.6 or later requires Java Runtime Environment version 1.7. 
# ref: http://www.ubuntugeek.com/how-to-install-oracle-java-7-in-ubuntu-12-04.html
sudo apt-get purge openjdk*

sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java7-installer

#### Setup GATK ####
# !!!!FIXME: need to find out the official download link.
tar xvjf GenomeAnalysisTK-2.8-1.tar.bz2; rm $_
mv GenomeAnalysisTK-2.8-1-* GenomeAnalysisTK-2.8-1

sudo mv GenomeAnalysisTK-2.8-1 $JAR_EXT_DIR
echo "GATK_HOME=$JAR_EXT_DIR/GenomeAnalysisTK-2.8-1" >> ~/.bashrc
echo "alias GATK='java -jar $JAR_EXT_DIR/GenomeAnalysisTK-2.8-1/GenomeAnalysisTK.jar'" >> ~/.bashrc

#### Software packages required for GATK best practice
# ref: http://gatkforums.broadinstitute.org/discussion/2899/howto-install-all-software-packages-required-to-follow-the-gatk-best-practices

# bwa
# although you can apt-get install bwa, but since it is updated frequently, 
# the version in the official repository may be outdated.
wget http://sourceforge.net/projects/bio-bwa/files/bwa-0.7.7.tar.bz2
tar xvjf bwa-0.7.7.tar.bz2; rm $_
cd bwa-0.7.7
make
sudo cp bwa $INSTALL_DIR
cd ..
rm -r bwa-0.7.7

# samtools
# although you can apt-get install samtools, but since it is updated frequently, 
# the version in the official repository may be outdated.
wget http://sourceforge.net/projects/samtools/files/samtools/0.1.19/samtools-0.1.19.tar.bz2
tar xvjf samtools-0.1.19.tar.bz2; rm $_
cd samtools-0.1.19
make
sudo cp samtools $INSTALL_DIR
cd ..
rm -r samtools-0.1.19

# HTSlib
wget https://github.com/samtools/htslib/archive/master.zip
mv master.zip htslib-master.zip
unzip htslib-master.zip; rm $_
cd htslib-master 
make
sudo cp htscmd $INSTALL_DIR
cd ..
rm -r htslib-master

# Picard
wget http://sourceforge.net/projects/picard/files/picard-tools/1.108/picard-tools-1.108.zip
unzip picard-tools-1.108.zip; rm $_
sudo mv picard-tools-1.108 $JAR_EXT_DIR
echo "PICARD_HOME=$JAR_EXT_DIR/picard-tools-1.108" >> ~/.bashrc

# R and gsalib
sudo apt-get install r-base
echo "install.packages('gsalib', repos='http://cran.us.r-project.org')" > gsalib.R
sudo Rscript gsalib.R 
rm gsalib.R
