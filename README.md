# Blockheads Server

The server for The Blockheads in a Docker container. Unofficial, unsupported by Dave or Majic Jungle.

```sh
docker run --restart=always -v "$PWD/saves:/saves" -p 15151:15151/udp ghcr.io/wingysam/blockheads-docker --new "MY WORLD" --no-exit
```

If you see an error like "No such file or directory", you may need to fix your permissions. Try this:

```
sudo chown 537828491:537828491 saves
```

The magic 537828491 number is because I (Wingy) chose it arbitrarily in the Dockerfile.

## Command-line Arguments

```
Usage: blockheads_server [options]

Version:1.7.1

When run without options, the most recent world will be loaded.
Available options:
        --list (-l) list all available worlds.
        --new WORLD_NAME (-n) create a new world named WORLD_NAME.
        --world_id WORLD_ID (-i) when used with --new, assigns the given id to the newly created world. Otherwise ignored.
        --load WORLD_ID [options] (-o) load the world with the id WORLD_ID.
        --rename-from WORLD_NAME_OR_ID (-r) --rename_to NEW_NAME (-t) rename the world with the id or name WORLD_NAME_OR_ID to NEW_NAME.
        --delete WORLD_NAME_OR_ID (-d) delete the world with the id or name WORLD_NAME.
        --force -f when used with --delete, doesn't prompt for confirmation.
        --port PORT (-p) the port to run on when specified with --new or --load. Default is 15151.
        --max_players MAX (-m) the maximum number of players that will be allowed to connect at once. Default is 16, max is 32.
        --save_delay SECONDS (-s) will only save the world to disk every n seconds (default is 1). This is useful to limit disk activity, but more progress will be lost in the event of a crash or unclean exit.
        --world_width WORLD_WIDTH (-w) (optional) used when creating a new world to sepecify how big the world should be. WORLD_WIDTH must be one of '1/16', '1/4', '1' (default), '4' or '16'. 4 and 16 are 4x and 16x the normal size.
        --custom-rules RULES (-C) (optional) used when creating a new world to sepecify that the world should be created with custom rules enabled. RULES is a json string containing world generation rules.
        --convert-to-custum-rules (-V) (optional) used when loading a world to sepecify that the world should be converted from a vanilla world to a custom rules world.
        --expert-mode (-e) (optional) used when creating a world to select expert mode.
        --help (-h) display this help text
```

### Undocumented Command-line Arguments

* `--no-exit` prevents the server from shutting down when the last player leaves. This means that chat doesn't clear every time the last player leaves.
