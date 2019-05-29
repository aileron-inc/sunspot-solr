FROM solr:8

USER root

RUN mkdir sunspot
COPY *.xml ./sunspot

RUN bin/solr create -c test -d sunspot
RUN bin/solr create -c development -d sunspot
RUN bin/solr create -c production -d sunspot

USER solr
