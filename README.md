Leaflet Ingester
===============

This module is designed to run as a Job in HySDS. It takes a time-teries product and attempts to ingest it into the thredds server that supports Leaflet JS. It copies the NBSA-params.h5 file and ingests it as the primary time-series for the product. In addition, it ingests the LS-params.h5 as the "-ls" secondary time-series for the product.

Configuration for this module is supplied as environment variables. The localfile env_config.bash is sourced before running and supplies the environment variables. The required variables are:

  LEAFLET_SERVER: the IP for the leaflet server (used for ssh)

  LEAFLET_SERVER_IDENTITY: the SSH identity file accessing "ops" on the leaflet server

  LEAFLET_SERVER_DS_LOCATION: location to place datasets on the server. Standard location is: "/home/ops/verdi/ops/aria-leaflet-timeseries-docker/datasets/ts/"


