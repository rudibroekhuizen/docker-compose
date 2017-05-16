FROM ubuntu

# Dependencies to be able to run Puppet base module
RUN apt-get update && apt-get install sudo vim curl wget dialog apt-utils apt-transport-https rubygems -y

# Set the locale
RUN locale-gen en_US.UTF-8  
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8
