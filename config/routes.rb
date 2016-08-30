Rails.application.routes.draw do


# localhost:3000/veggies/soil='loamy'&zone='3'
# /veggies/search?soil=loamy&zone=6    DO I NEED TO INCLUDE "SEARCH?" ?

get   '/veggies' => 'veggies#find',  as: :veggies
get   '/veggies/:id' => "veggies#show"


# localhost:3000/fruits/veggies=['carrots', 'celery', 'kale'] ********* IS THIS OK? *********
# if no veggies are given, send along just soil and zone info....

# maybe theres a SKIP button on the veggie list view in ember that sends a diff params to the get request into the url than the SUBMIT button?
# like SUBMIT = get '/fruits' => 'fruits#find'   if they're submitting veggies so 1 parameter into the find method
# OR  SKIP =  get '/fruits/skipped' => 'fruits#skip' if theyve not chosen veggies, so 2 paramters into the skip method (soil and zone)

get   '/fruits' => 'fruits#find',  as: :fruits

get   '/fruits/skipped' => 'fruits#skip',  as: :vegskip

# resources :herbs, only: [:index, :show]
# localhost:3000/herbs/fruits=['strawberries']
# if no fruits are given, send along veggies, if no veggies, send along soil and zone info

# **ALSO  I WANT TO RETURN HERBS THAT MATCH FRUIT COMPANIONS OR VEGGIE COMPANIONS
# I'LL NEED TO PASS PARAMETERS FOR VEGGIES AND HERBS
get   '/herbs' => 'herbs#find',  as: :herbs

# WHAT IF THEY DIDNT CHOOSE VEGGIES OR/AND FRUIT?
get   '/herbs/skipped' => 'herbs#skip',  as: :fruitskip


# resources :flowers, only: [:index, :show]
# localhost:3000/flowers
# if no herbs are given, send along herbs, if no fruits, send along veggies, if no veggies, send along soil and zone info

# **ALSO  I WANT TO RETURN FLOWERS THAT MATCH HERB COMPANIONS, FRUIT COMPANIONS OR VEGGIE COMPANIONS
# I'LL NEED TO PASS PARAMETERS FOR HERBS, VEGGIES AND HERBS
get   '/flowers' => 'flowers#find',  as: :flowers

get   '/flowers/skipped' => 'flowers#skip',  as: :herbskip



resources :users, :only => [:new, :create, :edit] do
    resources :plots

end


#   Prefix Verb   URI Pattern                              Controller#Action
#        veggies GET    /veggies(.:format)                       veggies#index
#          veggy GET    /veggies/:id(.:format)                   veggies#show
#         fruits GET    /fruits(.:format)                        fruits#index
#          fruit GET    /fruits/:id(.:format)                    fruits#show
#          herbs GET    /herbs(.:format)                         herbs#index
#           herb GET    /herbs/:id(.:format)                     herbs#show
#        flowers GET    /flowers(.:format)                       flowers#index
#         flower GET    /flowers/:id(.:format)                   flowers#show
#     user_plots GET    /users/:user_id/plots(.:format)          plots#index
#                POST   /users/:user_id/plots(.:format)          plots#create
#  new_user_plot GET    /users/:user_id/plots/new(.:format)      plots#new
# edit_user_plot GET    /users/:user_id/plots/:id/edit(.:format) plots#edit
#      user_plot GET    /users/:user_id/plots/:id(.:format)      plots#show
#                PATCH  /users/:user_id/plots/:id(.:format)      plots#update
#                PUT    /users/:user_id/plots/:id(.:format)      plots#update
#                DELETE /users/:user_id/plots/:id(.:format)      plots#destroy
#          users POST   /users(.:format)                         users#create
#       new_user GET    /users/new(.:format)                     users#new
#       edit_user GET    /users/:id/edit(.:format)                users#edit
#            erd        /erd                                     Erd::Engine
#
# Routes for Erd::Engine:
#         GET  /                  erd/erd#index
#         PUT  /                  erd/erd#update
# migrate PUT  /migrate(.:format) erd/erd#migrate
#    root GET  /                  erd/erd#index





  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end

# [
#   [celery, carrots],
#   [broccoli, celery],
#   []
# ]
# howthey make pixels, add pixels to each plant in database, add the whole array of arrays up for a total pixel number then allocate pixels per plant based on that
# look up how pixelation works
