defmodule LocationSerializer do
  use Remodel
  @array_root :locations
  
  attributes [:id, :name, :address]
end
