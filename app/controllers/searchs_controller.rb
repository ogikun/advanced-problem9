class SearchsController < ApplicationController
  def search
    @content = params[:content]
    @model = params[:model]
    how = params[:how]
    @results = howToSearch(@model,how,@content)
  end
  
  private
  
  def howToSearch(model,how,content)
    if model == "User"
      if how == "match"
        User.where(name: content)
      elsif how == "forward"
        User.where("name LIKE ?", "#{content}%")
      elsif how == "backward"
        User.where("name LIKE ?", "%#{content}")
      else
        User.where("name LIKE ?", "%#{content}%")
      end
    else
      if how == "match"
        Book.where(title: content)
      elsif how == "forward"
        Book.where("title LIKE ?", "#{content}%")
      elsif how == "backward"
        Book.where("title LIKE ?", "%#{content}")
      else
        Book.where("title LIKE ?", "%#{content}%")
      end
    end
  end
end