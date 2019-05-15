class UserRoutesController < ApplicationController

  def create
    route = Route.where(route_id: params[:route]).first
    @user_route = UserRoute.create(user: current_user, route: route)
    redirect_to root_path
  end

  def destroy
    route = Route.find(params[:id])
    @user_route = UserRoute.where(user_id: current_user.id, route_id: route.id).first
    @user_route.destroy
    redirect_to root_path
  end
end
