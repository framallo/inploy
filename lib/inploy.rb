require 'inploy/helper'
require 'inploy/dsl'
require 'inploy/deploy'

module Inploy
  class Railtie < ::Rails::Railtie
    rake_tasks do
      load 'tasks/inploy.rake'
    end
  end
end if Rails::VERSION::MAJOR == 3 
