class Route < ApplicationRecord
  has_many :user_routes
  has_many :users, through: :user_routes
  #
  # def build_route(name)
  #   route = Route.where(name: params[:name]).first
  #   if route.rating
  #     @route = route
  #   else
  #     @route = call_mp(route.route_id)
  #   end
  # end
  #
  # def call_mp(id)
  #   route = HTTParty.get("https://www.mountainproject.com/data/get-routes?routeIds=#{id}&key=#{Rails.application.credentials.mountain_secret}")
  #   name = route.parsed_response["routes"][0]["name"]
  #   stars = route.parsed_response["routes"][0]["stars"]
  #   rating = route.parsed_response["routes"][0]["rating"]
  #   route_image = route.parsed_response["routes"][0]["imgMedium"]
  #   pitch = route.parsed_response["routes"][0]["pitches"]
  #   lat = route.parsed_response["routes"][0]["latitude"]
  #   lng = route.parsed_response["routes"][0]["longitude"]
  #   gon.latt = route.parsed_response["routes"][0]["latitude"]
  #   gon.lngg = route.parsed_response["routes"][0]["longitude"]
  #   Route.update(
  #     stars: stars,
  #     rating: rating,
  #     route_image: route_image,
  #     pitch: pitch,
  #     lat: lat,
  #     lng: lng,
  #
  #   )
  # end
end
