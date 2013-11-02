# Pledger

[![Dependency Status](https://gemnasium.com/bhaberer/pledger.png)](https://gemnasium.com/bhaberer/pledger)
[![Build Status](https://travis-ci.org/bhaberer/pledger.png?branch=master)](https://travis-ci.org/bhaberer/pledger)
[![Coverage Status](https://coveralls.io/repos/bhaberer/pledger/badge.png?branch=master)](https://coveralls.io/r/bhaberer/pledger?branch=master)
[![Code Climate](https://codeclimate.com/github/bhaberer/pledger.png)](https://codeclimate.com/github/bhaberer/pledger)

Simple tool to watch various projects for new pledges or donations.

## Installation

Add this line to your application's Gemfile:

    gem 'pledger'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install pledger

## Usage

```
require 'pledger'

client = Pledger::Hipchat.new(HIPCHAT_APIKEY, 'CHAN_NAME')
project = Pledger::Indiegogo.new(PROJECTNAME)
Pledger::Watcher.new(client, project).start

[Pledger] [2013.10.29@14:58:40] Caching current pledges for PROJECTNAME
[Pledger] [2013.10.29@14:58:40] Cached 38 old pledges.
[Pledger] [2013.10.29@14:58:40] Watching for new pledges for PROJECTNAME
[Pledger] [2013.10.29@14:59:00] New pledge cached...
[Pledger] [2013.10.29@14:59:01] USER just pledged $xxx
```

## Current Supported Services

### Serices
* Indiegogo

### Clients 
* HipChat

## Planned Services

### Serices
* Kickstarter
* FundAnything

### Clients 
* IRC
* Campfire

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
