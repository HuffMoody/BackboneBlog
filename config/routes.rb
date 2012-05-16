BackboneBlog::Application.routes.draw do
  
  scope "api" do
    resources :articles do
      get "newest", on: :collection
    end
  end

  root :to => "main#index"
  match "*path" => "main#index"
end
