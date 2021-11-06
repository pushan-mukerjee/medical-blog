# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

#Gets rid of field_with_error class in the articles view which Rails adds to input field 
ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
   html_tag.html_safe
end
