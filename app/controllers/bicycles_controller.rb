class BicyclesController < ApplicationController
  before_action :authenticate_admin! , only: [:new,:create,:edit,:update,:destroy]
  before_action :set_bicycle, only: [:show, :edit, :update, :destroy]

  # GET /bicycles
  # GET /bicycles.json
  def index
    @bicycles = Bicycle.all
  end

  # GET /bicycles/1
  # GET /bicycles/1.json
  def show
  end

  # GET /bicycles/new
  def new
    @bicycle = Bicycle.new

  end

  # GET /bicycles/1/edit
  def edit
  end

  # POST /bicycles
  # POST /bicycles.json
  def create
    @bicycle = Bicycle.new(bicycle_params)

    respond_to do |format|
      if @bicycle.save
        format.html { redirect_to admin_pages_index_path, notice: 'Bicycle was successfully created.' }
        format.json { render :show, status: :created, location: @bicycle }
      else
        format.html { render :new }
        format.json { render json: @bicycle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bicycles/1
  # PATCH/PUT /bicycles/1.json
  def update
    respond_to do |format|
      if @bicycle.update(bicycle_params)
        format.html { redirect_to admin_pages_index_path, notice: 'Bicycle was successfully updated.' }
        format.json { render :show, status: :ok, location: @bicycle }
      else
        format.html { render :edit }
        format.json { render json: @bicycle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bicycles/1
  # DELETE /bicycles/1.json
  def destroy
    @bicycle.destroy
    respond_to do |format|
      format.html { redirect_to admin_pages_index_path, notice: 'Bicycle was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def search
    @conditions = params[:conditions]

    @result = Bicycle

    if @conditions[:name] != 'true' &&  @conditions[:style] != 'true'
      @result = Bicycle.joins(:style).includes(:style).all
    end

    if @conditions[:name] == 'true'
        @result = @result.joins(:style).includes(:style).search('`bicycles`.name',params[:value][:nameText])
    end

    if @conditions[:style] == 'true'
      @result  = @result.joins(:style).includes(:style).search('`styles`.name',params[:value][:styleText])
    end

    @resultArray = []

    @result.each do |bicycle|

      @newVar = {styleName: bicycle.style.name,bicyleObj: bicycle}


      @resultArray << @newVar

    end

    respond_to do |format|
      format.json { render :json => {'result' => @resultArray } }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bicycle
      @bicycle = Bicycle.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bicycle_params
      params.fetch(:bicycle, {}).permit(:name,:description,:image_link,:price,:style_id)
    end
end
