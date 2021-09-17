Rails.application.routes.draw do

  namespace :account do
    root "application#index"
    resources :users, only: [:update]
    resource  :profile, only: [:new, :create, :update]
  end

  namespace :writer do
    root "application#index"
    resources :articles, except: [:index, :show], path: "tutorials" do
      member do
        post "upload_file" => "articles#upload_file"
        # delete "tags/remove/:id", to: "tags#destroy", as: :remove_tag
      end
    end
    resource  :profile, except: [:destroy]
  end

  namespace :admin do
    root "application#index"
    resources :categories
    resources :users
  end

  # devise_for :users
  devise_for :users, path: 'users', controllers: { registrations: "users/registrations", sessions: "users/sessions", passwords: "users/passwords"}


  resources :articles, only: [:index, :show], path: "tutorials" do
    resources :comments, only: [:create]
    member do
      post "bookmark" => "bookmarks#create"
      delete "unbookmark" => "bookmarks#destroy"

      post "like" => "likes#create"
      delete "unlike" => "likes#destroy"

      post "mark" => "marks#create"
      delete "unmark" => "marks#destroy"

      
    end
    delete "tags/remove/:id", to: "tags#destroy", as: :remove_tag
  end

  resources :categories, only: [:index, :show]
  resources :tags, only: [:index, :show]
  resources :users, only: [:index, :show], path: "authors" do
    member do
      post "subscribe" => "subscriptions#create"
      get "new_subscribe" => "subscriptions#new"
    end
  end
  resources :bookmarks, only: [:index]
  resources :likes, only: [:index]
  resources :marks, only: [:index]
  resources :levels, only: [:show]
  resources :newsletters, only: [:index, :new, :create, :show], path: "newsletter"
  resources :feedbacks, only: [:new, :create], path: "feedback"
  resources :search, only: [:index], path: "search"

  get "/start", to: "start_here#index", as: :start
  get "/ruby-basics", to: "start_here#ruby_basics", as: :ruby_basics
  get "/ruby-intermediate", to: "start_here#ruby_intermediate", as: :ruby_intermediate
  get "/learn-rails", to: "start_here#learn_rails", as: :learn_rails
  get "/write-with-us", to: "home#become_writer", as: :with_us

  root "home#index"
end
