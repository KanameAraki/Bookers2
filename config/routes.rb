Rails.application.routes.draw do
  get '/search' => "search#search"
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#top"
  get "home/about"=>"home#about"

  resources:users,only:[:show,:index,:edit,:update] do
    member do
      get :followeds, :followers
    end
    resources:relationships,only:[:create,:destroy]
  end

# resources:relationships,only:[:create,:destroy]

  resources:books,only:[:create,:index,:show,:destroy,:edit,:update] do
    resource:favorites,only:[:create,:destroy]
    resources:book_comments,only:[:create,:destroy]
  end

end
