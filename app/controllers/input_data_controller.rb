class InputDataController < ApplicationController
  before_action :set_input_datum, only: [:show, :edit, :update, :destroy]

  # GET /input_data
  # GET /input_data.json
  def index
    @input_data = InputDatum.all
  end

  # GET /input_data/1
  # GET /input_data/1.json
  def show
  end

  # GET /input_data/new
  def new
    @form = Form.find(params[:form_id])
    @temp_data = []
    @form.parts.each do |p|
      p.items.each do |i|
        if !i.input_datum.present?
          i.input_datum = InputDatum.new
        end
        @temp_data << i.input_datum
      end
    end
    @temp_data = @temp_data.reverse
  end

  # GET /input_data/1/edit
  def edit
  end

  # POST /input_data
  # POST /input_data.json
  def create
    respond_to do |format|
      if @input_datum.update(params[:input_data].keys, params[:input_data].values)
        format.html { redirect_to @input_datum, notice: 'Input datum was successfully created.' }
        format.json { render :show, status: :created, location: @input_datum }
      else
        format.html { render :new }
        format.json { render json: @input_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /input_data/1
  # PATCH/PUT /input_data/1.json
  def update
    respond_to do |format|
      if @input_datum.update(input_datum_params)
        format.html { redirect_to @input_datum, notice: 'Input datum was successfully updated.' }
        format.json { render :show, status: :ok, location: @input_datum }
      else
        format.html { render :edit }
        format.json { render json: @input_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /input_data/1
  # DELETE /input_data/1.json
  def destroy
    @input_datum.destroy
    respond_to do |format|
      format.html { redirect_to input_data_url, notice: 'Input datum was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_input_datum
      @input_datum = InputDatum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def input_datum_params
      params.require(:input_datum).permit(:content, :item_id)
    end
end
