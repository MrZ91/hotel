module ApplicationHelper
  def random_lorempixel
    x=rand(600..800)
    y=rand(800..1024)
    "http://lorempixel.com/#{x}/#{y}/city"
  end

end
