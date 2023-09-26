Rails.application.routes.draw do
   get "/about", to: "about#index"

   get "/",  to: "main#index" 
end
