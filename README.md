# clarincuration-docker
Dockerize the [Clarin-Curation Module](https://github.com/clarin-eric/clarin-curation-module).
Many thanks to Davor Ostojić for hints on the module installation.

### Build the image
To create the dockerimage run

```bash
docker build -t clarincurate https://github.com/fkuhn/clarincuration-docker.git
```
which will generate an image named clarincurate.


### Run as container
Run the image as container  in interactive mode with

```bash
docker run -i -t clarincurate /bin/bash
```
Entrypoint is /opt/clarin-curation-module/curation-module-core/target.
