
# Official Neo4j Docker Image + APOC

FROM neo4j:latest
MAINTAINER Jonathan Brumley <cayasso@gmail.com>

ENV APOC_VERSION 3.5.0.4
ENV APOC_FILE apoc-$APOC_VERSION-all.jar
ENV APOC_URI https://github.com/neo4j-contrib/neo4j-apoc-procedures/releases/download/$APOC_VERSION/$APOC_FILE
ENV NEO4J_dbms_security_procedures_unrestricted=apoc.\\\*

RUN mv plugins /plugins \
    && ln --symbolic /plugins

RUN curl --fail --silent --show-error --location --output $APOC_FILE $APOC_URI \
    && mv $APOC_FILE /plugins

EXPOSE 7474 7473 7687

CMD ["neo4j"]
