# flux-installer

One command to a crackle-free, low-latency Flux environment.

```bash
./scripts/install.sh            # Linux: tune PipeWire, install host + plugins
./scripts/install.sh --dry-run  # show what would change
```

## What it does
1. Adds the user to the `audio` group and checks `rtkit` / realtime limits
2. Installs a WirePlumber/PipeWire drop-in forcing quantum 64 @ 48 kHz (~1.3 ms)
3. Installs the host (Flatpak manifest in `flatpak/`)
4. Fetches the bundled plugin suite: Surge XT, Six Sines, DecentSampler, Plugdata (+Cyclone), Cardinal, Neural Amp Modeler
5. Drops the DrivenByMoss controller extension in place (Push / Launchpad / APC)

## Status
Start here: step 2 is implemented as a dry-run-able script; steps 3-5 are manifests/TODOs.
