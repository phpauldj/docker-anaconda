FROM ubuntu:16.04

# Make sure everything is updated
RUN apt-get update -y && apt-get upgrade -y

# Install package needed for Anaconda
RUN apt-get install -y wget curl bzip2 libpython3-dev libboost-python-dev

# Download anaconda install
RUN curl -O https://repo.continuum.io/archive/Anaconda3-5.1.0-Linux-x86_64.sh

# Turn executable attribute
RUN chmod +x Anaconda3-5.1.0-Linux-x86_64.sh 

# Install Anaconda
RUN bash Anaconda3-5.1.0-Linux-x86_64.sh -b

# Remove Instalation file
RUN rm Anaconda3-5.1.0-Linux-x86_64.sh

# Add Anaconda to the Path
ENV PATH /root/anaconda3/bin:$PATH 

# Run Anaconda IPython
CMD ["ipython"]