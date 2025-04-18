
### Personal Aliases and Scripts

These are personal scripts I use for various tasks. Feel free to take inspiration or copy them, but **read the code** before using: some scripts depend on my configuration or require adjustments.

This repo contains scripts I gathered online and some I've written myself.

#### `need` Function

- Installs missing packages non-intrusively when used in bash scripts.
- Source: `https://github.com/x3ric/usr/blob/main/.local/share/bin/need`
- Add to your `$PATH`.
- Works out of the box on Arch Linux. For other distros, adapt the script to use your package manager and update package names.

#### Pentesting Recommendation

For pentesting, I recommend adding the `blackarch` script to enable the BlackArch repository on Arch Linux since some of my scripts use Arch Linux packages:

- Source: `https://github.com/x3ric/usr/blob/main/.local/share/bin/blackarch`

### Notes

- These scripts are **not plug-and-play**. You'll need to handle path integration and configuration manually.
- **Always read the code before using it**; some scripts assume personal setups.
- Provided as-is for learning and inspiration. Some scripts may be bloated—pick what you need.
