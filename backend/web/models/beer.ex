defmodule WeWorkForBeer.Beer do
  use WeWorkForBeer.Web, :model

  alias WeWorkForBeer.Beer
  alias WeWorkForBeer.FloorBeer
  alias WeWorkForBeer.Repo

  schema "beers" do
    has_many :floor_beers, FloorBeer
    has_many :floors, through: [:floor_beers, :floor]

    field :uid, :string
    field :name, :string
    field :style, :string
    field :abv, :decimal
    field :description, :string
    field :icon_small, :string
    field :icon_medium, :string
    field :icon_large, :string
    field :brewery_name, :string

    timestamps
  end

  @required_fields ~w(uid name)
  @optional_fields ~w(style abv description icon_small icon_medium icon_large brewery_name)

  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> validate_unique(:uid, on: Repo)
  end

  def find_by_uid(uid) do
    query = from b in Beer,
            where: b.uid == ^uid

    Repo.one query
  end

  def search(query, search_query) do
    (from b in query, 
      where: fragment("(to_tsvector('english', name||' '||brewery_name) @@ plainto_tsquery('english', ?))", ^search_query))
  end
end
