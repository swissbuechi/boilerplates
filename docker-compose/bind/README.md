
`sudo nano /etc/systemd/resolved.conf`

`DNSStubListener=no`

`sudo systemctl restart systemd-resolved`

## Config Options

- TTL appears in both files and it stands for "Time To Live." TTL tells the DNS server how long to keep its cache in place before requesting a fresh copy. In this case, the TTL is the default setting for all records unless a specific record TTL is set. The default here is 86400 seconds or 24 hours.
- IN stands for Internet. In this case, we aren't actually using the Internet, so think of this as the Intranet.
- SOA stands for "Start Of Authority" or what the primary DNS server is for the domain.
- NS stands for "name server"
- Serial is the value used by the DNS server to verify that the contents of the zone file are up-to-date.
- Refresh specifies how often a slave DNS server should do a zone transfer from the master.
- Retry specifies the length of time in seconds to wait before trying again on a failed zone transfer.
- Expire specifies how long a slave server should wait to answer a query when the master is unreachable.
- A Is the host address or forward record and is only in the forward file (above).
- PTR Is the pointer record better known as the "reverse" and is only in our reverse file (above).