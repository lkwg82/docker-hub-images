```bash
docker run --cpus 1 --memory 1G --read-only --cap-drop ALL --user 1003:1005 -v "$PWD":/data -ti lkwg82/movie-converter:latest convertCamVideo2ArchivVideo
```