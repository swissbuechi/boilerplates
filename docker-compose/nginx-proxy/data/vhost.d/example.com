location /<path> {
  proxy_pass http://<container_name>/<path>;
}