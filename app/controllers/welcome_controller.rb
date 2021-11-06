class WelcomeController < ApplicationController
  def index
   redirect_to articles_path if logged_in?
   @greeting = "Medical Blog" 
  end

  def about
   @aboutText = "This is Turna Mukherjee's medical blog. An app for me and my buddies to create medical topics and articles, linking each article to one or more topics"
  end

end
