web: trap '' SIGTERM; bundle exec puma -C config/puma.rb & bundle exec bin/jobs & wait -n; kill -SIGTERM -$$; wait
release: bundle exec rake db:migrate
