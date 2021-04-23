#Image base
FROM ubuntu:20.04

LABEL maintainer="Montdata team <hello@montdata.com>"
# Ports open on the container
EXPOSE 3000
EXPOSE 9090

ARG GF_UID="442"
ARG GF_GID="442"

# Install dependence
RUN apt update -y
RUN apt-get install -y apt-transport-https
RUN apt-get install -y software-properties-common wget curl
RUN apt-get install -y ca-certificates
RUN wget -q -O - https://packages.grafana.com/gpg.key |   apt-key add -

# Add grafana repository
RUN echo "deb https://packages.grafana.com/oss/deb stable main" |   tee -a /etc/apt/sources.list.d/grafana.list

# Install grafana

RUN   apt-get update -y
RUN   apt-get install grafana -y


# Prometheus
#RUN useradd --no-create-home --shell /bin/false prometheus
#RUN useradd --no-create-home --shell /bin/false node_exporter

RUN mkdir -p  /etc/prometheus/rules &&  mkdir -p /etc/prometheus/rules.d &&  mkdir -p /etc/prometheus/files_sd

RUN mkdir -p /prometheus

RUN mkdir -p /tmp/prometheus

WORKDIR /tmp/prometheus

RUN curl -s https://api.github.com/repos/prometheus/prometheus/releases/latest | grep browser_download_url | grep linux-amd64 | cut -d '"' -f 4 | wget -qi -
RUN tar xvf prometheus*.tar.gz
RUN  mv prometheus*/prometheus prometheus*/promtool /usr/local/bin/

COPY prometheus.yml /etc/prometheus/prometheus.yml

RUN chown -R grafana:grafana /etc/prometheus /prometheus

RUN curl -s https://api.github.com/repos/prometheus/node_exporter/releases/latest | grep browser_download_url | grep linux-amd64 | cut -d '"' -f 4 | wget -qi -
RUN tar xvf node_exporter*.tar.gz
RUN mv node_exporter*/node_exporter /usr/local/bin
RUN rm -rf /tmp/prometheus


#USER prometheus
#ENTRYPOINT [ "/bin/prometheus" ]
#CMD        [ "--config.file=/etc/prometheus/prometheus.yml", \
#             "--storage.tsdb.path=/prometheus" ]
WORKDIR /

# System Variables
ENV PATH="/usr/share/grafana/bin:$PATH" \
    GF_PATHS_CONFIG="/etc/grafana/grafana.ini" \
    GF_PATHS_DATA="/var/lib/grafana" \
    GF_PATHS_HOME="/usr/share/grafana" \
    GF_PATHS_LOGS="/var/log/grafana" \
    GF_PATHS_PLUGINS="/var/lib/grafana/plugins" \
    GF_PATHS_PROVISIONING="/etc/grafana/provisioning"

# Start grafana
COPY conf conf

# curl should be part of the image
#RUN apt-get update && apt-get install -y ca-certificates curl

RUN mkdir -p "$GF_PATHS_HOME/.aws" && \
  mkdir -p "$GF_PATHS_PROVISIONING/datasources" \
             "$GF_PATHS_PROVISIONING/dashboards" \
             "$GF_PATHS_PROVISIONING/notifiers" \
             "$GF_PATHS_PROVISIONING/plugins" \
             "$GF_PATHS_LOGS" \
             "$GF_PATHS_PLUGINS" \
             "$GF_PATHS_DATA" && \
    cp conf/sample.ini "$GF_PATHS_CONFIG" && \
    cp conf/ldap.toml /etc/grafana/ldap.toml && \
    chown -R grafana:grafana "$GF_PATHS_DATA" "$GF_PATHS_HOME/.aws" "$GF_PATHS_LOGS" "$GF_PATHS_PLUGINS" "$GF_PATHS_PROVISIONING" && \
    chmod -R 777 "$GF_PATHS_DATA" "$GF_PATHS_HOME/.aws" "$GF_PATHS_LOGS" "$GF_PATHS_PLUGINS" "$GF_PATHS_PROVISIONING"

COPY run.sh /
RUN chmod +x /run.sh
USER grafana

ENTRYPOINT [ "/run.sh" ]
