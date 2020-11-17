# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'

require 'rubocop/rake_task'

desc 'run rubocop'
task(:rubocop) do
  require 'rubocop'
  cli = RuboCop::CLI.new
  cli.run
end

task default: [:test, :rubocop]

Rails.application.load_tasks