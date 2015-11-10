FROM debian:jessie

ENV osm_planet_mirror="http://ftp5.gwdg.de/pub/misc/openstreetmap/planet.openstreetmap.org/" \
    osm_planet_path_relative_to_mirror="pbf/planet-latest.osm.pbf" \
    osm_planet_dir="/var/data/osm-planet" \
    osm_planet_script_dir="/home/osm-planet"

RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    wget

WORKDIR ${osm_planet_script_dir}

ADD src ${osm_planet_script_dir}/src

CMD ["/home/osm-planet/src/download_planet.sh"]
