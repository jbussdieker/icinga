# Icinga

[![Build Status](https://secure.travis-ci.org/jbussdieker/icinga.png?branch=master)](https://travis-ci.org/jbussdieker/icinga)

Facilitates communication with Icinga servers.

## Installation

Add this line to your application's Gemfile:

    gem 'icinga'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install icinga

## Usage

`````
require 'icinga'

server = Icinga::Server.new(:host => "mon.example.com")
puts server.hosts
puts server.services
`````

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
