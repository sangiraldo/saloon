class Admin::EstablishmentsController < Admin::BaseController

  # Methods

  def index
    @search = Establishment.search(params[:q])
    @establishments = @search.result.paginate(page: params[:page], per_page: 10)
  end

  def destroy
    @establishment = Establishment.find(params[:id])
    @establishment.destroy
    redirect_to admin_establishments_url, notice: t('deleted_successfully')
  end

  def search
    index
    render :index
  end

end
