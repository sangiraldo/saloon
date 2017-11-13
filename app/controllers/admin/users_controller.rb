class Admin::UsersController < Admin::BaseController

  # Methods

  def index
    @search = User.search(params[:q])
    @users = @search.result.paginate(page: params[:page], per_page: 10)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_users_url, notice: t('deleted_successfully')
  end

  def search
    index
    render :index
  end

end
