class Admins::TagsController < ApplicationController
  def edit
  	@sake_posts_tags = Tag.find(params[:id])
  end
end
