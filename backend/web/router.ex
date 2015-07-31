defmodule WeWorkForBeer.Router do
  use Phoenix.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", WeWorkForBeer do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end


  scope "/api/v1", alias: WeWorkForBeer do
    pipe_through :api

    post "token", APIKeyController, :create

    resources "beers", BeerController, only: [:index, :show]
    resources "floor_beers", FloorBeerController, only: [:create, :update]
    resources "floors", FloorController, only: [:index, :show]
    resources "locations", LocationController, only: [:index, :show]
  end

  # Other scopes may use custom stacks.
  # scope "/api", WeWorkForBeer do
  #   pipe_through :api
  # end
end
