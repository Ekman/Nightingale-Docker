# Nightingale Docker

> Sorry for the sloppy mess in the repository. I spent an evening on it and never fully got it to work. Haven't had the time to look at it again and I did not expect people would actually start using this that quickly, and apparently it works! I'll sit down sometime soon again and do some proper maintenance, such as tagging.

Run a [Nightingale](https://store.steampowered.com/app/1928980/Nightingale/) dedicated server using Docker. The purpose of this is solution is not to be complete, but rather a minimal way. I don't like over engineered solutions. [Information on how to host a dedicated server can be found on the developers hompage](https://playnightingale.com/dedicated-servers).

## Installation

The image can be found at:

```sh
docker pull ghcr.io/ekman/nightingale:1
```

## Configuration

View the [example `docker-compose.yml` file](docker-compose.yml) for indications on how to install, configure and run this.

### Ports

Open UDP port `7777` on your router and forward it to the hosting server/computer.

### Volumes

Mount all these volumes to your host.

| Directory inside container | Description |
| --- | --- |
| `/home/steam/game` | Contains the game files |

### Configuration

Configure by editing an ini file.
1. Run the server and it will install all the files into the above volumes.
1. Stop the server and open into the `.game/NWX/Config` folder..
1. Copy the `ExampleServerSettings.ini` file to `ServerSettings.ini` in the same folder.
1. Edit the `ServerSettings.ini` file and update the three settings as below.

| Name | Description |
| --- | --- |
| `StartingDifficulty` | Starting map difficulty, choose from [easy, medium, hard, extreme] |
| `Password` | Users must enter this password to enter your server |
| `AdminPassword` | Grants access to the kick/ban commands. Leave empty to disable admin functionality |


### Updating the game files

The game files will update when the container starts. I recommend adding the following cron job to
continuously restart the server:

```sh
0 4 * * * /usr/local/bin/docker-compose --file /path/to/docker-compose.yml restart nightingale >/dev/null 2>&1
```

## Versioning

This project complies with [Semantic Versioning](https://semver.org/).

## Changelog

For a complete list of changes, and how to migrate between major versions, see [releases page](https://github.com/Ekman/Nightingale-Docker/releases).

## Buy me a coffee

[!["Buy Me A Coffee"](https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png)](https://buymeacoffee.com/nekman)

If you appreciate my work, then consider [buying me a coffee](https://buymeacoffee.com/nekman). Donations are completely voluntary.
