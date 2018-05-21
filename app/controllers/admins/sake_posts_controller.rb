class Admins::SakePostsController < ApplicationController
  def index
  	@sake_posts_tags = SakePost.all_tags
  end

  def edit
  	@sake_posts_tags = SakePost.tags.find(params[:id])
  end

  def update
  end

  def destroy
  end

    private

    def tag_params
   	  params.require(:sake_post).permit(:tag_list)
    end
end


