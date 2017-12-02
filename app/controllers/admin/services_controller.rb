class Admin::ServicesController < Admin::BaseController
  before_action :set_service, only: [:show, :edit, :update, :destroy]

  def index
    @services = Service.all.paginate(page: params[:page], per_page: 10)
  end

  def show
  end

  def new
    @service = Service.new
  end

  def edit
  end

  def create
    @service = Service.new(service_params)
    if @service.save
      redirect_to admin_services_url, notice: t('created_successfully')
    else
      flash[:alert] = @service.errors.values.first.first
      render :new
    end
  end

  def update
    if @service.update(service_params)
      redirect_to admin_services_url, notice: t('updated_successfully')
    else
      flash[:alert] = @service.errors.values.first.first
      render :edit
    end
  end

  def destroy
    @service.destroy
    respond_to do |format|
      format.html { redirect_to admin_services_url, notice: t('deleted_successfully') }
      format.json { head :no_content }
    end
  end

  private
    def set_service
      @service = Service.find(params[:id])
    end

    def service_params
      params.require(:service).permit(:name, :description)
    end
end
