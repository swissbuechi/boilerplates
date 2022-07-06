# Overview

<https://hub.docker.com/u/nginxproxy>

# Configuration

## API Virtual Path

### API Host

`VIRTUAL_HOST=<fqdn>`

`VIRTUAL_PATH=/api/v1.0`

### APP Host

`VIRTUAL_HOST=<fqdn>`

`VIRTUAL_PATH=/`

## Custom SSL Cert

`VIRTUAL_HOST=foo.bar.com` should have a `foo.bar.com.crt` and `foo.bar.com.key`

Custom Cert name:

```yaml
environment:
  - CERT_NAME=foo.bar.com
```

## Do not Redirect to HTTPS

```yaml
environment:
  - HTTPS_METHOD=noredirect 
```

## SSL chipher policy

<https://wiki.mozilla.org/Security/Server_Side_TLS>

Default is `Intermediate`

```yaml
environment:
  - SSL_POLICY=Mozilla-Modern
```

