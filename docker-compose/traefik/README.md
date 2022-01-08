# Installation

## Self-Signed Certificates
According to traefik's documentation it will automatically generate self-signed Certificates if no Default Certificate is provided. If you'd like to overwrite the self-signed Certificate with your own, uncomment the section for 
```yaml 
# (Optional) Overwrite Default Certificates
tls:
  stores:
    default:
      defaultCertificate:
        certFile: /etc/traefik/certs/cert.pem
        keyFile: /etc/traefik/certs/cert-key.pem
```
Replace the `/etc/traefik/certs/cert.pem` with your certificate file, and the `/etc/traefik/certs/cert-key.pem` with your certificate key.
