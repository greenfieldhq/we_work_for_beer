alias WeWorkForBeer.Location
alias WeWorkForBeer.Repo

locations_attrs = [
  %{
    city: "Amsterdam",
    address: "Weteringschans 165, Amsterdam, 1017XD",
    name: "Weteringschans",
    floors: [%{name: "Floor 1"}, %{name: "Floor 2"}, %{name: "Floor 3"}]
  },
  %{
    city: "Austin",
    address: "600 Congress Ave",
    name: "Congress",
    floors: [%{name: "Floor 1"}, %{name: "Floor 14"}]
  },
  %{
    city: "Berkeley",
    address: "2120 University Avenue",
    name: "Berkeley",
    floors: [%{name: "Floor 2"}, %{name: "Floor 3"}, %{name: "Floor 4"}, %{name: "Floor 5"}, %{name: "Floor 6"}, %{name: "Floor 7"}]
  },
  %{
    city: "Boston",
    address: "51 Melcher Street",
    name: "Fort Point",
    floors: [%{name: "Floor 0"}, %{name: "Floor 1"}, %{name: "Floor 2"}, %{name: "Floor 6"}, %{name: "Floor 7"}]
  },
  %{
    city: "Boston",
    address: "745 Atlantic Ave",
    name: "South Station",
    floors: [%{name: "Floor 2"}, %{name: "Floor 3"}, %{name: "Floor 4"}, %{name: "Floor 7"}, %{name: "Floor 8"}, %{name: "Floor 9"}, %{name: "Floor 10"}, %{name: "Floor 11"}]
  },
  %{
    city: "Chicago",
    address: "111 West Illinois St",
    name: "River North",
    floors: [%{name: "Floor 5"}]
  },
  %{
    city: "New York",
    address: "205 E 42nd St",
    name: "42nd Street",
    floors: [%{name: "Floor 14"}, %{name: "Floor 15"}, %{name: "Floor 16"}, %{name: "Floor 17"}, %{name: "Floor 19"}, %{name: "Floor 20"}, %{name: "Floor 21"}]
  },
  %{
    city: "New York",
    address: "54 W. 40th Street",
    name: "Bryant Park",
    floors: [%{name: "Floor 3"}, %{name: "Floor 4"}, %{name: "Floor 5"}, %{name: "Floor 6"}, %{name: "Floor 7"}, %{name: "Floor 8"}, %{name: "Floor 9"}, %{name: "Floor 10"}, %{name: "Floor 11"}]
  },
  %{
    city: "New York",
    address: "25 Broadway",
    name: "Charging Bull",
    floors: [%{name: "Floor 5"}, %{name: "Floor 9"}, %{name: "Floor 10"}]
  },
  %{
    city: "New York",
    address: "115 W 18th St",
    name: "Chelsea",
    floors: [%{name: "Floor 2"}, %{name: "Floor 3"}]
  },
  %{
    city: "New York",
    address: "349 5th Avenue",
    name: "Empire State",
    floors: [%{name: "Floor 3"}, %{name: "Floor 4"}, %{name: "Floor 5"}, %{name: "Floor 6"}, %{name: "Floor 7"}, %{name: "Floor 8"}]
  },
  %{
    city: "New York",
    address: "85 Broad Street",
    name: "FiDi",
    floors: [%{name: "Floor 16"}, %{name: "Floor 17"}, %{name: "Floor 18"}, %{name: "Floor 28"}, %{name: "Floor 29"}]
  },
  %{
    city: "New York",
    address: "222 Broadway",
    name: "Fulton Center",
    floors: [%{name: "Floor 18"}, %{name: "Floor 19"}, %{name: "Floor 20"}, %{name: "Floor 21"}, %{name: "Floor 22"}, %{name: "Floor 23"}, %{name: "Floor 24"}, %{name: "Floor 25"}, %{name: "Floor 26"}]
  },
  %{
    city: "New York",
    address: "120 E. 23rd St",
    name: "Gramercy",
    floors: [%{name: "Floor 2"}, %{name: "Floor 4"}, %{name: "Floor 5"}]
  },
  %{
    city: "New York",
    address: "261 Madison Avenue",
    name: "Madison",
    floors: [%{name: "Floor 9"}, %{name: "Floor 10"}]
  },
  %{
    city: "New York",
    address: "1 Little West 12th Street",
    name: "Meatpacking",
    floors: [%{name: "Floor 2"}, %{name: "Floor 3"}, %{name: "Floor 4"}, %{name: "Floor 5"}, %{name: "Floor 6"}]
  },
  %{
    city: "New York",
    address: "79 Madison Ave",
    name: "NoMad",
    floors: [%{name: "Floor 2"}, %{name: "Floor 3"}, %{name: "Floor 4"}, %{name: "Floor 5"}, %{name: "Floor 6"}, %{name: "Floor 7"}, %{name: "Floor 9"}]
  },
  %{
    city: "New York",
    address: "401 Park Avenue South",
    name: "Park South",
    floors: [%{name: "Floor 8"}, %{name: "Floor 9"}, %{name: "Floor 10"}]
  },
  %{
    city: "New York",
    address: "154 Grand Street",
    name: "Soho",
    floors: [%{name: "Floor 1"}, %{name: "Floor 2"}, %{name: "Floor 3"}, %{name: "Floor 4"}, %{name: "Floor 5"}, %{name: "Floor 6"}]
  },
  %{
    city: "New York",
    address: "175 Varick Street",
    name: "Soho West",
    floors: [%{name: "Floor 0"}, %{name: "Floor 2"}, %{name: "Floor 3"}, %{name: "Floor 4"}, %{name: "Floor 5"}, %{name: "Floor 6"}, %{name: "Floor 8"}]
  },
  %{
    city: "New York",
    address: "379 West Broadway",
    name: "West Broadway",
    floors: [%{name: "Floor 2"}, %{name: "Floor 3"}, %{name: "Floor 4"}, %{name: "Floor 5"}]
  },
  %{
    city: "Herzliya",
    address: "1 Shankar St",
    name: "Herzliya",
    floors: [%{name: "Floor 0"}, %{name: "Floor 1"}]
  },
  %{
    city: "London",
    address: "2 Sheraton St",
    name: "Medius",
    floors: [%{name: "Floor 2"}]
  },
  %{
    city: "London",
    address: "22 Upper Ground",
    name: "South Bank",
    floors: [%{name: "Floor 4"}, %{name: "Floor 5"}, %{name: "Floor 6"}, %{name: "Floor 7"}, %{name: "Floor 8"}]
  },
  %{
    city: "Los Angeles",
    address: "7083 Hollywood Boulevard",
    name: "Hollywood",
    floors: [%{name: "Floor 1"}, %{name: "Floor 4"}, %{name: "Floor 5"}]
  },
  %{
    city: "San Francisco",
    address: "25 Taylor Street",
    name: "Golden Gate",
    floors: [%{name: "Floor 2"}, %{name: "Floor 3"}, %{name: "Floor 4"}, %{name: "Floor 5"}, %{name: "Floor 6"}, %{name: "Floor 7"}]
  },
  %{
    city: "San Francisco",
    address: "156 2nd Street",
    name: "SOMA",
    floors: [%{name: "Floor 0"}, %{name: "Floor 1"}, %{name: "Floor 2"}, %{name: "Floor 3"}, %{name: "Floor 4"}, %{name: "Floor 5"}, %{name: "Floor 6"}]
  },
  %{
    city: "Seattle",
    address: "500 Yale Avenue North",
    name: "South Lake Union",
    floors: [%{name: "Floor 1"}, %{name: "Floor 2"}, %{name: "Floor 3"}]
  },
  %{
    city: "Tel Aviv",
    address: "7 Dubnov",
    name: "Dubnov",
    floors: [%{name: "Floor 0"}, %{name: "Floor 1"}, %{name: "Floor 2"}, %{name: "Floor 3"}]
  },
  %{
    city: "Washington",
    address: "718 7th Street NW",
    name: "Chinatown",
    floors: [%{name: "Floor 2"}, %{name: "Floor 3"}, %{name: "Floor 4"}]
  },
  %{
    city: "Washington",
    address: "1875 Connecticut Ave NW",
    name: "Dupont Circle",
    floors: [%{name: "Floor 3"}, %{name: "Floor 10"}, %{name: "Floor 12"}]
  },
  %{
    city: "Washington",
    address: "641 S Street NW",
    name: "Wonder Bread",
    floors: [%{name: "Floor 3"}, %{name: "Floor 4"}]
  }
]

for attrs <- locations_attrs do
  location = Repo.get_by(Location, name: attrs.name)

  if location do
    IO.puts "#{location.name} already exists"
  else
    location =
      %Location{}
      |> Map.merge(attrs)
      |> Repo.insert

    IO.puts "#{location.name} created"
  end
end
