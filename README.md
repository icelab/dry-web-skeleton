# Rodakase Skeleton

## Installation

You can clone this skeleton using [Raygun](https://github.com/carbonfive/raygun):

```
gem install raygun
raygun -p icelab/rom-roda-skeleton your-app-name-here
```

## Development

### First-time setup

Just the bare-bones steps for now:

```
./bin/setup
```

### Running the app

We use the `[bs](https://github.com/educabilia/bs)` to provide environment values from `.env` to the app. Prepend any commands with `./bin/bs`:

```
bundle exec shotgun -p 3000 -o 0.0.0.0 config.ru
```
