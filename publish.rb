#!/usr/bin/env ruby
RUBY_VERSIONS = [
  "2.3.1", "2.3.8",
  "2.4.10",
  "2.5.9",
  "2.6.10",
  "2.7.2", "2.7.5", "2.7.6", "2.7.7", "2.7.8",
  "3.0.4", "3.0.5", "3.0.6",
  "3.1.2", "3.1.3", "3.1.4",
  "3.2.2"
].freeze

RUBY_VERSIONS.sort.each do |ruby_version|
  ruby_major = ruby_version.split(".").take(2).join(".")
  image_name = "ipepe/ubuntu-ruby:#{ruby_version}"
  puts "Building #{image_name}"
  `docker build . --tag "#{image_name}" --build-arg RUBY_VERSION=#{ruby_version} --build-arg RUBY_MAJOR=#{ruby_major}`
  puts "Pushing #{image_name}"
  `docker push "#{image_name}"`

  image_name = "ipepe/ubuntu-ruby:#{ruby_major}"
  puts "Building #{image_name}"
  `docker build . --tag "#{image_name}" --build-arg RUBY_VERSION=#{ruby_version} --build-arg RUBY_MAJOR=#{ruby_major}`
  puts "Pushing #{image_name}"
  `docker push "#{image_name}"`
end
