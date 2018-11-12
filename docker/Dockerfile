FROM hysds/pge-base

MAINTAINER mstarch "Michael.D.Starch@jpl.nasa.gov"
LABEL description="A job to ingest timeseries into the leaflet server"

# provision create_AOI PGE
USER ops
COPY . /home/ops/ts-ingest

# set entrypoint
WORKDIR /home/ops
CMD ["/bin/bash", "--login"]
