require_relative 'config/environment'
require 'sinatra/activerecord/rake'

desc 'starts a console'
task :console do
  ActiveRecord::Base.logger = nil 
  Pry.start
end

#Logger.new(STDOUT)