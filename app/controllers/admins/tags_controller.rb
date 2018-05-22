class Admins::TagsController < ApplicationController
	def index
  	@sake_posts_tags = SakePost.all_tags.page(params[:page]).per(10)
	end

  def edit
  	@sake_posts_tag = Tag.find(params[:id])
  end

  def update
  	sake_posts_tag = Tag.find(params[:id])
  	sake_posts_tag.update(tag_params)
  	redirect_to admins_tags_path
  end

  def destroy
    sake_posts_tag = Tag.find(params[:id])
    sake_posts_tag.destroy
    redirect_to admins_tags_path
  end

    private

    def tag_params
   	  params.require(:tag).permit(:name)
    end
end
