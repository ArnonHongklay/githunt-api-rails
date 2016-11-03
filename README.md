GitHunt API Rails version
=========================

This is a version of https://github.com/apollostack/githunt-api written in Ruby on Rails.

It is instrumented with the optics agent.

## Getting started

1. `bundle install` (you need ruby 2.2+)

2. `rake db:migrate`; `rake db:seed`

3. Get GitHub API keys as discussed: https://github.com/apollostack/githunt-api#running-the-server

4. Get an Optics API key (currently in early access beta)

5. Add environment vars (also discussed above)

6. Run the app

```
bundle exec unicorn -p 3010 -c ./config/unicorn.rb
```

Open http://localhost:3100 to see a GraphiQL instance.

## GitHunt UI

This serve does not include a login system or support for batching, so to use you'll need to run a slightly forked version of GitHunt-React, the `rails branch`.
