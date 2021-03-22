FROM mongo:4.4.4

COPY endpoint.sh init_repl.sh /
RUN ["chmod", "+x", "/endpoint.sh", "/init_repl.sh"]

VOLUME /data/db
ENTRYPOINT ["/endpoint.sh"]
