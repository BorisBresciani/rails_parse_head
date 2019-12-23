# frozen_string_literal: true

require 'bundler/gem_tasks'
require 'rspec/core/rake_task'
require 'coveralls/rake/task'

RSpec::Core::RakeTask.new(:spec)

task default: :spec

Coveralls::RakeTask.new
task test_with_coveralls: %w[spec coveralls:push]
