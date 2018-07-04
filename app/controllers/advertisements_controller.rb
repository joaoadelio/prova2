class AdvertisementsController < ApplicationController
  before_action :set_advertisement, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: :homepage
  load_and_authorize_resource :except => [:homepage]
  # GET /advertisements
  # GET /advertisements.json
  def index
    @advertisements = Advertisement.all
    @advertisements = Advertisement.where("user_id = ?", current_user.id)
  end

  # GET /advertisements/1
  # GET /advertisements/1.json
  def show
    @adver = Advertisement.find(params[:id])
    if(@adver.visualizacao.nil?)
      @view = 1
    else
      @view = @adver.visualizacao + 1;
    end

    Advertisement.all.update(@adver.id, :visualizacao => @view)
    @atu =  Advertisement.all.where(category_id: @adver.category_id) unless params[:id].blank?
  end

  # GET /advertisements/new
  def new
    @advertisement = Advertisement.new
  end

  def homepage
    @advertisements = Advertisement.all.order("visualizacao DESC, titulo ASC")
    @advertisements = @advertisements.where(category: params[:category_id]) unless params[:category_id].blank?
    @advertisements = @advertisements.where("UPPER(titulo) like ?", "%#{params[:search_term].to_s.upcase}%") unless params[:search_term].blank?
  end

  # GET /advertisements/1/edit
  def edit
  end

  # POST /advertisements
  # POST /advertisements.json
  def create
    @advertisement = Advertisement.new(advertisement_params)
    @advertisement.user = current_user
    respond_to do |format|
      if @advertisement.save
        format.html { redirect_to @advertisement, notice: 'Advertisement was successfully created.' }
        format.json { render :show, status: :created, location: @advertisement }
      else
        format.html { render :new }
        format.json { render json: @advertisement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /advertisements/1
  # PATCH/PUT /advertisements/1.json
  def update
    respond_to do |format|
      if @advertisement.update(advertisement_params)
        format.html { redirect_to @advertisement, notice: 'Advertisement was successfully updated.' }
        format.json { render :show, status: :ok, location: @advertisement }
      else
        format.html { render :edit }
        format.json { render json: @advertisement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /advertisements/1
  # DELETE /advertisements/1.json
  def destroy
    @advertisement.destroy
    respond_to do |format|
      format.html { redirect_to advertisements_url, notice: 'Advertisement was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_advertisement
      @advertisement = Advertisement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def advertisement_params
      params.require(:advertisement).permit(:titulo, :descricao, :preco, :visualizacao, {imagens: []}, :remove_imagens, :category_id)
    end
end
