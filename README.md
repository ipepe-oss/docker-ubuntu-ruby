# docker-ubuntu-ruby

This project is the answer to recently missing support for Debian Strech that is basis for `ruby:2.3.1` image and others. This takes Ubuntu 20.04 as base image and uses <https://github.com/rbenv/ruby-build> to install ruby in specific version. I will try to keep this as compatibile as possible with [official ruby images](https://hub.docker.com/_/ruby).

## How to

Replace:

```Dockerfile
FROM ruby:2.3.1
```

With:

```Dockerfile
FROM ipepe/ubuntu-ruby:2.3.1
```

And it's done!

## Versions

You can check available ruby versions on <https://hub.docker.com/r/ipepe/ubuntu-ruby/tags>. If you cannot find one there, and you really really need one, [create an Issue here](https://github.com/ipepe-oss/docker-ubuntu-ruby/issues/new)