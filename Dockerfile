FROM solr:8
USER root
WORKDIR /var/sunspot
RUN chown -R solr:root ./

COPY solr/* ./
RUN chown solr:root ./solr.xml
RUN chown solr:root ./zoo.cfg

USER solr
COPY sunspot/ ./core
RUN mkdir test development
RUN cp -r core/*.xml test/ && \
    cp -r core/*.xml development/

ENV SOLR_HOST /var/sunspot
