class AssessmentTypesController < ApplicationController
  before_action :set_assessment_type, only: [:show, :edit, :update, :destroy]
  before_action :scoped_year

  # GET /assessment_types
  # GET /assessment_types.json
  def index
    @assessment_types = scoped_year.assessment_types.all
    @assessment_types = scoped_year.assessment_types.report_type(params[:report_type])
  end

  # GET /assessment_types/1
  # GET /assessment_types/1.json
  def show
    # page variables
    @page_header = @assessment_type.name
  end

  # GET /assessment_types/new
  def new
    @assessment_type = AssessmentType.new
  end

  # GET /assessment_types/1/edit
  def edit
  end

  # POST /assessment_types
  # POST /assessment_types.json
  def create
    @assessment_type = AssessmentType.new(assessment_type_params)
    authorize @assessment_type

    record = @assessment_type
    respond_to do |format|
      if @assessment_type.save
        format.html { redirect_to @assessment_type, notice: 'Assessment type was successfully created.' }
        format.json { render :show, status: :created, location: @assessment_type }
      else
        format.html { render :new }
        format.json { render json: @assessment_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /assessment_types/1
  # PATCH/PUT /assessment_types/1.json
  def update
    authorize @assessment_type
    respond_to do |format|
      if @assessment_type.update(assessment_type_params)
        format.html { redirect_to @assessment_type, notice: 'Assessment type was successfully updated.' }
        format.json { render :show, status: :ok, location: @assessment_type }
      else
        format.html { render :edit }
        format.json { render json: @assessment_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /assessment_types/1
  # DELETE /assessment_types/1.json
  def destroy
    authorize @assessment_type
    @assessment_type.destroy
    respond_to do |format|
      format.html { redirect_to assessment_types_url, notice: 'Assessment type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_assessment_type
      @assessment_type = scoped_year.assessment_types.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def assessment_type_params
      params.require(:assessment_type).permit(:name, :description)
    end

    def scoped_year
      Year.find_by name: '2016'
    end
end
