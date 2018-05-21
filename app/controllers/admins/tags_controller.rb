class Admins::TagsController < ApplicationController
	def index
  	@q = SakePost.all_tags.ransack(params[:q])
    @sake_posts_tags = @q.result.order(created_at: :desc).page(params[:page]).per(5)
	end

  def edit
  	@sake_posts_tag = Tag.find(params[:id])
  end

  def update
  	sake_posts_tag = Tag.find(params[:id])
  	sake_posts_tag.update(tag_params)
  	redirect_to admins_tags_path
  end



      private

    def tag_params
   	  params.require(:sake_post).permit(:tag_list)
    end
end
