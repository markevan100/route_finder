class WelcomeController < ApplicationController

  def index
    if current_user
      @user = current_user
      @user_routes = current_user.routes
    end 
  end

  def post
    route = Route.where(name: params[:name]).first
    session[:route_id] = route.route_id
    redirect_to welcome_yourroute_path
  end

  def yourroute
    @route = Route.build_route(session[:route_id])
    @weather = Weather.new(@route.lat, @route.lng)
  end

  def comments
    @route = Route.build_route(session[:route_id])
  end
end
