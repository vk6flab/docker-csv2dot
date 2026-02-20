FROM debian:stable-slim

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get -y upgrade

RUN apt-get -y install \
	libtext-csv-xs-perl

ADD https://rp.win.tue.nl/bin/csv2dot /usr/local/bin/csv2dot

RUN chmod +x+r /usr/local/bin/csv2dot
RUN ls -l /usr/local/bin/csv2dot

RUN useradd -ms /bin/bash docker
USER docker

ENTRYPOINT ["/usr/local/bin/csv2dot"]
CMD ["-h"]
