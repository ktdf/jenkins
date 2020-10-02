FROM jenkins/jenkins:lts-centos
USER root
RUN  dnf update -y ;\
     dnf remove docker \
                docker-client-latest \
                docker-common \
                docker-latest \
                docker-latest-logrotate \
                docker-logrotate \
                docker-engine ;\
     yum-config-manager --add-repo \
                        https://download.docker.com/linux/centos/docker-ce.repo ;\
     dnf install -y python3 gcc python3-pip python3-devel openssl-devel python3-libselinux docker-ce docker-ce-cli ;\
     python3 -m pip install --upgrade setuptools;\
     python3 -m pip install "molecule[lint]" docker;\ 
     dnf clean all
