class WelcomeController < ApplicationController

  def index
    if current_user
      @user = current_user
      @user_routes = current_user.routes
    end
  end

  def post
    route = Route.where(name: params[:name]).first
    if route
      session[:route_id] = route.route_id
      redirect_to welcome_yourroute_path
    else
      redirect_to root_path(:id => 1)
    end
  end

  def yourroute
    @route = Route.build_route(session[:route_id])
    @weather = Weather.new(@route.lat, @route.lng)
  end

  def comments
    @route = Route.build_route(session[:route_id])
  end
end
