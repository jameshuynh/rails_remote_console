module RailsRemoteConsole
  class Railtie < Rails::Railtie
    rake_tasks do
      load 'tasks/rc.rake'
    end
  end
end
