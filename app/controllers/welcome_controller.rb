class WelcomeController < ApplicationController
  
  def index
  end

  def post
    route = Route.where(name: params[:name]).first
    @@id = route.route_id
    redirect_to welcome_yourroute_path
  end

  def yourroute
    @route = Route.build_route(@@id)
    @weather = Weather.new(@route.lat, @route.lng)
  end

  def comments
    @route = Route.build_route(@@id)
  end
end
