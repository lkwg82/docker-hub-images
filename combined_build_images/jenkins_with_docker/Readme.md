Have a jenkins instance with docker inside

```bash
docker run -ti -v /var/run/docker.sock:/var/run/docker.sock lkwg82/jenkins_with_docker
```

Hint: currently it is packaged with docker 1.9
