class Admins::TagsController < ApplicationController
    before_action :authenticate_admin!
	def index
    @q = SakePost.all_tags.ransack(params[:q])
  	@sake_posts_tags = @q.result.page(params[:page]).per(10)
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
