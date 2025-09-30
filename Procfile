web: trap '' SIGTERM; puma -C config/puma.rb & bin/jobs & wait -n; kill -SIGTERM -$$; wait
release: bundle exec rake db:migrate
