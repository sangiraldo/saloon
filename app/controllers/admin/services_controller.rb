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

    respond_to do |format|
      if @service.save
        format.html { redirect_to admin_services_url, notice: t('created_successfully') }
        format.json { render :show, status: :created, location: @service }
      else
        format.html { render :new }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @service.update(service_params)
        format.html { redirect_to admin_services_url, notice: t('updated_successfully') }
        format.json { render :show, status: :ok, location: @service }
      else
        format.html { render :edit }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
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
