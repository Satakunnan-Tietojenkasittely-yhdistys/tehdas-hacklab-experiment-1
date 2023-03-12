FROM ubuntu:22.04
LABEL MAINTAINER santeri.vesalainen@satkynet.fi
LABEL VERSION 1.0
LABEL BEST_PRACTICE_REFERENCE_1 https://octopus.com/blog/using-ubuntu-docker-image 

RUN echo 'APT::Install-Suggests "0";' >> /etc/apt/apt.conf.d/00-docker
RUN echo 'APT::Install-Recommends "0";' >> /etc/apt/apt.conf.d/00-docker
RUN DEBIAN_FRONTEND=noninteractive \
apt-get update \
&& apt-get install -y nano ca-certificates wget pulseaudio \
festvox-suopuhe-common festvox-suopuhe-mv sox flac \
vlc-bin poppler-utils \
&& rm -rf /var/lib/apt/lists/*

RUN useradd -ms /bin/bash app-user
WORKDIR /home/app-user

RUN \
wget https://raw.githubusercontent.com/Satakunnan-Tietojenkasittely-yhdistys/SuoPuhe/main/festival.scm  \
&& cp -f festival.scm /etc/festival.scm \
&& wget https://raw.githubusercontent.com/Satakunnan-Tietojenkasittely-yhdistys/SuoPuhe/main/sano.bash \
&& wget https://raw.githubusercontent.com/arpitjainds/Extract-PDF-Images/master/batch-pdf-image-extractor.sh

COPY --chown=app-user scripts/app-user/*.sh  .
RUN chown -R app-user:app-user /home/app-user
RUN chmod u+x *.sh 
RUN chmod u+x *.bash 

USER app-user
ENTRYPOINT [ "/home/app-user/process_files.sh" ]
