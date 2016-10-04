class AssessmentUnitsController < ApplicationController
  before_action :set_assessment_unit, only: [:show, :edit, :update, :destroy]

  # GET /assessment_units
  # GET /assessment_units.json
  def index
    @assessment_units = AssessmentUnit.all
  end

  # GET /assessment_units/1
  # GET /assessment_units/1.json
  def show
  end

  # GET /assessment_units/new
  def new
    @assessment_unit = AssessmentUnit.new
  end

  # GET /assessment_units/1/edit
  def edit
  end

  # POST /assessment_units
  # POST /assessment_units.json
  def create
    @assessment_unit = AssessmentUnit.new(assessment_unit_params)

    respond_to do |format|
      if @assessment_unit.save
        format.html { redirect_to @assessment_unit, notice: 'Assessment unit was successfully created.' }
        format.json { render :show, status: :created, location: @assessment_unit }
      else
        format.html { render :new }
        format.json { render json: @assessment_unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /assessment_units/1
  # PATCH/PUT /assessment_units/1.json
  def update
    respond_to do |format|
      if @assessment_unit.update(assessment_unit_params)
        format.html { redirect_to @assessment_unit, notice: 'Assessment unit was successfully updated.' }
        format.json { render :show, status: :ok, location: @assessment_unit }
      else
        format.html { render :edit }
        format.json { render json: @assessment_unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /assessment_units/1
  # DELETE /assessment_units/1.json
  def destroy
    @assessment_unit.destroy
    respond_to do |format|
      format.html { redirect_to assessment_units_url, notice: 'Assessment unit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_assessment_unit
      @assessment_unit = AssessmentUnit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def assessment_unit_params
      params.require(:assessment_unit).permit(:name, :description)
    end
end
