import Ecto.Model

alias WeWorkForBeer.Location
alias WeWorkForBeer.Repo

locations_attrs = [
  %{
    name: "Congress",
    address: "600 Congress Ave"
  },
  %{
    name: "Berkeley",
    address: "2120 University Avenue"
  },
  %{
    name: "Fort Point",
    address: "51 Melcher Street",
    floor_ids: [1, 2, 3, 4]
  },
  %{
    name: "South Station",
    address: "745 Atlantic Ave"
  },
  %{
    name: "River North",
    address: "111 West Illinois St"
  },
  %{
    name: "West Loop",
    address: "210 N Green St"
  },
  %{
    name: "Herzliya",
    address: "1 Shankar St"
  },
  %{
    name: "Soho London",
    address: "2 Sheraton St"
  },
  %{
    name: "South Bank",
    address: "22 Upper Ground"
  },
  %{
    name: "Devonshire Square",
    address: "9 Devonshire Square"
  },
  %{
    name: "Hollywood",
    address: "7083 Hollywood Boulevard"
  },
  %{
    name: "Fine Arts Building",
    address: "811 W. 7th Street"
  },
  %{
    name: "Lincoln Road",
    address: "350 Lincoln Road"
  },
  %{
    name: "42nd Street",
    address: "205 E 42nd St"
  },
  %{
    name: "Bryant Park",
    address: "54 W. 40th Street"
  },
  %{
    name: "Charging Bull",
    address: "25 Broadway"
  },
  %{
    name: "Empire State",
    address: "349 5th Avenue"
  },
  %{
    name: "FiDi",
    address: "85 Broad Street"
  },
  %{
    name: "Fulton Center",
    address: "222 Broadway"
  },
  %{
    name: "Gramercy",
    address: "120 E. 23rd St"
  },
  %{
    name: "Madison",
    address: "261 Madison Avenue"
  },
  %{
    name: "Meatpacking",
    address: "1 Little West 12th Street"
  },
  %{
    name: "NoMad",
    address: "79 Madison Ave"
  },
  %{
    name: "Park South",
    address: "401 Park Avenue South"
  },
  %{
    name: "Soho",
    address: "154 Grand Street"
  },
  %{
    name: "Soho West",
    address: "175 Varick Street"
  },
  %{
    name: "West Broadway",
    address: "379 West Broadway"
  },
  %{
    name: "Chelsea",
    address: "115 W 18th St"
  },
  %{
    name: "DUMBO",
    address: "81 Prospect Street",
    floor_ids: [5, 6, 7]
  },
  %{
    name: "Custom House",
    address: "220 NW 8th Avenue"
  },
  %{
    name: "Golden Gate",
    address: "25 Taylor Street"
  },
  %{
    name: "SOMA",
    address: "156 2nd Street"
  },
  %{
    name: "Transbay",
    address: "535 Mission Street"
  },
  %{
    name: "South Lake Union",
    address: "500 Yale Avenue North"
  },
  %{
    name: "Dubnov",
    address: "7 Dubnov"
  },
  %{
    name: "Chinatown",
    address: "718 7th Street NW"
  },
  %{
    name: "Dupont Circle",
    address: "1875 Connecticut Ave NW"
  },
  %{
    name: "Wonder Bread Factory",
    address: "641 S Street NW"
  },
  %{
    name: "Weteringschans",
    address: "Weteringschans 165, Amsterdam, 1017XD"
  }
]

for location_attrs <- locations_attrs do
  location = %Location{}
  location = Map.merge(location, location_attrs)
  Repo.insert(location)
end
