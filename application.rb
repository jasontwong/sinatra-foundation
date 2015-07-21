require 'rubygems'
require 'bundler/setup'
Bundler.require(:default)
require 'sinatra/base'

class App < Sinatra::Base
  set :root, File.dirname(__FILE__)
  # {{{ assets
  register Sinatra::AssetPack
  assets {
    serve '/js', from: 'js'
    serve '/bower_components', from: 'bower_components'

    js :modernizr, [
      '/bower_components/modernizr/modernizr.js',
    ]

    js :libs, [
      '/bower_components/jquery/dist/jquery.js',
      '/bower_components/foundation/js/foundation.js',
      '/bower_components/foundation/js/foundation/foundation.topbar.js'
    ]

    js :application, [
      '/js/app.js'
    ]

    js_compression :jsmin
  }

  # }}}
  # {{{ get '/' do
  get '/' do
    slim :index
  end
  
  # }}}
end
