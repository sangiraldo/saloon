class EstablishmentsController < ApplicationController
  before_action :set_establishment, only: [:show, :edit, :update, :destroy]

  # GET /establishments
  # GET /establishments.json
  def index
    @search = Establishment.search(params[:q])
    if params[:tag]
      @establishments = @search.result.tagged_with(params[:tag]).order(created_at: :desc).paginate(page: params[:page], per_page: 8)
    else
      @establishments = @search.result.order(created_at: :desc).paginate(page: params[:page], per_page: 8)
    end
    @tag_establishments = Establishment.tag_counts.last(5)
    @tag_establishment_count = Establishment.tag_counts.count
    @cities = Establishment.distinct.pluck(:city)
  end

  # GET /establishments/1
  # GET /establishments/1.json
  def show
    @services = @establishment.tag_list
  end

  # GET /establishments/new
  def new
    @establishment = Establishment.new
  end

  # GET /establishments/1/edit
  def edit
    unless @establishment.user_id == current_user.id
      redirect_to establishment_url
    end
  end

  # POST /establishments
  # POST /establishments.json
  def create
    @establishment = Establishment.new(establishment_params)
    if @establishment.save
      redirect_to @establishment, notice: t('created_successfully')
    else
      flash[:alert] = @establishment.errors.values.first.first
      render :new
    end
  end

  # PATCH/PUT /establishments/1
  # PATCH/PUT /establishments/1.json
  def update
    if @establishment.update(establishment_params)
      redirect_to @establishment, notice: t('updated_successfully')
    else
      flash[:alert] = @establishment.errors.values.first.first
      render :new
    end
  end

  # DELETE /establishments/1
  # DELETE /establishments/1.json
  def destroy
    @establishment.destroy
    respond_to do |format|
      format.html { redirect_to establishments_url, notice: 'Establishment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def user_establishment
    @establishments = Establishment.where(user_id: current_user.id).paginate(page: params[:page], per_page: 8)
  end

  def services
    @tag_establishments = Establishment.tag_counts
  end

  def search
    index
    render :index
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_establishment
      @establishment = Establishment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def establishment_params
      params.require(:establishment).permit(:name, :description, :address, :city, :district, :image, tag_list:[]).merge(user_id: current_user.id)
    end
end
