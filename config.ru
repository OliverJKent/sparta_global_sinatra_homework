require "sinatra"
require "pg"
require "yaml"
require "sinatra/reloader" if development?
require_relative "controllers/post_controller.rb"
require_relative "models/post.rb"
use Rack::Reloader
use Rack::MethodOverride
run Post_controller
