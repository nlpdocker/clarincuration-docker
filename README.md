# clarincuration-docker
Dockerize the [Clarin-Curation Module](https://github.com/clarin-eric/clarin-curation-module).
Many thanks to Davor Ostojić for hints on the module installation.

### Build the image
To create the dockerimage run

```bash
docker build -t clarincurate https://github.com/fkuhn/clarincuration-docker.git
```
which will generate an image named clarincurate.

Since clarin-curation-module is in active development, you should consider regular updates.
You can force docker to ignore its cache when building the curation image again:
```bash
docker build --no-cache=true -t clarincurate https://github.com/fkuhn/clarincuration-docker.git
```

## Usage

docker run clarincurate startcurate ...


### Run container interactively
Run the image as container  in interactive mode with

```bash
docker run -i -t clarincurate /bin/bash
```
Entrypoint is /opt/clarin-curation-module/curation-module-core/target.
