# dry-web skeleton

Build a Ruby web app with [dry-web](https://github.com/dry-rb/dry-web), [ROM](http://rom-rb.org/) and [Roda](http://roda.jeremyevans.net).

## Installation

You can clone this skeleton using [Raygun](https://github.com/carbonfive/raygun):

```
gem install raygun
rraygun -p icelab/dry-web-skeleton your-app-name
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
