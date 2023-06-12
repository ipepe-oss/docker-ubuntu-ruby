#!/usr/bin/env ruby
RUBY_VERSIONS = [
  "2.3.8"
].freeze

RUBY_VERSIONS.each do |ruby_version|
  image_name = "ipepe/ubuntu-ruby:#{ruby_version}-dev"
  puts "Building #{image_name}"
  `docker build . --tag "#{image_name}" --build-arg RUBY_VERSION=#{ruby_version}`
  puts "Pushing #{image_name}"
  `docker push "#{image_name}"`
end
