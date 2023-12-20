#FROM ibmcom/ace-server:11.0.0.11-r2-20210303-133203-amd64
ARG  FROMIMAGE=cp.icr.io/cp/appc/ace:12.0.10.0-r1
FROM ${FROMIMAGE}

USER root
COPY bars_test /home/aceuser/bars
RUN  chmod -R ugo+rwx /home/aceuser
USER 1000
RUN ace_compile_bars.sh
USER root
RUN  chmod -R ugo+rwx /home/aceuser
USER 1000
