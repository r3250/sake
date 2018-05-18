class RetiresController < ApplicationController
	before_action :authenticate_user!
  def new
  	@retire = Retire.new
  end
  def create
  	retire = Retire.new(retire_params)
  	retire.user_id = current_user.id
  	retire.save
  	retire = User.find(current_user.id)
  	retire.destroy
  	retire.update(email: retire.deleted_at.to_i.to_s + '_' + retire.email.to_s)
  	redirect_to root_path
  end

  private

  def retire_params
  	params.require(:retire).permit(:retire_reason)
  end


end
