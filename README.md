# terraria-server

This is the fork of [SolusOperandi](https://github.com/SolusOperandi/terraria-server)'s repository aimed to be
OpenShift-compliant and run in user mode.

## Versioning

We follow TShock's versioning system. If there is a new release of TShock, we update the repository accordingly to deploy
with the new version.

We suggest looking at [TShock](https://github.com/Pryaxis/TShock) if you want to contribute.

## Running

We require Docker or Podman to run the container, but I highly suggest Podman since its more structured and modular.

`docker pull chinodesuuu/terraria-server:latest` or  `podman pull chinodesuuu/terraria-server:latest`.

for version-specific, just do for example v4.3.25, `docker pull chinodesuuu/terraria-server:v4.3.25` or `podman pull chinodesuuu/terraria-server:v4.3.25`.

## License

TShock is Copyright &copy; Pyraxis under GPL 3.0.

This fork is licensed under Apache 2.0.