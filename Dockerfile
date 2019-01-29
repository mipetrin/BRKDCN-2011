# Dockerfile to help explain concepts from my Cisco Live Orlando 2018 / Cisco Live Barcelona 2019 session:
#
# BRKDCN-2011 : How programmability and automation can assist with Day 2 operations in the Data Center
#
# Michael Petrinovic 2018
# version 1.0

FROM centos:7
MAINTAINER Michael Petrinovic mipetrin@cisco.com

RUN yum -y update
RUN yum -y install epel-release
RUN yum -y install python-pip git openssh-clients python-setuptools python-devel
RUN yum -y group install "Development Tools"
RUN pip install --upgrade pip
RUN pip install ucsmsdk
RUN pip install ansible
RUN pip install tetpyclient
RUN pip install acitoolkit
RUN pip install jmespath ## Enable some query functionality for Ansible playbooks
RUN pip install dnspython ## DNS Lookups for Tetration scripts

WORKDIR /root
RUN git clone https://github.com/mipetrin/Nexus.git
RUN git clone https://github.com/mipetrin/UCS.git
RUN git clone https://github.com/mipetrin/Tetration.git
RUN git clone https://github.com/mipetrin/ACI.git
RUN git clone https://github.com/mipetrin/Misc.git
RUN git clone https://github.com/mipetrin/Vagrant_N9K.git
RUN git clone https://github.com/mipetrin/Ansible.git

CMD ["/bin/bash"]
