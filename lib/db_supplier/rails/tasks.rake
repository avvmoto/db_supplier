namespace :db do
  namespace :supplier do
    desc 'show migration target databases'
    task defined: :environment do
      raise "This task can be performed in non production." if Rails.env == 'production'
      puts DBSupplier::Migrator.databases.join("\n")
    end

    desc 'Migrate database from DDL files of unmanaged in the Rails App'
    task migrate: :environment  do
      raise "This task can be performed in non production." if Rails.env == 'production'
      DBSupplier::Migrator.migrate
    end

    desc 'Create databases found in the given config'
    task create: :environment  do
      raise "This task can be performed in non production." if Rails.env == 'production'
      DBSupplier::Migrator.create
    end

    desc 'Drop databases found in the given config'
    task drop: :environment  do
      raise "This task can be performed in non production." if Rails.env == 'production'
      DBSupplier::Migrator.drop
    end

    namespace :migrate do
      desc 'Show DDL files of unmanaged in the Rails App'
      task sql: :environment do
        raise "This task can be performed in non production." if Rails.env == 'production'
        puts DBSupplier::Migrator.show_sqls
      end
    end
  end
end
