class Weather
  attr_reader :temp, :humidity, :wind, :description
  def initialize(lat, lng)
    call_weather_api(lat, lng)
  end

  def call_weather_api(lat, lng)
    response = HTTParty.get("https://api.openweathermap.org/data/2.5/weather?lat=#{lat}&lon=#{lng}&units=imperial&APPID=#{Rails.application.credentials.weather_secret}")
    parsed_response = response.parsed_response
    set_attributes(parsed_response)
  end

  def set_attributes(parsed_response)
    @temp = parsed_response["main"]["temp"]
    @humidity = parsed_response["main"]["humidity"]
    @wind = parsed_response["wind"]["speed"]
    @description = parsed_response["weather"][0]["description"]
  end
end



=begin
weather = HTTParty.get("https://api.openweathermap.org/data/2.5/weather?lat=#{lat}&lon=#{lng}&units=imperial&APPID=#{Rails.application.credentials.weather_secret}")
@temp = weather.parsed_response["main"]["temp"]
@humidity = weather.parsed_response["main"]["humidity"]
@wind = weather.parsed_response["wind"]["speed"]
@description = weather.parsed_response["weather"][0]["description"]
@image = @@route_image
=end
