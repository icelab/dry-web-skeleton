# Rodakase Skeleton

## Installation

You can clone this skeleton using a (temporary) fork of [Raygun](https://github.com/carbonfive/raygun) (that properly renames directories):

```
gem install rraygun
rraygun -p icelab/rodakase-skeleton your-app-name
```

## Development

### First-time setup

Just the bare-bones steps for now:

```
./bin/setup
```

### Running the app

```
bundle exec shotgun -p 3000 -o 0.0.0.0 config.ru
```
