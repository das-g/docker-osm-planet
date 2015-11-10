#!/bin/dash

set -e

mkdir -p $osm_planet_dir
cd $osm_planet_dir
wget ${osm_planet_mirror}${osm_planet_path_relative_to_mirror}
