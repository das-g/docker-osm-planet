FROM debian:jessie

ENV osm_planet_mirror="http://ftp5.gwdg.de/pub/misc/openstreetmap/planet.openstreetmap.org/" \
    osm_planet_path_relative_to_mirror="pbf/planet-latest.osm.pbf" \
    osm_planet_dir="/var/data/osm-planet"

RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    wget

CMD ["/bin/bash", "-c", "mkdir -p $osm_planet_dir && \
                         pushd $osm_planet_dir && \
                         wget --continue ${osm_planet_mirror}${osm_planet_path_relative_to_mirror}; \
                         popd"]
