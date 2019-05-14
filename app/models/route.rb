class Route < ApplicationRecord
  require 'open-uri'
  require 'nokogiri'

  has_many :user_routes
  has_many :users, through: :user_routes

  def self.build_route(id)
    route = Route.where(route_id: id).first
    if route.rating
      route
    else
      id = route.route_id
      response = route.call_mp(id)
      route.set_attributes(response)
      comments = route.scrape_mp(id)
      route.set_comments(comments)
      route
    end
  end

  def call_mp(id)
    response = HTTParty.get("https://www.mountainproject.com/data/get-routes?routeIds=#{id}&key=#{Rails.application.credentials.mountain_secret}")
    response.parsed_response
  end

  def set_attributes(response)
    response = response["routes"][0]
   stars = response["stars"]
   rating = response["rating"]
   route_image = response["imgMedium"]
   pitch = response["pitches"]
   lat = response["latitude"]
   lng = response["longitude"]

   self.update(
     stars: stars,
     rating: rating,
     image: route_image,
     pitch: pitch,
     lat: lat,
     lng: lng
   )
  end

  def scrape_mp(id)
    doc = Nokogiri::HTML(open("https://www.mountainproject.com/route/#{id}"))
    doc.css('.comment-body')
  end

  def set_comments(comments)
    if comments.count > 1
      first = comments.first.text.split(" \n")[0].strip
      last = comments.last.text.split(" \n")[0].strip
    elsif comments.count == 1
      first = "This route currently only has one comment"
      last = comments.last.text.split(" \n")[0].strip
    else
      first = "Sorry, no comments for this route"
      last = "Sorry, no comments for this route"
    end
    self.update(
      old_comment: first,
      new_comment: last
    )
  end
end
