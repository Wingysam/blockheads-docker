# Blockheads Server

The server for The Blockheads in a Docker container. Unofficial, unsupported by Dave or Majic Jungle.

```sh
docker run --rm -p 15151:15151/udp ghcr.io/wingysam/blockheads-docker --new "MY WORLD"
# Once you leave, the server will shut down and the save will be deleted. See documentation for docker run for information on volume mounts.
# Saves are stored in /saves.
```