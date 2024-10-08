### Personal Aliases and Scripts for Efficient Usage

These are personal scripts that I use for various tasks. Feel free to take inspiration or copy them, but make sure to **read the code** before using it, as some scripts may only work for my configuration or may require adjustments.

#### `need` Function

The `need` script installs a package non-intrusively. You can find it [here](https://github.com/x3ric/usr/blob/main/.local/share/bin/need).

```bash
#!/bin/bash
package="$1"
if pacman -Q "$package" &> /dev/null; then
    exit 0
fi
if command -v yay &> /dev/null; then
    echo "Installing $package using yay."
    yes '' | yay --needed -S "$package"
elif command -v pacman &> /dev/null; then
    sudo pacman --needed -Sy "$package"
else
    echo "Install $package with your distro's package manager."
fi
exit 0
```

- The `need` script automatically installs missing packages when used in bash scripts.
- Add it to your `$PATH` as explained [here](https://github.com/x3ric/usr/blob/main/.local/share/bin/need).
- For **Arch Linux**, package names should work without changes. If you're not on Arch, you'll need to modify `need` to work with your package manager and update package names in scripts accordingly.

#### Pentesting Recommendation

For pentesting, I recommend adding the **BlackArch repository** for easy access to tools:

[BlackArch](https://github.com/x3ric/usr/blob/main/.local/share/bin/blackarch)

### Notes

- These scripts are **not plug-and-play**, so you'll need to manually handle path integration and configuration.
- **Always read the code before using it**. Some scripts are specifically tailored to my setup and might need adjustments for your environment.
- I created these scripts for learning and personal use, so they may not be perfect. Some of them might be bloated—**feel free to handpick the ones you find useful**.
- Suggestions and pull requests are always welcome!
