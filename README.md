# Pledger

TODO: Write a gem description

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

client = Pledger::Hipchat.new(HIPCHAT_APIKEY, 'Bot')
project = Pledger::Indiegogo.new(PROJECTNAME)
Pledger::Watcher.new(client, project).start

[Pledger] [2013.10.29@14:58:40] Caching current pledges for PROJECTNAME
[Pledger] [2013.10.29@14:58:40] Cached 38 old pledges.
[Pledger] [2013.10.29@14:58:40] Watching for new pledges for PROJECTNAME
[Pledger] [2013.10.29@14:59:00] New pledge cached...
[Pledger] [2013.10.29@14:59:01] USER just pledged $xxx
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
