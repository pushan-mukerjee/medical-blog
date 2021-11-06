module ArticlesHelper
  def button_text
    if controller.action_name == "new"
       return "Create Article"
    elsif controller.action_name == "edit"
       return "Modify Article"
    else
       return "Submit"
    end
  end
end
