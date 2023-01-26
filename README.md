# ts3server-docker
Docker image for run ts3server on arm64 CPUs with box64

## Usage
sh:
```bash
docker run -d -p 9987:9987/udp -p 10011:10011/tcp -p 30033:30033/tcp -e "TS3_LICENSE_ACCEPTED=1" idk1703/ts3server:latest
```

compose:
```yaml
services:
 ts3server:
   image: idk1703/ts3server:latest
   ports:
     - "9987:9987/udp"
     - "10011:10011/tcp"
     - "30033:30033/tcp"
   environment:
     TS3_VOICE_IP: 0.0.0.0
     TS3_VOICE_PORT: 9987
     TS3_QUERY_PORT: 10011
     TS3_FILETRANSFER_PORT: 30033
     TS3_LICENSE_ACCEPTED: 1
     TS3_LICENSE_PATH: path/to/license                                      # if u have license
     TS3_INI_FILE: path/to/ts3server.ini                                    # if u need use ini file
   volumes:
     - "path/to/license:/ts3server/path/to/license"                         # if u have license
     - "/path/to/ts3server.sqlitedb:/ts3server/ts3server.sqlitedb"          # if u have exist db
     - "/path/to/ssh_host_rsa_key:/ts3server/ssh_host_rsa_key"              # if u have exist rsa key
     - "/path/to/query_ip_allowlist.txt:/ts3server/query_ip_allowlist.txt"  # if u need use custom query_ip_allowlist file
     - "/path/to/query_ip_denylist.txt:/ts3server/query_ip_denylist.txt"    # if u need use custom query_ip_allowlist file
     - "/path/to/ts3server.ini:/ts3server/path/to/ts3server.ini"            # if u need use ini file
```