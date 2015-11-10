# docker-osm-planet
manage your copy of the OpenStreetMap planet file from within a docker container

## usage
The container will download the latest OSM planet when run to its internal directory `/var/data/osm-planet`. Thus, mount a data-only container or a host directory to that location to receive the file:

E.g., if you want the planet file inside `~/tmp/data-osm` on your host:
```shell
mkdir -p ~/tmp/data-osm
docker run --rm -ti -v ~/tmp/data-osm:/var/data/osm-planet geometalab/osm-planet
```

The `-ti` in there allows you to abort the download with **Ctrl-c**.
The `--rm` removes the container when finished. (There's no good reason to keep it.)

### advanced usage
Pass the following environment variables to `docker run` with `--env <key>=<value>` to override the defaults:
* **`osm_planet_mirror`** &mdash; OpenStreetMap planet mirror. See [OSM wiki](http://wiki.openstreetmap.org/wiki/Planet.osm#Planet.osm_mirrors) for available servers.
* **`osm_planet_path_relative_to_mirror`** &mdash; the file to download from the mirror. Defaults to `pbf/planet-latest.osm.pbf`
* **`osm_planet_dir`** &mdash; where to place the downloaded file inside the container. Defaults to `/var/data/osm-planet`. You'll want to mount a host direcotry or another container's volume to the location you specify here, so that you can retrieve the downloaded file when the osm-planet container has been removed after running.

Do **not** override `osm_planet_script_dir`.

E.g., if you want Switzerland inside `~/tmp/data-osm` on your host (from geofabrik):
```shell
docker run --rm -ti -e osm_planet_mirror='http://download.geofabrik.de/' -e osm_planet_path_relative_to_mirror='europe/switzerland-latest.osm.pbf' -v ~/tmp/data-osm:/var/data/osm-planet geometalab/osm-planet
```
