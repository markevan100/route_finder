class User < ApplicationRecord
  has_many :user_routes
  has_many :routes, through: :user_routes
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

 def route_already_added?(route_id)
   route = Route.where(route_id: route_id).first
   return false unless route
   user_routes.where(route_id: route.id).exists?
 end

 def under_route_limit?
   (user_routes.count < 10)
 end

 def can_add_route?(route_id)
   under_route_limit? && !route_already_added?(route_id)
 end
end
