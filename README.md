# rainbows-emtp [![Build Status](https://secure.travis-ci.org/godfat/rainbows-emtp.png?branch=master)](http://travis-ci.org/godfat/rainbows-emtp)

by Lin Jen-Shin ([godfat](http://godfat.org))

## LINKS:

* [github](https://github.com/godfat/rainbows-emtp)
* [rubygems](https://rubygems.org/gems/rainbows-emtp)
* [rdoc](http://rdoc.info/github/godfat/rainbows-emtp)

## DESCRIPTION:

EventMachineThreadPool model for Rainbows!

## REQUIREMENTS:

* gem 'rainbows'
* gem 'eventmachine'

## INSTALLATION:

    gem install rainbows-emtp

## SYNOPSIS:

Here's a Rainbows! config example:

``` ruby
Rainbows! do
  use :EventMachineThreadPool, :pool_size => 10
end
```

## CAVEAT:

This does not work for large chunked pipelined requests for now.
If you don't know what's that, then probably you're not using it anyway.

## CONTRIBUTORS:

* Lin Jen-Shin (@godfat)

## LICENSE:

Apache License 2.0

Copyright (c) 2013, Lin Jen-Shin (godfat)

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

<http://www.apache.org/licenses/LICENSE-2.0>

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
