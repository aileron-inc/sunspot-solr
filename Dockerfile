FROM solr:8

USER root

RUN mkdir sunspot
COPY *.xml sunspot/

RUN mkdir /var/solr/data/test && \
    cp -rf sunspot/*.xml /var/solr/data/test

RUN mkdir /var/solr/data/development && \
    cp -rf sunspot/*.xml /var/solr/data/development

#RUN bin/solr create -c test
#RUN bin/solr create -c development -d ./sunspot
#RUN bin/solr create -c production -d ./sunspot

USER solr
