# Homebrew Tap

Personal Homebrew Tap

## What is Homebrew?

Package manager for macOS (or Linux), see more at [brew.sh](https://brew.sh)

## What is a Tap?

A third-party (in relation to Homebrew) repository providing installable
packages (formulae) on macOS and Linux.

See more at [docs.brew.sh/Taps](https://docs.brew.sh/Taps)

## How do I install packages from here?

```sh
brew install aaqaishtyaq/tap/name
```

You can also only add the tap which makes formulae within it
available in search results (`brew search` output):

```sh
brew tap aaqaishtyaq/tap
```

Note: to clone the tap via SSH you will need to use:

```sh
brew tap aaqaishtyaq/tap https://github.com/aaqaishtyaq/homebrew-tap
```

While you may search across taps, it is necessary to always use
fully qualified name (incl. the `aaqaishtyaq/tap/` prefix)
when refering to formulae in external taps such as this one
outside of search.

## Contributing

Check out the [contribution guidelines for this project](./CONTRIBUTING.md)
