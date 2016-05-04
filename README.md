# clarincuration-docker
Dockerize the [Clarin-Curation Module](https://github.com/clarin-eric/clarin-curation-module).

To create the dockerimage run

```bash
docker build -t clarincurate https://github.com/fkuhn/clarincuration-docker
```
which will generate an image named clarincurate.

Run the image as container  in interactive mode with

```bash
docker run -i -t clarincuration /bin/bash
```
