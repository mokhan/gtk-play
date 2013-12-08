#!/usr/bin/env ruby
$:.unshift(File.join(File.dirname(__FILE__), '../lib'))
require 'application'

Application.new.run(ARGV)
