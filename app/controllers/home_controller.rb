class HomeController < ApplicationController
  def index
  	@rooms= Room.all.order("RANDOM()").limit(3)
  	@testimonials= Testimonial.all.limit(2)
  	@testimonialsR= Testimonial.all.order("RANDOM()").limit(2)
  end
end
