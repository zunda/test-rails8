# Test Rails 8
A minimal app for me to test features on Rails 8. To deploy as a Heroku app:

```
heroku create
heroku addons:create heroku-postgresql
heroku pg:wait
git push heroku main
heroku open
```

## Features
### Rails cache
Solid Cache is configured to store cache on the file system. The cached time shown on the home page might be inconsistent among web dynos.

```ruby
# cconfig/environments/production.rb
config.cache_store = :file_store, "#{root}/tmp/cache/"
```

### Action Cable
Solid Cable is configured to use the database to manage subscriptions and messages.

The chat messages are sent to browsers that simultaneously have the same page open but are never stored.

## License
Copyright 2024 zunda <zunda at gmail.com>

MIT License

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
