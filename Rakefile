require 'bundler'

Bundler.require

task :default do
  puts "Available actions:"
  %w(call messages switchboard verification).each do |action|
    puts action.rjust(24) + " :: " + [
        ENV['DOMAIN'], 
        ENV['SECRET'], 
        action
      ].join("/")
  end
end
