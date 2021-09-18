# Personal Portfolio Website

This is complete Rails application built from scratch for my personal blogging website [Ernest Addae](https://www.earnestaddae.me)

The idea for building this application was inspired by [Real Python](https://realpython.com/). Therefore, most of the features in the application were borrowed from Real Python

The nature of the application requires that I `modularize` most of the features from the start via [namespacing](https://guides.rubyonrails.org/routing.html#controller-namespaces-and-routing)

For easy things like **liking**, **sharing**, and **tagging** articles I avoided gems such as ActsAsVotable or ActsAsTaggableOn.

## Technology stack
1. Ruby 3.0.1
2. Rails 6.1.3
3. Postgresql
4. Bootstrap 4.6
5. Font Awesome 4.7

## Core features
1. User authentication 
2. User authtorization as `reader`, `writer` and `admin`
3. Accept markdown syntax for article and comment with beautiful syntax highlighting and add as many tags as possible
4. Save article in `draft` or `published` mode
5. Ability to `like`, `bookmark` or `mark as complete`
6. Share articles via __twitter__, __facebook__, __linkedin__ or __email__
7. Full text search for articles with ranked results
8. `Writer` and `Admin` dashboards
9. Add reCAPTCHA to prevent bots from abusing the application 
  - You will need to setup the [reCAPTCHA API](https://www.google.com/recaptcha/about/) credentials. The reCAPTCHA version used is v2
  - Uncomment `prepend_before_action :check_captcha, only: [:create]` in the `app/users/passwords_controller.rb`, `app/users/registrations_controller.rb` and ``app/users/sessions_controller.rb``
  - Uncomment `<%= recaptcha_tags %>` in `app/views/devise/passwords/new.html.erb`, `app/views/devise/registrations/new.html.erb` and `app/views/devise/sessions/new.html.erb`

## Setup

1. Pull down the app from version control
2. Make sure you have Postgres running
3. `bin/setup`

## Starting the Server

1. `bin/run`
2. Please visit the localhost as this **http://localhost:3000/**

## Project homepage
![Personal Blog](https://github.com/earnestaddae/ernestaddae/blob/main/app/assets/images/blog.png)

## Project Writer dashboard
![Writer Dashboard](https://github.com/earnestaddae/ernestaddae/blob/main/app/assets/images/dashboard.png)

## Attributions
This application wouldn't have been possible without a wonderful web framework like [Ruby on Rails](https://rubyonrails.org/), an expressive language like [Ruby](https://www.ruby-lang.org/en/), accessible [RubyGems](https://rubygems.org/), and the community of selfless Rubyists.

## Contributions & Issues
Whenever, I find something interesting to add, I will do so. You are welcome to use this project as you want. 

However, if there are features you want added that will be beneficial to others, you can add it and issue a [PR](https://github.com/earnestaddae/ernestaddae/pulls). Furthermore, if you want a feature, but can't build yourself, [create an issue](https://github.com/earnestaddae/ernestaddae/issues) and I will try to add in due time.

