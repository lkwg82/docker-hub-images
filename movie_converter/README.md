```bash
docker run --memory 1G --read-only --cap-drop ALL --user $(id -u):$(id -g) -v "$PWD":/data -ti lkwg82/movie-converter:latest convertCamVideo2ArchivVideo
```