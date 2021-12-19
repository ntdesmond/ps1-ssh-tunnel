# ps1-ssh-tunnel
Quick port forwarding via SSH tunnels

Originally the scripts were created to connect two Windows 10 hosts behind NAT to each other:
```
+----------+  ssh -R  +-----------------+  ssh -L  +----------+
|  Host 1  | <------- |    Publicly     | <------- |  Host 2  |
| (server) | -------> | accessible host | -------> | (client) |
+----------+          +-----------------+          +----------+
```

## Setup
1. Clone the repo
2. Use `setup.ps1` to configure settings in interactive mode or edit config.txt directly
3. Launch `client_tunnel.ps1` or `server_tunnel.ps1` depending on your needs