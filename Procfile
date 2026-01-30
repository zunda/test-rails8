web: bundle exec puma -C config/puma.rb & bundle exec bin/jobs & cpids=`pgrep -P $$`; trap 'for pid in $cpids; do kill -TERM $pid; done' SIGTERM; wait -n; kill -TERM -$$; wait
release: bundle exec rake db:migrate
