class WelcomeController < ApplicationController
  def index
   redirect_to articles_path if logged_in?
   @greeting = "Medical Blog"
  end

  def about
   @aboutText = "Turna Mukherjee's medical blog"
  end

end
