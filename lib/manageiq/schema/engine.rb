module ManageIQ
  module Schema
    class Engine < ::Rails::Engine
      isolate_namespace ManageIQ::Schema

      initializer :append_migrations do |app|
        unless app.root.to_s.match root.to_s
          config.paths["db/migrate"].expanded.each do |expanded_path|
            app.config.paths["db/migrate"] << expanded_path
          end
          ActiveRecord::Migrator.migrations_paths = app.config.paths["db/migrate"]
        end
      end
    end
  end
end
