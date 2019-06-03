# frozen_string_literal: true

# require 'mina/multistage'
require 'mina/bundler'
require 'mina/rails'
require 'mina/git'
require 'mina/rvm'
require 'mina/puma'
require 'mina/webpacker'
# require 'mina_sidekiq/tasks'

set :application, 'estofado'
set :domain, '159.65.167.71'
set :user, 'deploy'

set :deploy_to, '/var/www/estofado'
set :repository, 'git@github.com:hantys/estofado.git'

set :branch, 'master'

set :forward_agent, true

set :shared_dirs, fetch(:shared_dirs, []).push('log', 'node_modules', 'tmp', 'public/uploads', 'public/assets')
set :shared_files, fetch(:shared_files, []).push('config/database.yml', 'config/application.yml', 'config/secrets.yml')
set :rvm_use_path, '/usr/local/rvm/scripts/rvm'

# set :bundle_bin, '/usr/local/rvm/gems/default/gems/bundler-2.0.1/exe/bundle'

# set :keep_releases, 10

# set :force_asset_precompile, true
task :remote_environment do
  invoke :'rvm:use', 'ruby-2.6.3@default'
end

task :setup do
  command %(mkdir -p "/#{fetch(:shared_path)}/log")
  command %(chmod g+rx,u+rwx "/#{fetch(:shared_path)}/log")

  command %(mkdir -p "/#{fetch(:shared_path)}/node_modules")
  command %(chmod g+rx,u+rwx "/#{fetch(:shared_path)}/node_modules")

  command %(mkdir -p "/#{fetch(:shared_path)}/tmp/pids")
  command %(chmod g+rx,u+rwx "/#{fetch(:shared_path)}/tmp/pids")

  command %(mkdir -p "/#{fetch(:shared_path)}/tmp/sockets")
  command %(chmod g+rx,u+rwx "/#{fetch(:shared_path)}/tmp/sockets")

  command %(mkdir -p "/#{fetch(:shared_path)}/config")
  command %(chmod g+rx,u+rwx "/#{fetch(:shared_path)}/config")

  command %(mkdir -p "/#{fetch(:shared_path)}/public/uploads")
  command %(chmod g+rx,u+rwx "/#{fetch(:shared_path)}/public/uploads")

  command %(mkdir -p "/#{fetch(:shared_path)}/public/assets")
  command %(chmod g+rx,u+rwx "/#{fetch(:shared_path)}/public/assets")

  command %(mkdir -p "#{fetch(:deploy_to)}/shared/pids/")
  command %(mkdir -p "#{fetch(:deploy_to)}/shared/log/")

  command %(touch "/#{fetch(:shared_path)}/config/application.yml")
  command %(touch "/#{fetch(:shared_path)}/config/database.yml")
  command %(touch "/#{fetch(:shared_path)}/config/secrets.yml")
end

desc 'Seed data to the database'
task :seed do
  command %(cd /#{fetch(:current_path)})
  command %(bundle exec rake db:migrate db:seed)
end

desc 'megrate data to the database'
task :migrate do
  command %(cd /#{fetch(:current_path)})
  command %(bundle exec rake db:migrate)
end

task bundle_custom: :remote_environment do
  # command "cd #{deploy_to}/current"
  # command %(mkdir -p "/var/www/estofado/shared/bundle")
  # command %(mkdir -p "./vendor")
  # command %(ln -s "/var/www/estofado/shared/bundle" "./vendor/bundle")

  command 'bundle install --without development test --path "vendor/bundle"'
end

desc 'Compile assets with webpack'
task webpack: :remote_environment do
  # command %{yarn install}
  # command %{NODE_ENV=production RAILS_ENV=production bundle exec rails webpacker:compile}
  command 'bundle exec rails webpacker:compile RAILS_ENV=production'
  # command %{bundle exec rails webpacker:compile}
  # command 'bundle exec rails webpacker:compile RAILS_ENV=production'
end

desc 'Deploys the current version to the server.'
task :deploy do
  on :before_hook do
    # Put things to run locally before ssh
  end
  deploy do
    # Put things that will se invoke :'rbenv:load'ty directory into a fully set-up
    # instance of your projec invoke :'rbenv:load'
    invoke :'git:clone'
    # invoke :'sidekiq:quiet' invoke :'rbenv:load'
    invoke :'deploy:link_shared_paths'
    invoke :bundle_custom
    # invoke :'bundle:install'
    invoke :'rails:db_migrate'
    invoke :'rails:assets_precompile'
    invoke :webpack
    # invoke :'webpacker:compile'
    invoke :'deploy:cleanup'

    on :launch do
      invoke :'puma:restart'
      # invoke :'puma:stop'
      # invoke :'puma:start'
      # invoke :'sidekiq:restart'
      # invoke :'sitemap:refresh'
    end
  end
end
