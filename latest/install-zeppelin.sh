
#!/bin/bash

FOLDER_PATH=/usr/lib
ZEPPELIN_CONF=zeppelin/conf

echo "
============================================================== 
**************************************************************

    Installings the following
        Java
        Apache Zeppelin 0.8.0
        Apache Spark 2.1.0 with Hadoop 2.7
        SparkR interpreter with handy R packages
            devtools
            googleVis
            knitr
            ggplot2
            mplot
            plotly
        Matplotlib & Numpy for Python

    Spark & Zeppelin folders can be found in $FOLDER_PATH

*************************************************************
=============================================================
"

#Install Java
echo '=> 1/10 Installing Java'
sudo apt-get install default-jdk curl
sudo apt-get update

#Install Spark
echo '==> 2/10 Installing Apache Spark'
wget https://d3kbcqa49mib13.cloudfront.net/spark-2.1.0-bin-hadoop2.7.tgz
tar -zxf spark-2.1.0-bin-hadoop2.7.tgz
sudo mv spark-2.1.0-bin-hadoop2.7 $FOLDER_PATH/spark

#Install Zeppelin
echo '===> 3/10 Installing Apache Zeppelin'
wget http://apache.cs.utah.edu/zeppelin/zeppelin-0.8.0/zeppelin-0.8.0-bin-all.tgz 
tar -zxf zeppelin-0.8.0-bin-all.tgz
sudo mv zeppelin-0.8.0-bin-all $FOLDER_PATH/zeppelin
rm -rf *.tgz

# Grant Permissions
echo '====> 4/10 Granting Permissions'
chmod -R 777 .

# Install Interpreters
$FOLDER_PATH/zeppelin/bin/install-interpreter.sh -a

echo '=====> 5/10 Setting up the Environment Variables'
cp $FOLDER_PATH/$ZEPPELIN_CONF/zeppelin-env.sh.template $FOLDER_PATH/$ZEPPELIN_CONF/zeppelin-env.sh
echo 'export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/' | sudo tee -a $FOLDER_PATH/$ZEPPELIN_CONF/zeppelin-env.sh
echo 'export SPARK_HOME=/usr/lib/spark' | sudo tee -a $FOLDER_PATH/$ZEPPELIN_CONF/zeppelin-env.sh

echo 'export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/' | sudo tee -a .bashrc
echo 'export SPARK_HOME=/usr/lib/spark' | sudo tee -a .bashrc

#SparkR Interpreter
echo '======> 6/10 Installing SparkR Interpreter'
sudo apt-get -y install r-base

# Installing packages
echo '=======> 7/10 Installing R packages'
cd ~
sudo R -e "install.packages(c('devtools','googleVis','knitr','ggplot2','mplot','plotly'), repos = 'http://cran.us.r-project.org')"

# Installing Python packages
echo '========> 8/10 Installing Python packages'
sudo apt-get install python-pip
pip install --upgrade pip
sudo pip install numpy
sudo pip install matplotlib

echo '=========> 9/10 Cleaning up! Almost done....'
sudo apt-get autoclean
sudo apt-get clean

echo '==========> 10/10 Starting Zeppelin!'
cd ~
$FOLDER_PATH/zeppelin/bin/zeppelin-daemon.sh start

# Getting Local IP address
IP=$(ifconfig eth0 | awk '/t addr:/{gsub(/.*:/,"",$2);print$2}')
echo "If the Zeppelin status is OK you're all set! Navigate to http://$IP:8080/ to get started."

# To remove the installer file, run the following line:
# rm -f install-zeppelin.sh