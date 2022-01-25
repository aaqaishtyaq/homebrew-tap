# homebrew-tap
Personal Homebrew Tap

## Usage

```console
NAME=iay
cd util/formulae_builder && go build && cd -
./util/formulae_builder/formulae_builder $NAME 0.1.6 ./util/formulae_builder/config.hcl > ./Formula/$NAME.rb
```
