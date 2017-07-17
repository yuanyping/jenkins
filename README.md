# jenkins
…or create a new repository on the command line


echo "# jenkins" >> README.md

git init

git add README.md

git commit -m "first commit"

git remote add origin https://github.com/yuanyping/jenkins.git

git push -u origin master

…or push an existing repository from the command line


git remote add origin https://github.com/yuanyping/jenkins.git

git push -u origin master

…or import code from another repository

You can initialize this repository with code from a Subversion, Mercurial, or TFS project.

Import code

system version: ubuntu16.04

配置中java、jenkins.jar 包自行下载到与Dockerfile相同目录

该版本集合了ansible 和saltstack

saltstack版本为2016.11
