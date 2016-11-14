class EatablesController < ApplicationController
  before_action :set_eatable, only: [:show, :edit, :update, :destroy]

  # GET /eatables
  # GET /eatables.json
  def index
    @eatables = Eatable.all
  end

  # GET /eatables/1
  # GET /eatables/1.json
  def show
  end

  # GET /eatables/new
  def new
    @eatable = Eatable.new
  end

  # GET /eatables/1/edit
  def edit
  end

  # POST /eatables
  # POST /eatables.json
  def create
    @eatable = Eatable.new(eatable_params)

    respond_to do |format|
      if @eatable.save
        format.html { redirect_to @eatable, notice: 'Eatable was successfully created.' }
        format.json { render :show, status: :created, location: @eatable }
      else
        format.html { render :new }
        format.json { render json: @eatable.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /eatables/1
  # PATCH/PUT /eatables/1.json
  def update
    respond_to do |format|
      if @eatable.update(eatable_params)
        format.html { redirect_to @eatable, notice: 'Eatable was successfully updated.' }
        format.json { render :show, status: :ok, location: @eatable }
      else
        format.html { render :edit }
        format.json { render json: @eatable.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /eatables/1
  # DELETE /eatables/1.json
  def destroy
    @eatable.destroy
    respond_to do |format|
      format.html { redirect_to eatables_url, notice: 'Eatable was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_eatable
      @eatable = Eatable.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def eatable_params
      params.fetch(:eatable, {})
    end
end
